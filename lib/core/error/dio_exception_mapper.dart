import 'package:dio/dio.dart';
import 'package:stockly/core/error/failure.dart';

Failure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      return const NetworkFailure();

    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const TimeoutFailure();

    case DioExceptionType.badResponse:
      return _handleBadResponse(e);

    case DioExceptionType.cancel:
      return const UnknownFailure('Request was cancelled.');

    case DioExceptionType.badCertificate:
      return const UnknownFailure('Security certificate validation failed.');

    case DioExceptionType.unknown:
      return const UnknownFailure();
  }
}

Failure _handleBadResponse(DioException e) {
  final int? statusCode = e.response?.statusCode;
  final String? serverMessage = _extractServerMessage(e.response?.data);

  if (statusCode == 401) {
    return const UnauthorizedFailure();
  }

  if (statusCode == 404) {
    return NotFoundFailure(serverMessage);
  }

  if (statusCode != null && statusCode >= 500) {
    return ServerFailure(statusCode: statusCode);
  }

  return ServerFailure(
    message:
        serverMessage ??
        'Something went wrong with your request. Please check and try again.',
    statusCode: statusCode,
  );
}

String? _extractServerMessage(Object? data) {
  if (data is Map<String, dynamic>) {
    final message = data['message'];
    if (message is String && message.trim().isNotEmpty) {
      return message;
    }
  }
  return null;
}
