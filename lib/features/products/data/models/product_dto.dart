import 'package:stockly/features/products/domain/product.dart';

class ProductDto {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String sku;
  final String thumbnail;
  final List<String> images;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final String? brand;

  const ProductDto({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.sku,
    required this.thumbnail,
    required this.images,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    this.brand,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    final brand = json['brand'];

    return ProductDto(
      id: _readInt(json, 'id'),
      title: _readString(json, 'title'),
      description: _readString(json, 'description'),
      category: _readString(json, 'category'),
      price: _readDouble(json, 'price'),
      discountPercentage: _readDouble(json, 'discountPercentage'),
      rating: _readDouble(json, 'rating'),
      stock: _readInt(json, 'stock'),
      sku: _readString(json, 'sku'),
      thumbnail: _readString(json, 'thumbnail'),
      images: _readStringList(json, 'images'),
      warrantyInformation: _readString(json, 'warrantyInformation'),
      shippingInformation: _readString(json, 'shippingInformation'),
      availabilityStatus: _readString(json, 'availabilityStatus'),
      brand: brand is String ? brand : null,
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      title: title,
      category: category,
      price: price,
      stock: stock,
      sku: sku,
      availabilityStatus: availabilityStatus,
      description: description,
      discountPercentage: discountPercentage,
      rating: rating,
      thumbnail: thumbnail,
      images: images,
      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      brand: brand,
    );
  }
}

int _readInt(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is int) return value;
  throw FormatException('Missing or invalid "$key"');
}

String _readString(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is String) return value;
  throw FormatException('Missing or invalid "$key"');
}

double _readDouble(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is num) return value.toDouble();
  throw FormatException('Missing or invalid "$key"');
}

List<String> _readStringList(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is List) return value.whereType<String>().toList();
  return const [];
}
