import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: AppColors.colorScheme,
    textTheme: AppStyles.textThemeLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.grayLighter,
      selectedItemColor: AppColors.grayDarker,
      unselectedItemColor: AppColors.gray,
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.grayDarker,
    textTheme: AppStyles.textThemeDark,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.grayDark,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.gray,
    ),
  );
}
