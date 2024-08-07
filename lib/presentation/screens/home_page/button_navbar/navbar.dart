import 'package:fake_store_app/presentation/screens/favorite_page/favorite_page.dart';
import 'package:fake_store_app/presentation/screens/home_page/home_page.dart';
import 'package:fake_store_app/presentation/screens/shop_page/shop_page.dart';
import 'package:fake_store_app/presentation/screens/shopping_cart/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 8,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: Obx(
        () => NavigationBar(
          elevation: 10,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          height: 80.0,
          backgroundColor: Colors.white,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'Tienda',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shopping_cart),
              label: 'Carrito',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'Favoritos',
            )
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePageScreen(),
    const ShopPage(),
    const ShoppingCartPage(),
    const FavoritePage(),
  ];
}
