import 'package:fake_store_app/presentation/screens/home_page/app_bar/search_form_appbar.dart';
import 'package:fake_store_app/presentation/screens/products_category_page/product_list_category/product_list_cart_category.dart';
import 'package:flutter/material.dart';

class ProductsByCategory extends StatelessWidget {
  final String category;

  const ProductsByCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: const SearchFormAppbar(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
          ),
        ),
      ),
      body: ProductListCartCategory(
        category: category,
      ),
    );
  }
}
