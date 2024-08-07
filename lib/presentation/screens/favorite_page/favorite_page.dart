import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/presentation/providers/favorites_products/favorite_product_list_provider.dart';
import 'package:fake_store_app/presentation/screens/favorite_page/favorite_product_card/favorite_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteList = context.watch<FavoriteProductListProvider>();

    final List<Product> products = favoriteList.favoriteProductList;

    return GestureDetector(
      onTap: () {},
      child: products.isEmpty
          ? const Center(
              child: Text(
                'No tienes productos agregados ❤️',
                style: TextStyle(fontSize: 23.0),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 140,
                crossAxisCount: 1,
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
                    child: FavoriteProductCard(product: product, index: index),
                  ),
                );
              },
            ),
    );
  }
}
