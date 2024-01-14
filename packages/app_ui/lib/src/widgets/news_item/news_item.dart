import 'package:app_model/app_model.dart';
import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/widgets/news_item/widgets/article_content.dart';
import 'package:app_ui/src/widgets/news_item/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem(
    this._article, {
    this.onTap,
    this.onFavoriteTap,
    this.isFavorite = false,
    super.key,
  });
  final Article _article;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grayLight,
              width: 3,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                ArticleContent(article: _article),
                FavoriteButton(onFavoriteTap: onFavoriteTap, isFavorite: isFavorite),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
