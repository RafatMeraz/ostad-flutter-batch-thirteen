import 'package:crafty_bay/app/routes.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/splash_screen.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crafty Bay',
      initialRoute: SplashScreen.name,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
