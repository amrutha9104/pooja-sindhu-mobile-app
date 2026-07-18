import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/core/config/app_config.dart';
import 'package:pooja_sindhu/core/network/auth_interceptor.dart';
import 'package:pooja_sindhu/core/network/secure_storage_provider.dart';

final appConfigApiBaseUrlProvider =
    Provider<String>((ref) => AppConfig.apiBaseUrl);

final dioProvider = Provider<Dio>((ref) {
  final secureStorage = ref.watch(secureStorageServiceProvider);
  final dio = Dio(BaseOptions(
    baseUrl: ref.watch(appConfigApiBaseUrlProvider),
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {'Content-Type': 'application/json'},
  ));
  dio.interceptors.addAll([
    AuthInterceptor(secureStorage, ref),
    LogInterceptor(
      requestBody: kDebugMode,
      responseBody: kDebugMode,
    ),
  ]);
  return dio;
});
