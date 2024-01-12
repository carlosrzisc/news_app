import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/news_api.dart';
import 'package:news_app/features/home/view/widgets/news_item/cubit/news_item_cubit.dart';
import 'package:news_app/features/home/view/widgets/news_item/model/article_ui.dart';
import 'package:news_app/features/home/view/widgets/news_item/news_item.dart';

class NewsItemPresenter extends StatelessWidget {
  const NewsItemPresenter(
    this._article, {
    this.onTap,
    super.key,
  });
  final Article _article;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsItemCubit(_article)..isFavorite(),
      child: BlocBuilder<NewsItemCubit, ArticleUi>(
        builder: (context, item) {
          return NewsItem(
            item.article,
            onTap: onTap,
            isFavorite: item.isFavorite ?? false,
            onFavoriteTap: () => context.read<NewsItemCubit>().toggleFavorite(),
          );
        },
      ),
    );
  }
}
