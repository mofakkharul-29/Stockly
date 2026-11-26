import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockly/core/network/dio_client.dart';
import 'package:stockly/features/products/data/product_remote_source.dart';
import 'package:stockly/features/products/data/product_repository_impl.dart';
import 'package:stockly/features/products/domain/product_repository.dart';

final productRemoteSourceProvider = Provider<ProductRemoteSource>((ref) {
  return ProductRemoteSource(ref.watch(dioProvider));
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(ref.watch(productRemoteSourceProvider));
});
