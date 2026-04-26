import 'package:flutter/foundation.dart';

import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../data/models/cart_model.dart';

class CartListProvider extends ChangeNotifier {
  bool _getCartListInProgress = false;

  bool get getCartListInProgress => _getCartListInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<CartModel> _cartList = [];

  List<CartModel> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool isSuccess = false;

    _getCartListInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.cartListUrl,
    );

    if (response.isSuccess) {
      List<CartModel> carts = [];
      for (Map<String, dynamic> cart in response.body!['data']['results']) {
        carts.add(CartModel.fromJson(cart));
      }
      _cartList = carts;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getCartListInProgress = false;
    notifyListeners();

    return isSuccess;
  }

  int get totalQuantity => _cartList.length;

  double get totalPrice {
    double total = 0;
    for (CartModel cart in _cartList) {
      total += cart.productModel.currentPrice * cart.quantity;
    }
    return total;
  }

  void updateCartItemQuantity(String cartId, int quantity) {
    _cartList.firstWhere((cartItem) => cartItem.id == cartId).quantity =
        quantity;
    notifyListeners();
  }
}
