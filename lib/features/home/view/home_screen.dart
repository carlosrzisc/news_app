import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/favorites/favorites.dart';
import 'package:news_app/features/news/view/news_screen.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeNavCubit(),
      child: BlocBuilder<HomeNavCubit, int>(
        builder: (context, index) {
          return Scaffold(
            body: Center(
              child: index == 1 ? const FavoritesScreen() : const NewsScreen(),
            ),
            extendBody: true,
            bottomNavigationBar: AppNavBar(
              currentIndex: index,
              onItemSelect: context.read<HomeNavCubit>().navigate,
            ),
          );
        },
      ),
    );
  }
}
