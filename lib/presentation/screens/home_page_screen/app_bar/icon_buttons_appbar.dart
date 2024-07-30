import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class IconButtonsAppbar extends StatefulWidget {
  const IconButtonsAppbar({super.key});

  @override
  State<IconButtonsAppbar> createState() => _IconButtonsAppbarState();
}

class _IconButtonsAppbarState extends State<IconButtonsAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          iconSize: 50.0,
          icon: const Icon(
            FluentIcons.person_28_regular,
            color: Colors.white,
          ),
          onPressed: () {
            // Acción para el primer botón
          },
        ),
        IconButton(
          iconSize: 50.0,
          icon: const Icon(
            FluentIcons.settings_28_regular,
            color: Colors.white,
          ),
          onPressed: () {
            // Acción para el segundo botón
          },
        ),
      ],
    );
  }
}
