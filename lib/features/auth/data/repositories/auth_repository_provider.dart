import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/core/network/api_client.dart';
import 'package:pooja_sindhu/core/network/auth_state_notifier.dart';
import 'package:pooja_sindhu/core/network/secure_storage_provider.dart';
import 'package:pooja_sindhu/features/auth/data/datasources/auth_api.dart';
import 'package:pooja_sindhu/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pooja_sindhu/features/auth/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final secureStorage = ref.watch(secureStorageServiceProvider);
  final authStateNotifier = ref.watch(authStateNotifierProvider.notifier);
  return AuthRepositoryImpl(
    authApi: AuthApi(dio, baseUrl: ref.watch(appConfigApiBaseUrlProvider)),
    secureStorageService: secureStorage,
    authStateNotifier: authStateNotifier,
  );
});
