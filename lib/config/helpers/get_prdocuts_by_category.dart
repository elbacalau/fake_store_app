import 'package:dio/dio.dart';
import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/infrastructure/models/product_model.dart';

class GetProductsByCategory {
  final _dio = Dio();
  final String baseUrl = 'https://fakestoreapi.com/products/category/';

  Future<List<Product>> getProdByCategory([String? category]) async {
    final response = await _dio.get('$baseUrl$category');

    List<dynamic> data = response.data;

    List<ProductModel> productModel = ProductModel.fromJsonList(data);

    List<Product> products = productModel.map((p) {
      return p.toProduct();
    }).toList();

    return products;
  }
}
