import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/presentation/providers/product_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsCard extends StatelessWidget {
  final int crossSize;
  const ProductsCard({
    super.key,
    required this.crossSize,
  });

  @override
  Widget build(BuildContext context) {
    final listProductsProvider = context.watch<ProductListProvider>();

    // ! lista de productos
    final List<Product> products = listProductsProvider.products;

    if (products.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossSize,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    '${product.imageUrl}',
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 20.0),
                  child: Text(
                    '${product.price} €',
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
