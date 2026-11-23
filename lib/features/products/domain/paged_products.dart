import 'package:stockly/features/products/domain/product.dart';

class PagedProducts {
  final List<Product> items;
  final int total;
  final int skip;

  const PagedProducts({
    required this.items,
    required this.total,
    required this.skip,
  });

  bool get hasMore => (skip + items.length) < total;
}
