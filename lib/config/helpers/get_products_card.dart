import 'package:dio/dio.dart';
import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/infrastructure/models/product_model.dart';

class GetProducts {
  // final String baseUrl = 'https://fakestoreapi.com/products/2';
  final _dio = Dio();

  Future<Product> getProduct(int id) async {
    final response = await _dio.get('https://fakestoreapi.com/products/$id');

    final product = ProductModel.fromJson(response.data);

    return product.toCardForYou();
  }
}
