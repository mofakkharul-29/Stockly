import 'package:stockly/features/products/data/models/product_dto.dart';
import 'package:stockly/features/products/domain/paged_products.dart';

class ProductsPageDto {
  final List<Map<String, dynamic>> products;
  final int total;
  final int limit;
  final int skip;

  const ProductsPageDto({
    required this.products,
    required this.total,
    required this.limit,
    required this.skip,
  });

  PagedProducts toPagedProduct() {
    final items = products.map((item) => ProductDto)
  }
}
