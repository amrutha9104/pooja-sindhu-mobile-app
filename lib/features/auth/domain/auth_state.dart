import 'package:pooja_sindhu/features/auth/domain/user.dart';

sealed class AuthState {}

final class AuthAuthenticated extends AuthState {
  AuthAuthenticated(this.user);

  final User user;
}

final class AuthUnauthenticated extends AuthState {}

final class AuthLoading extends AuthState {}
