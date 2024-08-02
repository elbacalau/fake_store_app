import 'package:fake_store_app/presentation/providers/product_list_provider.dart';
import 'package:fake_store_app/presentation/screens/shop_page/products_card/products_card_2_col.dart';
import 'package:fake_store_app/presentation/screens/shop_page/products_card/products_card_3_col.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int selectedCrossASize = 2;
  int defaultLimit = 5;

  @override
  void initState() {
    super.initState();
    final listProducts =
        Provider.of<ProductListProvider>(context, listen: false);
    listProducts.fetchProducts(defaultLimit);
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          value: defaultLimit,
                          onChanged: (int? value) {
                            setState(() {
                              defaultLimit = value!;
                            });
                            Provider.of<ProductListProvider>(context,
                                    listen: false)
                                .fetchProducts(defaultLimit);
                          },
                          items: const [
                            DropdownMenuItem<int>(
                              value: 5,
                              child: Row(
                                children: [
                                  Icon(Iconsax.box, color: Colors.black),
                                  SizedBox(width: 8.0),
                                  Text('5 Productos'),
                                ],
                              ),
                            ),
                            DropdownMenuItem<int>(
                              value: 10,
                              child: Row(
                                children: [
                                  Icon(Iconsax.box, color: Colors.black),
                                  SizedBox(width: 8.0),
                                  Text('10 Productos'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            value: selectedCrossASize,
                            onChanged: (int? value) {
                              setState(
                                () {
                                  selectedCrossASize = value!;
                                },
                              );
                            },
                            items: const [
                              DropdownMenuItem(
                                value: 2,
                                child: Row(
                                  children: [
                                    Icon(Iconsax.grid_2, color: Colors.black),
                                    SizedBox(width: 8.0),
                                    Text('2 Columnas'),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Row(
                                  children: [
                                    Icon(Iconsax.grid_1, color: Colors.black),
                                    SizedBox(width: 8.0),
                                    Text('3 Columnas'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
              child: selectedCrossASize == 2
                  ? const ProductsCard2Col(crossSize: 2)
                  : const ProductCard3Col(crossSize: 3)),
        ],
      ),
    );
  }
}
