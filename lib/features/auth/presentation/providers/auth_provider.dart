import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/core/error/failure.dart';
import 'package:pooja_sindhu/features/auth/data/repositories/auth_repository_provider.dart';
import 'package:pooja_sindhu/features/auth/domain/auth_state.dart';

final authStateProvider = StreamProvider<AuthState>((ref) {
  return ref.watch(authRepositoryProvider).authStateStream;
});

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<void>>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  AuthNotifier(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    final repository = _ref.read(authRepositoryProvider);
    final result = await repository.signInWithGoogle();
    state = result.fold(
      (failure) => AsyncError<void>(failure, StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    final repository = _ref.read(authRepositoryProvider);
    final result = await repository.signOut();
    state = result.fold(
      (failure) => AsyncError<void>(failure, StackTrace.current),
      (_) => const AsyncData(null),
    );
  }
}

String authFailureMessage(Object? error) {
  return error is Failure ? error.message : 'Something went wrong.';
}
