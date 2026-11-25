import 'package:dio/dio.dart';
import 'package:stockly/core/constants/api_constants.dart';
import 'package:stockly/features/products/data/models/products_page_dto.dart';

class ProductRemoteSource {
  final Dio dio;

  const ProductRemoteSource(this.dio);

  Future<ProductsPageDto> getRemoteProduct({
    required int skip,
    required int limit,
  }) async {
    final response = await dio.get(
      ApiConstants.products,
      queryParameters: {'skip': skip, 'limit': limit},
    );

    final data = response.data;
  }
}
