import 'package:fake_store_app/domain/entities/product.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
    };
  }

  Product toCardForYou() => Product(
        id,
        title: title,
        imageUrl: image,
        price: price,
        description,
      );

  Product toProduct() => Product(
        id,
        description,
        title: title,
        imageUrl: image,
        price: price,
      );

  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }
}
