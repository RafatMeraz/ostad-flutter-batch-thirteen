import 'package:flutter/foundation.dart';

import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../data/models/home_slider_model.dart';

class HomeSliderProvider extends ChangeNotifier {
  bool _getHomeSliderInProgress = false;

  bool get getHomeSliderInProgress => _getHomeSliderInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<HomeSliderModel> _homeSliders = [];

  List<HomeSliderModel> get homeSliders => _homeSliders;

  Future<bool> getHomeSliders() async {
    bool isSuccess = false;

    _getHomeSliderInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.homeSlidersUrl,
    );

    if (response.isSuccess) {
      List<HomeSliderModel> sliders = [];
      for (Map<String, dynamic> slider in response.body!['data']['results']) {
        sliders.add(HomeSliderModel.fromJson(slider));
      }
      _homeSliders = sliders;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getHomeSliderInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
