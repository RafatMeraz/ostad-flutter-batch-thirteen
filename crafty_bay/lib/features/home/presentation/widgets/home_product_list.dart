import 'package:flutter/material.dart';

import '../../../shared/presentation/widgets/product_card.dart';

class HomeProductList extends StatelessWidget {
  const HomeProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: .horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) => const ProductCard(),
      ),
    );
  }
}
