import 'package:flutter/material.dart';

import '../my_theme.dart';

class MyTextTheme {
  static const colors = AppColors();
  static TextTheme lightTextTheme = ThemeData.light().textTheme.copyWith(
        headlineLarge: TextStyle(color: colors.secondaryColor),
        headlineMedium: TextStyle(color: colors.secondaryColor),
        titleSmall: TextStyle(color: colors.onPrimaryColor),
        titleLarge: TextStyle(color: colors.onPrimaryColor),
        titleMedium: TextStyle(color: colors.onPrimaryColor),
        bodySmall: TextStyle(color: colors.onPrimaryColor),
        bodyMedium: TextStyle(
            color: colors.primaryColor), // default text color of Text widget
        bodyLarge: TextStyle(color: colors.primaryColor),
      );
  static TextTheme darkTextTheme = ThemeData.light().textTheme.copyWith(
        headlineLarge: TextStyle(color: colors.secondaryColor),
        headlineMedium: TextStyle(color: colors.secondaryColor),
        titleSmall: TextStyle(color: colors.onPrimaryColor),
        titleLarge: TextStyle(color: colors.onPrimaryColor),
        titleMedium: TextStyle(color: colors.onPrimaryColor),
        bodySmall: TextStyle(color: colors.onPrimaryColor),
        bodyMedium: TextStyle(
            color: colors.primaryColor), // default text color of Text widget
        bodyLarge: TextStyle(color: colors.primaryColor),
      );
}
