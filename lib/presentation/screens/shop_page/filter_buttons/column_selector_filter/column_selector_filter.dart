import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ColumnSelectorFilter extends StatelessWidget {
  final int selectedCrossASize;
  final Function(int?) onChanged;

  const ColumnSelectorFilter(
      {super.key, required this.selectedCrossASize, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        value: selectedCrossASize,
        onChanged: onChanged,
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
    );
  }
}
