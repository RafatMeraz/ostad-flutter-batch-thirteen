// Best Practice => Service Locator/Dependency Injection Manager

import 'package:crafty_bay/app/controllers/auth_controller.dart';
import 'package:crafty_bay/app/crafty_bay_app.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';

import '../core/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () => {'Content-Type': 'application/json'},
    onUnauthorize: () async {
      // Logout from app
      await AuthController.clearUserData();
      CraftyBayApp.navigatorKey.currentState!.pushNamed(SignInScreen.name);
    },
  );
}

// USES => getNetworkCaller().getRequest()
