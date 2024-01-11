import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: AppColors.colorScheme,
    textTheme: AppStyles.textThemeLight,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.grayDarker,
    textTheme: AppStyles.textThemeDark,
  );
}
