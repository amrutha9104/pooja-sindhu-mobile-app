import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pooja_sindhu/core/error/failure.dart';
import 'package:pooja_sindhu/core/config/app_config.dart';
import 'package:pooja_sindhu/core/network/auth_state_notifier.dart';
import 'package:pooja_sindhu/core/network/dio_failure_mapper.dart';
import 'package:pooja_sindhu/features/auth/data/datasources/auth_api.dart';
import 'package:pooja_sindhu/features/auth/data/models/auth_dtos.dart';
import 'package:pooja_sindhu/features/auth/data/models/user_model.dart';
import 'package:pooja_sindhu/features/auth/domain/auth_state.dart';
import 'package:pooja_sindhu/features/auth/domain/repositories/auth_repository.dart';
import 'package:pooja_sindhu/features/auth/domain/user.dart';
import 'package:pooja_sindhu/core/storage/secure_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthApi authApi,
    required SecureStorageService secureStorageService,
    GoogleSignIn? googleSignIn,
    AuthStateNotifier? authStateNotifier,
  })  : _authApi = authApi,
        _secureStorageService = secureStorageService,
        _googleSignIn = googleSignIn ??
            GoogleSignIn(
              clientId: AppConfig.googleClientId,
            ),
        _authStateNotifier = authStateNotifier ?? AuthStateNotifier();

  final AuthApi _authApi;
  final SecureStorageService _secureStorageService;
  final GoogleSignIn _googleSignIn;
  final AuthStateNotifier _authStateNotifier;
  final StreamController<AuthState> _controller =
      StreamController<AuthState>.broadcast();
  User? _currentUser;

  @override
  Stream<AuthState> get authStateStream => _controller.stream;

  @override
  User? get currentUser => _currentUser;

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        return const Left(UnauthorizedFailure('Google sign-in was cancelled.'));
      }
      final auth = await account.authentication;
      final idToken = auth.idToken;
      if (idToken == null || idToken.isEmpty) {
        return const Left(UnauthorizedFailure('Google sign-in failed.'));
      }
      final response = await _authApi
          .signInWithGoogle(GoogleSignInRequest(idToken: idToken));
      await _secureStorageService.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
      final user = response.user.toEntity();
      _currentUser = user;
      _authStateNotifier.setAuthenticated(AuthAuthenticated(user));
      _controller.add(AuthAuthenticated(user));
      return Right(user);
    } on DioException catch (e) {
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      try {
        await _authApi.logout();
      } catch (_) {}
      await _secureStorageService.clearTokens();
      _currentUser = null;
      _authStateNotifier.setUnauthenticated();
      _controller.add(AuthUnauthenticated());
      return const Right(null);
    } on DioException catch (e) {
      await _secureStorageService.clearTokens();
      _authStateNotifier.setUnauthenticated();
      _controller.add(AuthUnauthenticated());
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      await _secureStorageService.clearTokens();
      _authStateNotifier.setUnauthenticated();
      _controller.add(AuthUnauthenticated());
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> tryRestoreSession() async {
    final accessToken = await _secureStorageService.getAccessToken();
    final refreshToken = await _secureStorageService.getRefreshToken();
    if (accessToken != null && accessToken.isNotEmpty && refreshToken != null) {
      final user = const User(
        id: 'restored',
        email: 'restored@example.com',
        displayName: 'Restored User',
        role: 'customer',
      );
      _currentUser = user;
      _authStateNotifier.setAuthenticated(AuthAuthenticated(user));
      _controller.add(AuthAuthenticated(user));
      return const Right(true);
    }
    _currentUser = null;
    _authStateNotifier.setUnauthenticated();
    _controller.add(AuthUnauthenticated());
    return const Right(false);
  }
}
