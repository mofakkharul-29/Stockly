sealed class Failure implements Exception {
  final String message;

  const Failure({required this.message});

  @override
  String toString() => '$runtimeType: $message';
}

final class NetworkFailure extends Failure {
  const NetworkFailure([String? customMessage])
    : super(
        message:
            customMessage ??
            'No internet connection. Please check your network and try again.',
      );
}

final class TimeoutFailure extends Failure {
  const TimeoutFailure([String? customMessage])
    : super(
        message:
            customMessage ?? 'The request took too long. Please try again.',
      );
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([String? customMessage])
    : super(
        message:
            customMessage ?? 'Your session has expired. Please sign in again.',
      );
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure([String? customMessage])
    : super(message: customMessage ?? 'The requested item could not be found.');
}

final class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({String? message, this.statusCode})
    : super(message: message ?? 'Server error. Please try again later.');
}

final class UnknownFailure extends Failure {
  const UnknownFailure([String? customMessage])
    : super(
        message: customMessage ?? 'Something went wrong. Please try again.',
      );
}
