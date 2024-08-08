import 'package:fake_store_app/config/theme/app_theme.dart';
import 'package:fake_store_app/presentation/providers/favorites_products/favorite_product_list_provider.dart';
import 'package:fake_store_app/presentation/providers/products_category/products_category_provider.dart';
import 'package:fake_store_app/presentation/providers/shop_page_products/product_list_provider.dart';
import 'package:fake_store_app/presentation/screens/home_page/app_bar/search_form_appbar.dart';
import 'package:fake_store_app/presentation/screens/home_page/button_navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:fake_store_app/presentation/providers/product_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // controller para cambiar de ruta
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ProductListProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProductListProvider()),
        ChangeNotifierProvider(create: (_) => ProductsCategoryProvider()),
      ],
      child: MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              title: const SearchFormAppbar(),
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.0)),
              ),
            ),
          ),
          body: Obx(() => controller.screens[controller.selectedIndex.value]),
          bottomNavigationBar: const Navbar(),
        ),
      ),
    );
  }
}
