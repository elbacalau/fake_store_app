import 'package:fake_store_app/config/helpers/get_products_card.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/domain/entities/product.dart';

class ProductProvider with ChangeNotifier {
  final GetProducts getProducts = GetProducts();
  final Map<int, Product?> _products = {};

  Product? getProduct(int id) => _products[id];

  Future<void> loadProduct(int id) async {
    try {
      final product = await getProducts.getProduct(id);
      _products[id] = product;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
