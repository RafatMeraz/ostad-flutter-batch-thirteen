import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import 'app_theme.dart';
import 'routes.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crafty Bay',
      initialRoute: SplashScreen.name,
      onGenerateRoute: Routes.onGenerateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
