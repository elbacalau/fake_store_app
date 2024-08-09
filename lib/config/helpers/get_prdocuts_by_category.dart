import 'package:dio/dio.dart';
import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/infrastructure/models/product_model.dart';

class GetProductsByCategory {
  final Dio _dio;
  final String baseUrl = 'https://fakestoreapi.com/products/category/';

  GetProductsByCategory([Dio? dio])
      : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
                responseType: ResponseType.json,
                followRedirects: false,
              ),
            );

  Future<List<Product>> getProdByCategory([String? category]) async {
    if (category == null || category.isEmpty) {
      throw ArgumentError('Category cannot be null or empty');
    }

    try {
      final response = await _dio.get('$baseUrl$category');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        List<ProductModel> productModel = ProductModel.fromJsonList(data);

        return productModel.map((p) => p.toProduct()).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection Timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive Timeout');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('Invalid status code: ${e.response?.statusCode}');
      } else {
        throw Exception('Failed to load products: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
