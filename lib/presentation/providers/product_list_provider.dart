import 'package:fake_store_app/config/helpers/get_list_products.dart';
import 'package:fake_store_app/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductListProvider with ChangeNotifier {
  List<Product> _products = [];
  final _getListProducts = GetListProducts();
  int _totalProductsCount = 0;

  List<Product> get products => _products;
  int get totalProductsCount => _totalProductsCount;

  Future<void> fetchProducts([int? limit]) async {
    try {
      _products = await _getListProducts.getListProducts(limit);
      _totalProductsCount = _products.length;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
