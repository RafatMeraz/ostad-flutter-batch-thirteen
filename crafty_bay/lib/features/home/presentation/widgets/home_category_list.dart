import 'package:flutter/material.dart';

import '../../../shared/presentation/widgets/category_card.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          return CategoryCard();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 6);
        },
      ),
    );
  }
}
