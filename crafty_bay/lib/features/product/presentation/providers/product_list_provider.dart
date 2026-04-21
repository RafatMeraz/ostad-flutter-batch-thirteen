import 'package:crafty_bay/app/set_up_network_client.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/product/data/models/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductListProvider extends ChangeNotifier {
  final int _pageCount = 30;
  int _currentPage = 0;
  int? _lastPage;

  // Initial Loading
  bool _getInitialDataInProgress = false;

  // More data loading
  bool _getMoreDataInProgress = false;

  List<ProductModel> _productList = [];

  bool get getInitialDataInProgress => _getInitialDataInProgress;

  bool get getMoreDataInProgress => _getMoreDataInProgress;

  List<ProductModel> get productList => _productList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProducts(String categoryId) async {
    if (_lastPage != null && _currentPage >= _lastPage!) {
      return false;
    }
    bool isSuccess = false;

    _currentPage++;

    if (isInitialLoading) {
      _getInitialDataInProgress = true;
    } else {
      _getMoreDataInProgress = true;
    }
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.getProductsUrl(_pageCount, _currentPage),
    );

    if (response.isSuccess) {
      List<ProductModel> products = [];
      _lastPage = response.body!['data']['last_page'];
      for (Map<String, dynamic> category in response.body!['data']['results']) {
        products.add(ProductModel.fromJson(category));
      }
      _productList.addAll(products);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (isInitialLoading) {
      _getInitialDataInProgress = false;
    } else {
      _getMoreDataInProgress = false;
    }
    notifyListeners();

    return isSuccess;
  }

  bool get isInitialLoading => _currentPage == 1;

  bool get isLoading => _getInitialDataInProgress || _getMoreDataInProgress;
}
