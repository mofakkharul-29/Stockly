import 'package:stockly/features/products/domain/paged_products.dart';
import 'package:stockly/features/products/domain/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<PagedProducts> getProduct({required int limit, required int skip}) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}
