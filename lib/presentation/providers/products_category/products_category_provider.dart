import 'package:fake_store_app/config/helpers/get_prdocuts_by_category.dart';
import 'package:fake_store_app/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductsCategoryProvider with ChangeNotifier {
  List<Product> _productsByCategory = [];
  final getProductsByCategory = GetProductsByCategory();

  List<Product> get productsByCategory => _productsByCategory;

  Future<void> fetchProdByCategory(String category) async {
    try {
      _productsByCategory =
          await getProductsByCategory.getProdByCategory(category);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
