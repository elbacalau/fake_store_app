import 'package:fake_store_app/domain/entities/product.dart';
import 'package:flutter/material.dart';

class FavoriteProductListProvider with ChangeNotifier {
  final List<Product> _favoriteProductList = [];

  List<Product> get favoriteProductList => _favoriteProductList;

  void addToFavorites(Product product) {
    if (!_favoriteProductList.any((p) => p.id == product.id)) {
      _favoriteProductList.add(product);
      notifyListeners();
    }
  }

  void removeProdcut(int index) {
    if (index >= 0 && index < _favoriteProductList.length) {
      _favoriteProductList.removeAt(index);
      notifyListeners();
    } else {
      throw Exception('Indice invalido');
    }
  }
}
