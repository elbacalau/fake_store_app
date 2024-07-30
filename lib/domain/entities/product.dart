class Product {
  final int id;
  final String title;
  final String? imageUrl;
  final double price;
  final String? desc;

  Product(
    this.id,
    this.desc, {
    required this.title,
    required this.imageUrl,
    required this.price,
  });
}
