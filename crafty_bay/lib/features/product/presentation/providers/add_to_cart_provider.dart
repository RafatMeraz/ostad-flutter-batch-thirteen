import 'package:flutter/foundation.dart';

import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../data/models/add_to_cart_params.dart';

class AddToCartProvider extends ChangeNotifier {
  bool _addToCartInProgress = false;

  bool get addToCartInProgress => _addToCartInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(AddToCartParams params) async {
    bool isSuccess = false;

    _addToCartInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.addToCartUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _addToCartInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
