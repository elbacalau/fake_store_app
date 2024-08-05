import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DropButtonLimitProd extends StatelessWidget {
  final Function(int?) onChanged;
  final int defaultLimit;

  const DropButtonLimitProd(
      {super.key, required this.onChanged, required this.defaultLimit});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        value: 5,
        onChanged: onChanged,
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
    );
  }
}
