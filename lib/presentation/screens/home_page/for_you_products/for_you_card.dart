import 'package:fake_store_app/domain/entities/product.dart';
import 'package:fake_store_app/presentation/providers/favorites_products/favorite_product_list_provider.dart';
import 'package:fake_store_app/presentation/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForYouCard extends StatefulWidget {
  final int id;
  const ForYouCard({
    super.key,
    required this.id,
  });

  @override
  State<ForYouCard> createState() => _ForYouCardState();
}

class _ForYouCardState extends State<ForYouCard> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).loadProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final product = productProvider.getProduct(widget.id);

    if (product == null) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.all(0.0),
      elevation: 10.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Image.network(
              product.imageUrl ?? '',
              height: 140.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${product.price}€',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      // !boton para agregar productos

                      Provider.of<FavoriteProductListProvider>(context,
                              listen: false)
                          .addToFavorites(product);
                    });
                  },
                  icon: const Icon(
                    Icons.favorite,
                    size: 28.0,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showInfoDialogCard(context, product);
                  },
                  icon: const Icon(
                    Icons.info,
                    size: 28.0,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> showInfoDialogCard(BuildContext context, Product product) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            product.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            side: BorderSide(
              width: 2.0,
              color: Colors.blue,
            ),
          ),
          children: <Widget>[
            Image.network(
              product.imageUrl ?? '',
              height: 140.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                product.desc!,
                style: const TextStyle(fontSize: 19.0, color: Colors.black),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100.0, vertical: 25.0),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Ver producto',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
