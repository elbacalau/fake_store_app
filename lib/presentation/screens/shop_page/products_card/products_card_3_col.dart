import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/presentation/providers/product_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard3Col extends StatelessWidget {
  final int crossSize;
  const ProductCard3Col({
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
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  offset: const Offset(2, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: CardProduct(product: product),
          ),
        );
      },
    );
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            alignment: Alignment.topCenter,
            child: Image.network(
              '${product.imageUrl}',
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            // Titulo del Producto
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(
              product.title,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Text(
              '${product.price} €',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
