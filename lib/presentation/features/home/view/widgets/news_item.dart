import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_api/news_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsItem extends StatelessWidget {
  const NewsItem(
    this._article, {
    this.onTap,
    super.key,
  });
  final Article _article;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image = _article.urlToImage;
    final url = _article.url;
    return InkWell(
      onTap: url != null ? () => launchUrlString(url) : null,
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
            child: Row(
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
                        ? Hero(
                            tag: 'image-${_article.url}',
                            child: Image(
                              image: CachedNetworkImageProvider(image),
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : AppImages.newsPlaceholder,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
