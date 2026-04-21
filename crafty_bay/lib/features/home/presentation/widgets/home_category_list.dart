import 'package:crafty_bay/features/shared/presentation/providers/category_list_provider.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widgets/category_card.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Consumer<CategoryListProvider>(
        builder: (context, categoryListProvider, _) {
          if (categoryListProvider.getInitialDataInProgress) {
            return CenterProgressIndicator();
          }

          return ListView.separated(
            itemCount: getCategoryLength(
              categoryListProvider.categoryList.length,
            ),
            scrollDirection: .horizontal,
            itemBuilder: (context, index) {
              return CategoryCard(
                categoryModel: categoryListProvider.categoryList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 6);
            },
          );
        },
      ),
    );
  }

  int getCategoryLength(int length) {
    return length > 10 ? 10 : length;
  }
}
