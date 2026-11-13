sealed class Failure implements Exception {
  final String message;

  const Failure({required this.message});

  @override
  String toString() => message;
}

final class NetworkFailure extends Failure {
  const NetworkFailure()
    : super(message: 'No internet! Please check your internet connection');
}

final class TimeoutFailure extends Failure {
  const TimeoutFailure()
    : super(message: 'The request took too long. Please try again.');
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure()
    : super(message: 'Your sesssion has expired. Please sign in again.');
}

final class ServerFailure extends Failure {
  const ServerFailure()
    : super(message: 'Server error. Please try again later.');
}

final class UnknownFailure extends Failure {
  const UnknownFailure()
    : super(message: 'Something went wrong. Please try again.');
}
