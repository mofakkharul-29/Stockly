import 'package:dio/dio.dart';
import 'package:stockly/core/error/dio_exception_mapper.dart';
import 'package:stockly/core/error/failure.dart';
import 'package:stockly/features/products/data/product_remote_source.dart';
import 'package:stockly/features/products/domain/paged_products.dart';
import 'package:stockly/features/products/domain/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteSource _remoteSource;

  const ProductRepositoryImpl(this._remoteSource);

  @override
  Future<PagedProducts> getProducts({
    required int limit,
    required int skip,
  }) async {
    try {
      final page = await _remoteSource.fetchProducts(skip: skip, limit: limit);
      return page.toDomain();
    } on DioException catch (e) {
      throw mapDioException(e);
    } on FormatException {
      throw const UnknownFailure('Unexpected response from the server.');
    }
  }
}
