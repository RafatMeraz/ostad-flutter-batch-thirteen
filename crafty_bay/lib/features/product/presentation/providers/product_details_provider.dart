import 'package:flutter/foundation.dart';

import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../data/models/product_details_model.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _getProductDetailsInProgress = false;

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  ProductDetailsModel? _productDetails;

  ProductDetailsModel? get productDetails => _productDetails;

  Future<bool> getProductDetails(String productId) async {
    bool isSuccess = false;

    _getProductDetailsInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.getProductDetailsUrl(productId),
    );

    if (response.isSuccess) {
      _productDetails = ProductDetailsModel.fromJson(response.body!['data']);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getProductDetailsInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
