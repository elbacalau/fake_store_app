import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/presentation/providers/products_category/products_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListCartCategory extends StatefulWidget {
  final String category;

  const ProductListCartCategory({super.key, required this.category});

  @override
  State<ProductListCartCategory> createState() =>
      _ProductListCartCategoryState();
}

class _ProductListCartCategoryState extends State<ProductListCartCategory> {
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final listProducts =
        Provider.of<ProductsCategoryProvider>(context, listen: false);

    await listProducts.fetchProdByCategory(widget.category);
    setState(() {
      isDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listProducts = context.watch<ProductsCategoryProvider>();
    final List<Product> products = listProducts.productsByCategory;

    return isDataLoaded
        ? ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                child: ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                ),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
