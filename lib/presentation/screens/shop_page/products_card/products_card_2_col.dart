import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/presentation/providers/shop_page_products/product_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsCard2Col extends StatelessWidget {
  final int crossSize;
  const ProductsCard2Col({
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

    return ProductCardGD(crossSize: crossSize, products: products);
  }
}

class ProductCardGD extends StatelessWidget {
  const ProductCardGD({
    super.key,
    required this.crossSize,
    required this.products,
  });

  final int crossSize;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GridView.builder(
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
                  )
                ],
              ),
              child: CardProduct(product: product),
            ),
          );
        },
      ),
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
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            alignment: Alignment.topCenter,
            child: Image.network(
              '${product.imageUrl}',
              height: 85.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            // Titulo del Producto
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            child: Text(
              '${product.price} €',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
