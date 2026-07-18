import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/features/auth/domain/auth_state.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthUnauthenticated());

  bool bootstrapped = false;

  void setAuthenticated(AuthState stateValue) {
    state = stateValue;
    bootstrapped = true;
  }

  void setUnauthenticated() {
    state = AuthUnauthenticated();
    bootstrapped = true;
  }

  void markBootstrapped() {
    bootstrapped = true;
  }
}
