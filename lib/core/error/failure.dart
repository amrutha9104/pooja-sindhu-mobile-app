sealed class Failure {
  final String message;

  const Failure(this.message);
}

final class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

final class ServerFailure extends Failure {
  final String? code;

  const ServerFailure(super.message, {this.code});
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.message);
}

final class ValidationFailure extends Failure {
  final List<String> details;

  const ValidationFailure(super.message, this.details);
}

final class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
