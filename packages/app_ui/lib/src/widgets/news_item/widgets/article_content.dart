import 'package:app_model/app_model.dart';
import 'package:app_ui/src/theme/app_colors.dart';
import 'package:app_ui/src/theme/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleContent extends StatelessWidget {
  const ArticleContent({
    required Article article,
    super.key,
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
