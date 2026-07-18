import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/core/config/app_config.dart';
import 'package:pooja_sindhu/core/network/auth_state_notifier.dart';
import 'package:pooja_sindhu/features/auth/data/datasources/auth_api.dart';
import 'package:pooja_sindhu/features/auth/data/models/auth_dtos.dart';
import 'package:pooja_sindhu/core/storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._secureStorage, this._ref);

  final SecureStorageService _secureStorage;
  final Ref _ref;
  Completer<bool>? _refreshCompleter;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _secureStorage.getAccessToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    final originalRequest = err.requestOptions;
    final refreshToken = await _secureStorage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      await _forceLogout();
      handler.next(err);
      return;
    }

    try {
      final refreshed = await _refreshAccessToken(refreshToken);
      if (!refreshed) {
        await _forceLogout();
        handler.next(err);
        return;
      }

      final accessToken = await _secureStorage.getAccessToken();
      final dio = Dio(BaseOptions(baseUrl: originalRequest.baseUrl));
      final retryOptions = Options(
        method: originalRequest.method,
        headers: Map<String, dynamic>.from(originalRequest.headers),
        responseType: originalRequest.responseType,
        contentType: originalRequest.contentType,
        followRedirects: originalRequest.followRedirects,
        receiveDataWhenStatusError: originalRequest.receiveDataWhenStatusError,
        validateStatus: originalRequest.validateStatus,
      );
      if (accessToken != null && accessToken.isNotEmpty) {
        retryOptions.headers ??= {};
        retryOptions.headers!['Authorization'] = 'Bearer $accessToken';
      }
      final response = await dio.request<dynamic>(
        originalRequest.path,
        data: originalRequest.data,
        queryParameters: originalRequest.queryParameters,
        options: retryOptions,
        cancelToken: originalRequest.cancelToken,
        onReceiveProgress: originalRequest.onReceiveProgress,
        onSendProgress: originalRequest.onSendProgress,
      );
      handler.resolve(response);
    } on DioException {
      await _forceLogout();
      handler.next(err);
    }
  }

  Future<bool> _refreshAccessToken(String refreshToken) async {
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }
    _refreshCompleter = Completer<bool>();
    try {
      final dio = Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl));
      final api = AuthApi(dio, baseUrl: AppConfig.apiBaseUrl);
      final response =
          await api.refreshToken(RefreshRequest(refreshToken: refreshToken));
      await _secureStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: refreshToken,
      );
      _refreshCompleter!.complete(true);
      return true;
    } catch (_) {
      _refreshCompleter!.complete(false);
      return false;
    } finally {
      _refreshCompleter = null;
    }
  }

  Future<void> _forceLogout() async {
    await _secureStorage.clearTokens();
    _ref.read(authStateNotifierProvider.notifier).setUnauthenticated();
  }
}
