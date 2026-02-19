import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: _progressThemeData,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonTheme,
  );

  static final ThemeData _darkThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    progressIndicatorTheme: _progressThemeData,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonTheme,
  );

  static ProgressIndicatorThemeData get _progressThemeData {
    return ProgressIndicatorThemeData(color: AppColors.themeColor);
  }

  static TextTheme get _textTheme =>
      TextTheme(titleLarge: TextStyle(fontSize: 24, fontWeight: .bold));

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: .symmetric(horizontal: 16, vertical: 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.themeColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.themeColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.themeColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
  );

  static FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(8)),
      backgroundColor: AppColors.themeColor,
      padding: .symmetric(vertical: 12),
      fixedSize: Size.fromWidth(double.maxFinite),
    ),
  );

  static ThemeData get lightTheme => _lightThemeData;

  static ThemeData get darkTheme => _darkThemeData;
}
