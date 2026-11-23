import 'package:flutter_test/flutter_test.dart';
import 'package:stockly/features/products/domain/paged_products.dart';
import 'package:stockly/features/products/domain/product.dart';

Product _fakeProduct(int id) {
  return Product(
    id: id,
    title: 'Test Product $id',
    description: 'Test description for product $id',
    category: 'groceries',
    price: 9.99,
    discountPercentage: 5.0,
    rating: 4.5,
    stock: 25,
    brand: 'TestBrand',
    sku: 'SKU-$id',
    thumbnail: 'https://example.com/thumb_$id.png',
    images: ['https://example.com/img_$id.png'],
    warrantyInformation: '1 year warranty',
    shippingInformation: 'Ships in 1-2 business days',
    availabilityStatus: 'In Stock',
  );
}

List<Product> _fakeProducts(int count, {int startId = 1}) {
  return List.generate(count, (index) => _fakeProduct(startId + index));
}

void main() {
  group('PagedProducts.hasMore', () {
    test('returns true when skip=0, items=10, total=194', () {
      final page = PagedProducts(items: _fakeProducts(10), skip: 0, total: 194);

      expect(page.hasMore, isTrue);
    });

    test('returns false on final page when skip=190, items=4, total=194', () {
      final page = PagedProducts(
        items: _fakeProducts(4, startId: 191),
        skip: 190,
        total: 194,
      );

      expect(page.hasMore, isFalse);
    });

    test(
      'returns false at exact boundary when skip=184, items=10, total=194',
      () {
        final page = PagedProducts(
          items: _fakeProducts(10, startId: 185),
          skip: 184,
          total: 194,
        );

        expect(page.hasMore, isFalse);
      },
    );
  });
}
