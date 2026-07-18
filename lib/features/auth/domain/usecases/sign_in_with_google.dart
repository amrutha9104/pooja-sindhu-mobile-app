import 'package:fpdart/fpdart.dart';
import 'package:pooja_sindhu/core/error/failure.dart';
import 'package:pooja_sindhu/features/auth/domain/repositories/auth_repository.dart';
import 'package:pooja_sindhu/features/auth/domain/user.dart';

class SignInWithGoogle {
  SignInWithGoogle(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, User>> call() => _repository.signInWithGoogle();
}
