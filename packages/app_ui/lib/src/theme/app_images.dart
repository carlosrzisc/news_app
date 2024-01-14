import 'package:flutter/material.dart';

class AppImages {
  static const _images = 'assets/images/';
  static final appLogo = Image.asset('${_images}app_logo.png');
  static final newsPlaceholder = Image.asset(
    '${_images}news_placeholder.jpg',
    fit: BoxFit.cover,
    package: 'app_ui',
  );
}
