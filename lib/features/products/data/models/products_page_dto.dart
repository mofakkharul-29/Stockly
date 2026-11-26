import 'package:stockly/features/products/data/models/product_dto.dart';
import 'package:stockly/features/products/domain/paged_products.dart';

class ProductsPageDto {
  final List<ProductDto> products;
  final int total;
  final int skip;

  const ProductsPageDto({
    required this.products,
    required this.total,
    required this.skip,
  });

  factory ProductsPageDto.fromJson(Map<String, dynamic> json) {
    final rawProducts = json['products'];
    final total = json['total'];
    final skip = json['skip'];

    if (rawProducts is! List || total is! int || skip is! int) {
      throw const FormatException('Unexpected products response');
    }

    final List<ProductDto> products = rawProducts.map((item) {
      if (item is! Map<String, dynamic>) {
        throw const FormatException('Unexpected product entry');
      }
      return ProductDto.fromJson(item);
    }).toList();

    return ProductsPageDto(products: products, total: total, skip: skip);
  }

  PagedProducts toDomain() {
    return PagedProducts(
      items: products.map((item) => item.toDomain()).toList(),
      total: total,
      skip: skip,
    );
  }
}
