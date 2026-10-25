import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockly/core/network/dio_client.dart';

final dioProvider = Provider<Dio>((ref) {
  final Dio dio = createDioClient();

  ref.onDispose(() => dio.close(force: true));
  return dio;
});
