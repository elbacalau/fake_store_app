import 'package:fake_store_app/presentation/providers/product_list_provider.dart';
import 'package:fake_store_app/presentation/screens/shop_page/filter_product_widget/drop_filter_menu.dart';
import 'package:fake_store_app/presentation/screens/shop_page/products_card/products_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // fuera del arbol de widget para poder actualizar el estado
  int selectedCrossASize = 2;
  @override
  void initState() {
    super.initState();
    Provider.of<ProductListProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Productos',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            alignment: Alignment.topLeft,
            height: 57.0,
            child: Column(
              children: [
                Row(
                  children: [
                    const DropFilterMenu(),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton<int>(
                          value: selectedCrossASize,
                          onChanged: (int? value) {
                            setState(() {
                              selectedCrossASize = value!;
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 2,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 4,
                              child: Text('4'),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.green.shade900,
            thickness: 5.0,
            height: 35.0,
          ),
          Expanded(
            child: ProductsCard(
              crossSize: selectedCrossASize,
            ),
          )
        ],
      ),
    );
  }
}
