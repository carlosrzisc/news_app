import 'package:auto_route/auto_route.dart';
import 'package:news_app/presentation/features/splash/splash_screen.dart';
import 'package:news_app/presentation/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:news_api/news_api.dart';

/// Important: If you are passing typed arguments to any screen, you need to manually add the dependency
/// where the type is defined. Otherwise the auto_route_generator will not generate the required code

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: HomeRoute.page),
      ];
}
