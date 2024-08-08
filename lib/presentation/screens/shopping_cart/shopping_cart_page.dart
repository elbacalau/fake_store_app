import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        children: [
          SizedBox(
            height: 560.0,
            child: Placeholder(),
          ),
          SizedBox(
            height: 250.0,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
