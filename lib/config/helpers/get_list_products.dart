import 'package:dio/dio.dart';
import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/infrastructure/models/product_model.dart';

class GetListProducts {
  final _dio = Dio();
  final baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getListProducts([int? limit]) async {
    final response =
        await _dio.get(limit == null ? baseUrl : "$baseUrl?limit=$limit");

    List<dynamic> data = response.data;

    List<ProductModel> productModels = ProductModel.fromJsonList(data);

    List<Product> products = productModels.map((productModel) {
      return productModel.toProduct();
    }).toList();

    return products;
  }
}
