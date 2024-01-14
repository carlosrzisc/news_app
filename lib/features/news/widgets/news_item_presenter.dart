import 'package:app_model/app_model.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/cubit/news_item_cubit.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsItemPresenter extends StatelessWidget {
  const NewsItemPresenter(
    this._article, {
    super.key,
  });
  final Article _article;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsItemCubit(_article)..isFavorite(),
      child: BlocBuilder<NewsItemCubit, ArticleUi>(
        builder: (context, item) {
          return NewsItem(
            item.article,
            onTap: () => _onArticleSelected(item.article),
            isFavorite: item.isFavorite ?? false,
            onFavoriteTap: () => context.read<NewsItemCubit>().toggleFavorite(),
          );
        },
      ),
    );
  }

  void _onArticleSelected(Article article) {
    final url = article.url;
    if (url != null && url.isNotEmpty) {
      launchUrlString(url);
    }
  }
}
