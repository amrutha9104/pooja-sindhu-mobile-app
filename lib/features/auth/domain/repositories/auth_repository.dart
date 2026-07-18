import 'package:fpdart/fpdart.dart';
import 'package:pooja_sindhu/core/error/failure.dart';
import 'package:pooja_sindhu/features/auth/domain/auth_state.dart';
import 'package:pooja_sindhu/features/auth/domain/user.dart';

abstract class AuthRepository {
  Stream<AuthState> get authStateStream;
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, bool>> tryRestoreSession();
  User? get currentUser;
}
