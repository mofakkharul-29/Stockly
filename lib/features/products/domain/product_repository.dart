import 'package:stockly/features/products/domain/paged_products.dart';

abstract interface class ProductRepository {
  Future<PagedProducts> getProducts({required int limit, required int skip});
}
