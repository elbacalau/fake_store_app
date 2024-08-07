import 'package:fake_store_app/presentation/providers/product_list_provider.dart';
import 'package:fake_store_app/presentation/screens/shop_page/filter_buttons/filter_buttons_menu.dart';
import 'package:fake_store_app/presentation/screens/shop_page/products_card/products_card_2_col.dart';
import 'package:fake_store_app/presentation/screens/shop_page/products_card/products_card_3_col.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int selectedCrossASize = 2;
  int defaultLimit = 0;
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final listProducts =
        Provider.of<ProductListProvider>(context, listen: false);

    await listProducts.fetchProducts();
    setState(
      () {
        defaultLimit = listProducts.products.length;
        isDataLoaded = true;
      },
    );
  }

  void setLimit(int? value) async {
    setState(() {
      defaultLimit = value!;
    });
    await Provider.of<ProductListProvider>(context, listen: false)
        .fetchProducts(defaultLimit);
  }

  void onChangedCol(int? value) {
    setState(() {
      selectedCrossASize = value!;
    });
  }

  void resetState() {
    setState(() {
      setLimit(0);
      selectedCrossASize = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isDataLoaded) {
      return const Center(child: CircularProgressIndicator());
    }

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

            // Widget con las opciones de Filtro
            child: FilterButtonsMenu(
              setLimit: setLimit,
              onChangedCol: onChangedCol,
              resetState: resetState,
              selectedCrossASize: selectedCrossASize,
              defaultLimit: defaultLimit,
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
                : const ProductCard3Col(crossSize: 3),
          ),
        ],
      ),
    );
  }
}
