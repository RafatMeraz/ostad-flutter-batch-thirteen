import 'package:crafty_bay/app/extensions/utils_extension.dart';
import 'package:crafty_bay/features/product/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_carousel.dart';
import 'package:crafty_bay/features/product/presentation/widgets/size_picker.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widgets/center_progress_indicator.dart';
import '../providers/product_details_provider.dart';
import '../widgets/price_and_cart_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailsProvider>().getProductDetails(
        widget.productId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Consumer<ProductDetailsProvider>(
        builder: (context, provider, _) {
          if (provider.getProductDetailsInProgress) {
            return const CenterProgressIndicator();
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          if (provider.productDetails == null) {
            return const Center(child: Text('Product details not found'));
          }

          final details = provider.productDetails!;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageCarousel(images: details.photos),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider.productDetails!.title,
                                        style: context.textTheme.bodyLarge,
                                      ),
                                      Row(
                                        children: [
                                          Wrap(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Colors.amber,
                                              ),
                                              Text('4.5'),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text('Reviews'),
                                          ),
                                          Container(
                                            padding: .all(4),
                                            decoration: BoxDecoration(
                                              color: AppColors.themeColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                            const SizedBox(height: 16),
                            ColorPicker(
                              initialValue: 'Red',
                              colors: ['Red', 'Green', 'Black'],
                              onSelected: (String selectedColor) {},
                            ),
                            const SizedBox(height: 16),
                            SizePicker(
                              initialValue: 'L',
                              sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                              onSelected: (String selectedColor) {},
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Description',
                              style: context.textTheme.bodyLarge?.copyWith(
                                fontWeight: .bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's''',
                              style: TextStyle(color: Colors.black54),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PriceAndCartSection(price: details.currentPrice),
            ],
          );
        },
      ),
    );
  }
}
