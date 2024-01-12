import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/app/utils/extensions/context_extensions.dart';
import 'package:news_app/features/favorites/bloc/favorites_bloc.dart';
import 'package:news_app/features/news/bloc/news_bloc.dart';
import 'package:news_app/features/news/widgets/news_item_presenter.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<FavoritesBloc>()..add(const FavoritesEvent.load()),
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          return state.maybeWhen(
            loadSuccess: (articles) => NewsListView(
              articles,
              onLoadMore: () => context.read<NewsBloc>().add(const NewsEvent.load()),
              itemBuilder: (context, article) {
                return NewsItemPresenter(article);
              },
            ),
            loadFailure: () => ErrorText(context.l10n.genericError),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
