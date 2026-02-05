// core/error/error_mapper.dart
import 'exceptions.dart';
import 'failure.dart';

class ErrorMapper {
  static Failure map(dynamic error) {
    if (error is ServerException) {
      return ServerFailure(error.message);
    }

    if (error is CacheException) {
      return CacheFailure(error.message);
    }

    if (error is NetworkException) {
      return const NetworkFailure();
    }

    if (error is UnauthorizedException) {
      return const UnauthorizedFailure();
    }

    return const UnknownFailure();
  }
}
