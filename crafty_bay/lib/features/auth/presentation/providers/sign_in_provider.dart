import 'package:flutter/foundation.dart';

import '../../../../app/controllers/auth_controller.dart';
import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../../shared/data/models/user_model.dart';
import '../../data/models/sign_in_params.dart';

class SignInProvider extends ChangeNotifier {
  bool _signInProgress = false;

  bool get signInProgress => _signInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInParams params) async {
    bool isSuccess = false;

    _signInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signInUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      // Save user data and access token
      UserModel userModel = UserModel.fromJson(response.body!['data']['user']);
      String accessToken = response.body!['data']['token'];
      await AuthController.saveUserData(accessToken, userModel);

      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _signInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
