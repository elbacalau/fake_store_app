import 'package:flutter/material.dart';

class DropFilterMenu extends StatefulWidget {
  const DropFilterMenu({
    super.key,
  });

  @override
  State<DropFilterMenu> createState() => _DropFilterMenuState();
}

class _DropFilterMenuState extends State<DropFilterMenu> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        DropdownMenu(
          width: 160.0,
          label: Text('Prod. Limit'),
          dropdownMenuEntries: [
            DropdownMenuEntry(
              value: 5,
              label: '5',
            ),
            DropdownMenuEntry(
              value: 10,
              label: '10',
            ),
          ],
        ),
      ],
    );
  }
}
