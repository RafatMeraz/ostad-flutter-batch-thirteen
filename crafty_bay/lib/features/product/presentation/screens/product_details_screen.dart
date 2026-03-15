import 'package:crafty_bay/app/extensions/utils_extension.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_carousel.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../widgets/price_and_cart_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: .start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                mainAxisAlignment: .start,
                                children: [
                                  Text(
                                    'Nike New Shoe DF3434K 2026 Edition',
                                    style: context.textTheme.bodyLarge?.copyWith(
                                      fontWeight: .w600
                                    ),
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Wrap(
                                        children: [
                                          Icon(Icons.star, size: 16, color: Colors.amber),
                                          Text('4.5'),
                                        ],
                                      ),
                                      TextButton(onPressed: () {}, child: Text('Reviews')),
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
                            IncDecButton(onChange: (int value) {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PriceAndCartSection(),
        ],
      ),
    );
  }
}
