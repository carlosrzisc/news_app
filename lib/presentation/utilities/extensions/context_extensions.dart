import 'package:flutter/material.dart';
import 'package:news_app/l10n/l10n.dart';

extension BuildContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  AppLocalizations get l10n => AppLocalizations.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  bool get thinScreen => screenWidth <= 375;
}
