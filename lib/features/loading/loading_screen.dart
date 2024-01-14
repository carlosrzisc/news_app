import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoading {
  AppLoading._();

  static Future<void> showLoading(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
      builder: (context) {
        return const LoadingScreen(key: AppKeys.loadingScreen);
      },
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Lottie.asset(
        'assets/lottie/loading.json',
      ),
    );
  }
}
