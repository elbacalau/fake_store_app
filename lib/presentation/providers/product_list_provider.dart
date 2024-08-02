import 'package:fake_store_app/config/helpers/get_list_products.dart';
import 'package:fake_store_app/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductListProvider with ChangeNotifier {
  List<Product> _products = [];
  final _getListProducts = GetListProducts();

  List<Product> get products => _products;

  Future<void> fetchProducts(int limit) async {
    try {
      _products = await _getListProducts.getListProducts(limit);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
