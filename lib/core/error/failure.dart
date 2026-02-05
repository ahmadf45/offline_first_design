// core/error/failure.dart
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('No internet connection');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('Session expired');
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super('Unexpected error occurred');
}
