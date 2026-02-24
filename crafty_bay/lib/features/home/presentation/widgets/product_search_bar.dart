import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: .search,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        enabledBorder: _border,
        focusedBorder: _border,
        errorBorder: _border,
      ),
    );
  }

  OutlineInputBorder get _border {
    return OutlineInputBorder(
      borderSide: .none,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
