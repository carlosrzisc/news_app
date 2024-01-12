import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/app/routing/app_router.dart';
import 'package:news_app/features/loading/loading_screen.dart';
import 'package:news_app/features/splash/bloc/splash_bloc.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<SplashBloc>()..add(const SplashEvent.load()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          state.maybeWhen(
            loadInProgress: () => AppLoading.showLoading(context),
            loaded: () => context.router.replace(const HomeRoute()),
            orElse: () => <void>{},
          );
        },
        child: const Scaffold(
          body: SizedBox(), // instead of the loading animation, you might want to build a splash screen here instead
        ),
      ),
    );
  }
}
