import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_api/news_api.dart';
import 'package:news_app/l10n/l10n.dart';
import 'package:news_app/presentation/features/home/bloc/home_bloc.dart';
import 'package:news_app/presentation/features/home/view/widgets/news_input_search.dart';
import 'package:news_app/presentation/features/home/view/widgets/news_list_view.dart';
import 'package:news_app/presentation/features/loading/loading_screen.dart';

class HomePresenter extends StatelessWidget {
  const HomePresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<HomeBloc>()
        ..add(const HomeEvent.subscriptionRequested())
        ..add(const HomeEvent.load()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          state.maybeWhen(
            loadInProgress: () => AppLoading.showLoading(context),
            orElse: context.router.pop, // dismiss loading animation
          );
        },
        builder: (context, state) {
          return Stack(
            children: [
              state.maybeWhen(
                loadSuccess: (newsList) => NewsListView(
                  newsList,
                  onTap: (article) => _onArticleSelected(context, article),
                ),
                loadFailure: () => Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      context.l10n.genericError,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                orElse: () => const SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 60, 15, 0),
                child: NewsInputSearch(
                  onSearch: (text) => context.read<HomeBloc>().add(HomeEvent.search(text)),
                ),
              ),
            ],
          );
        },
        buildWhen: (previous, current) => current is! LoadInProgress && current is! ArticlesNotFound,
      ),
    );
  }

  void _onArticleSelected(BuildContext context, Article article) {}
}
