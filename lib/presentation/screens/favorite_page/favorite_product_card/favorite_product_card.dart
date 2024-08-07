import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/presentation/providers/favorites_products/favorite_product_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({
    super.key,
    required this.product,
    required this.index,
  });

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            width: 80.0,
            height: 80.0,
            child: Image.network(
              '${product.imageUrl}',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${product.price} €',
                    style: const TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            alignment: Alignment.bottomRight,
            iconSize: 30.0,
            onPressed: () {
              Provider.of<FavoriteProductListProvider>(context, listen: false)
                  .removeProdcut(index);
            },
            icon: const Icon(Icons.remove_circle_outline_sharp),
          )
        ],
      ),
    );
  }
}
