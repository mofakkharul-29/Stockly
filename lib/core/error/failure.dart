sealed class Failure implements Exception {
  final String message;
  const Failure(this.message);
}

final class NetworkFailure extends Failure {
  const NetworkFailure() : super('Please check your internet connection.');
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure()
    : super('Your session is invalid. Please log in again.');
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure() : super('The requested item could not be found.');
}

final class ServerFailure extends Failure {
  const ServerFailure()
    : super('The server encountered a problem. Try again later.');
}

final class UnknownFailure extends Failure {
  const UnknownFailure() : super('Something unexpected went wrong.');
}
