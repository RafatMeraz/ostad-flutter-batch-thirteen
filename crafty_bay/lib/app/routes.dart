import 'package:crafty_bay/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/verify_otp_screen.dart';
import '../features/product/presentation/screens/product_list_screen.dart';
import '../features/shared/presentation/screens/main_nav_holder_screen.dart';

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
      case VerifyOtpScreen.name:
        widget = VerifyOtpScreen();
      case MainNavHolderScreen.name:
        widget = MainNavHolderScreen();
      case ProductListScreen.name:
        final categoryName = settings.arguments as String;
        widget = ProductListScreen(categoryName: categoryName);
      case ProductDetailsScreen.name:
        widget = ProductDetailsScreen();
    }

    return MaterialPageRoute(builder: (context) => widget);
  }
}
