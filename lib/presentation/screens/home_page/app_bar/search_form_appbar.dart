import 'package:flutter/material.dart';

class SearchFormAppbar extends StatefulWidget {
  const SearchFormAppbar({
    super.key,
  });

  @override
  State<SearchFormAppbar> createState() => _SearchFormAppbarState();
}

class _SearchFormAppbarState extends State<SearchFormAppbar> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        prefixIcon: const Icon(Icons.search),

        labelText: 'Buscar',
        labelStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16.0,
          color: Colors.black,
        ),
        // filled: true,
        // fillColor: Colors.orange[200],
      ),
      focusNode: _focusNode,
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      controller: controller,
    );
  }
}
