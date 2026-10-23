import 'package:dio/dio.dart';

Dio createDioClient() {
  final BaseOptions options = BaseOptions(
    baseUrl: 'https://dummyjson.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 10),
    headers: {'Accept': 'application/json'},
  );

  return Dio(options);
}
