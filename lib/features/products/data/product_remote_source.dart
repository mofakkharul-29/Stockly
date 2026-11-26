import 'package:dio/dio.dart';
import 'package:stockly/core/constants/api_constants.dart';
import 'package:stockly/features/products/data/models/products_page_dto.dart';

class ProductRemoteSource {
  final Dio _dio;

  const ProductRemoteSource(this._dio);

  Future<ProductsPageDto> fetchProducts({
    required int skip,
    required int limit,
  }) async {
    final response = await _dio.get(
      ApiConstants.products,
      queryParameters: {'skip': skip, 'limit': limit},
    );

    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw const FormatException('Unexpected response format');
    }
    return ProductsPageDto.fromJson(data);
  }
}
