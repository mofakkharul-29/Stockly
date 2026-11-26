import 'package:flutter_test/flutter_test.dart';
import 'package:stockly/features/products/data/models/product_dto.dart';

Map<String, dynamic> _validJson() => {
  'id': 1,
  'title': 'Essence Mascara Lash Princess',
  'description': 'A popular mascara.',
  'category': 'beauty',
  'price': 9.99,
  'discountPercentage': 10.48,
  'rating': 2.56,
  'stock': 99,
  'brand': 'Essence',
  'sku': 'BEA-ESS-ESS-001',
  'warrantyInformation': '1 week warranty',
  'shippingInformation': 'Ships in 3-5 business days',
  'availabilityStatus': 'In Stock',
  'thumbnail': 'https://example.com/thumbnail.webp',
  'images': ['https://example.com/1.webp'],
};

void main() {
  test('parses a full product', () {
    final product = ProductDto.fromJson(_validJson()).toDomain();

    expect(product.title, 'Essence Mascara Lash Princess');
    expect(product.brand, 'Essence');
    expect(product.images.length, 1);
  });

  test('a missing brand is allowed and becomes null', () {
    final json = _validJson()..remove('brand');

    expect(ProductDto.fromJson(json).toDomain().brand, isNull);
  });

  test('discountPercentage sent as an int is accepted', () {
    final json = _validJson()..['discountPercentage'] = 10;

    expect(ProductDto.fromJson(json).discountPercentage, 10.0);
  });

  test('a missing price throws FormatException', () {
    final json = _validJson()..remove('price');

    expect(() => ProductDto.fromJson(json), throwsFormatException);
  });
}
