import 'package:crafty_bay/features/cart/presentation/providers/cart_list_provider.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nav_provider.dart';
import '../widgets/cart_item.dart';
import '../widgets/total_price_and_checkout_section.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartListProvider _cartListProvider = CartListProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartListProvider.getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _cartListProvider,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, _) {
          context.read<MainNavProvider>().backToHome();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Carts'),
            leading: IconButton(
              onPressed: context.read<MainNavProvider>().backToHome,
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
          body: Consumer<CartListProvider>(
            builder: (context, _, _) {
              if (_cartListProvider.getCartListInProgress) {
                return CenterProgressIndicator();
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: _cartListProvider.cartList.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          cartModel: _cartListProvider.cartList[index],
                        );
                      },
                      separatorBuilder: (_, _) => SizedBox(height: 8),
                    ),
                  ),
                  TotalPriceAndCheckoutSection(),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
