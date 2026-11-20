class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String? brand;
  final String sku;
  final String thumbnail;
  final List<String> images;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.stock,
    required this.sku,
    required this.availabilityStatus,
    required this.description,
    required this.discountPercentage,
    required this.rating,
    required this.thumbnail,
    required this.images,
    required this.warrantyInformation,
    required this.shippingInformation,
    this.brand,
  });
}
