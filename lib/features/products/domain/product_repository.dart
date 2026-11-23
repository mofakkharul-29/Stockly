import 'package:stockly/features/products/domain/paged_products.dart';

abstract class ProductRepository {
  Future<PagedProducts> getProduct({required int limit, required int skip});
}
