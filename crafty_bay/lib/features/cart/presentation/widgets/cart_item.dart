import 'package:crafty_bay/features/cart/data/models/cart_model.dart';
import 'package:crafty_bay/features/cart/presentation/providers/cart_list_provider.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/widgets/inc_dec_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: AppColors.themeColor.withAlpha(20),
      margin: .symmetric(horizontal: 16),
      color: Colors.white,
      child: Row(
        children: [
          AppNetworkImage(
            url: _getImage(cartModel.productModel.images),
            width: 100,
            height: 80,
            fit: .scaleDown,
          ),
          Expanded(
            child: Padding(
              padding: const .all(8),
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              cartModel.productModel.title,
                              maxLines: 1,
                              overflow: .ellipsis,
                              style: context.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Color: ${cartModel.color ?? 'N/A'}  Size: ${cartModel.size ?? 'N/A'}',
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: Delete from api and update into provider
                        },
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        '${Constants.takaSign}${cartModel.productModel.currentPrice}',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: AppColors.themeColor,
                          fontWeight: .bold,
                        ),
                      ),
                      IncDecButton(
                        initialValue: 1,
                        maxValue: 5,
                        onChange: (int value) {
                          context
                              .read<CartListProvider>()
                              .updateCartItemQuantity(cartModel.id, value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getImage(List<String> urls) {
    return urls.isNotEmpty ? urls.first : '';
  }
}
