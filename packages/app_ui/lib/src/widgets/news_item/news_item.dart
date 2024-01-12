import 'package:app_model/app_model.dart';
import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                _ArticleContent(article: _article),
                _FavoriteButton(onFavoriteTap: onFavoriteTap, isFavorite: isFavorite),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.onFavoriteTap,
    this.isFavorite = false,
  });

  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isFavorite ? AppColors.primaryLighter : AppColors.grayLighter,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: isFavorite ? AppColors.primary : AppColors.gray,
          ),
          onPressed: onFavoriteTap,
        ),
      ),
    );
  }
}

class _ArticleContent extends StatelessWidget {
  const _ArticleContent({
    required Article article,
  }) : _article = article;

  final Article _article;

  @override
  Widget build(BuildContext context) {
    final image = _article.urlToImage;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_article.source?.name?.isNotEmpty ?? false)
                  Text(
                    _article.source?.name ?? '',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 120),
                  child: Text(
                    _article.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    _article.description ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 120,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: image != null
                ? Image(
                    image: CachedNetworkImageProvider(image),
                    fit: BoxFit.fitHeight,
                  )
                : AppImages.newsPlaceholder,
          ),
        ),
      ],
    );
  }
}
