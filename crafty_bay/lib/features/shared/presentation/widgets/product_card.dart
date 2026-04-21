import 'package:crafty_bay/features/product/data/models/product_model.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import '../../../product/presentation/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: SizedBox(
        width: 180,
        child: Card(
          elevation: 2,
          shadowColor: AppColors.themeColor.withAlpha(30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 180,
                height: 140,
                padding: .all(16),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(20),
                  borderRadius: .only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: AppNetworkImage(url: _getImage(productModel.images)),
              ),
              Padding(
                padding: const .all(8.0),
                child: Column(
                  spacing: 4,
                  children: [
                    Text(
                      productModel.title,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        overflow: .ellipsis,
                      ),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Text(
                          '${Constants.takaSign}${productModel.currentPrice}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.themeColor,
                          ),
                        ),
                        Wrap(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            Text('${productModel.rating}'),
                          ],
                        ),
                        Container(
                          padding: .all(4),
                          decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }

  String _getImage(List<String> urls) {
    return urls.isNotEmpty ? urls.first : '';
  }
}
