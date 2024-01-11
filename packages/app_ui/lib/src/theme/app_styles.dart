import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const TextTheme textThemeDark = TextTheme(
    /// Display - EXO
    displaySmall: TextStyle(fontFamily: AppFonts.avenirMedium, fontSize: 36),
    displayMedium: TextStyle(fontFamily: AppFonts.avenirMedium, fontSize: 45),
    displayLarge: TextStyle(fontFamily: AppFonts.avenirMedium, fontSize: 57),

    /// Headline - EXO
    headlineLarge: TextStyle(fontFamily: AppFonts.exo2Medium, fontSize: 24),
    headlineMedium: TextStyle(fontFamily: AppFonts.exo2Medium, fontSize: 22),
    headlineSmall: TextStyle(fontFamily: AppFonts.exo2Medium, fontSize: 20),

    /// Title - EXO
    titleLarge: TextStyle(
      fontFamily: AppFonts.exo2Medium,
      fontSize: 18,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontFamily: AppFonts.exo2Medium,
      fontSize: 16,
      color: AppColors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: AppFonts.exo2Medium,
      fontSize: 15,
      color: AppColors.white,
    ),

    /// Label - AVENIR
    labelLarge: TextStyle(
      fontFamily: AppFonts.avenirMedium,
      fontSize: 20,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: AppFonts.avenirMedium,
      fontSize: 18,
      color: AppColors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: AppFonts.avenirMedium,
      fontSize: 14,
      color: AppColors.white,
    ),

    /// Body - AVENIR
    bodyLarge: TextStyle(fontFamily: AppFonts.avenirMedium, fontSize: 20),
    bodyMedium: TextStyle(fontFamily: AppFonts.avenirMedium, fontSize: 18),
    bodySmall: TextStyle(fontFamily: AppFonts.avenirMedium, fontSize: 14),
  );

  static TextTheme textThemeLight = textThemeDark.copyWith(
    titleLarge: const TextStyle(
      fontFamily: AppFonts.exo2Medium,
      fontSize: 18,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: const TextStyle(
      fontFamily: AppFonts.exo2Medium,
      fontSize: 16,
      color: AppColors.black,
    ),
    titleSmall: const TextStyle(
      fontFamily: AppFonts.exo2Medium,
      fontSize: 15,
      color: AppColors.black,
    ),

    /// Label - AVENIR
    labelLarge: const TextStyle(
      fontFamily: AppFonts.avenirMedium,
      fontSize: 20,
      color: AppColors.black,
    ),
    labelMedium: const TextStyle(
      fontFamily: AppFonts.avenirMedium,
      fontSize: 18,
      color: AppColors.black,
    ),
    labelSmall: const TextStyle(
      fontFamily: AppFonts.avenirMedium,
      fontSize: 16,
      color: AppColors.black,
    ),
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: AppFonts.exo2SemiBold,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
}

class AppFonts {
  static const String avenirMedium = 'Avenir-Medium';
  static const String avenirHeavy = 'Avenir-Heavy';

  static const String exo2Medium = 'Exo2-Medium';
  static const String exo2Bold = 'Exo2-Bold';
  static const String exo2SemiBold = 'Exo2-SemiBold';
}

class AppDecorations {
  static final BoxDecoration appCardDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(12),
  );
}
