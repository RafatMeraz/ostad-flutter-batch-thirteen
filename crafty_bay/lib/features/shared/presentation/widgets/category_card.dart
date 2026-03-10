import 'package:crafty_bay/features/product/presentation/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/utils_extension.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, ProductListScreen.name, arguments: 'Electronic');
      },
      child: Column(
        spacing: 4,
        children: [
          Card(
            color: AppColors.themeColor.withAlpha(20),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.laptop, size: 48, color: AppColors.themeColor),
            ),
          ),
          Text(
            getTitle('Electronic'),
            style: context.textTheme.bodyLarge?.copyWith(
              color: AppColors.themeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String getTitle(String name) {
    if (name.length > 10) {
      return '${name.substring(0, 10)}...';
    } else {
      return name;
    }
  }
}
