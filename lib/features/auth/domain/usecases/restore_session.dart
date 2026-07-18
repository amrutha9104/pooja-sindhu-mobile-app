import 'package:fpdart/fpdart.dart';
import 'package:pooja_sindhu/core/error/failure.dart';
import 'package:pooja_sindhu/features/auth/domain/repositories/auth_repository.dart';

class RestoreSession {
  RestoreSession(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, bool>> call() => _repository.tryRestoreSession();
}
