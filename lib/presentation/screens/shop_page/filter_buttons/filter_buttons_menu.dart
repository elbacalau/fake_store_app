import 'package:fake_store_app/presentation/screens/shop_page/filter_buttons/column_selector_filter/column_selector_filter.dart';
import 'package:fake_store_app/presentation/screens/shop_page/filter_buttons/drop_button_limit_product/drop_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FilterButtonsMenu extends StatelessWidget {
  final int selectedCrossASize;
  final int defaultLimit;

  final Function(int?) setLimit;
  final Function(int?) onChangedCol;
  final Function() resetState;

  const FilterButtonsMenu({
    super.key,
    required this.setLimit,
    required this.onChangedCol,
    required this.resetState,
    required this.selectedCrossASize,
    required this.defaultLimit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
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
              child: DropButtonLimitProd(
                onChanged: setLimit,
                defaultLimit: defaultLimit,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
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
                child: ColumnSelectorFilter(
                  selectedCrossASize: selectedCrossASize,
                  onChanged: onChangedCol,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 17.0),
              child: IconButton(
                onPressed: resetState,
                icon: const Icon(
                  Iconsax.refresh4,
                  size: 35.0,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
