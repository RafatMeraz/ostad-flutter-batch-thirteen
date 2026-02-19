import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget widget;

    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
      case SignUpScreen.name:
        widget = SignUpScreen();
      case SignInScreen.name:
        widget = SignInScreen();
    }

    return MaterialPageRoute(builder: (context) => widget);
  }
}
