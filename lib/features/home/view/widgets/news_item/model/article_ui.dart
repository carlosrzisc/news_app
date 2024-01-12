import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_api/news_api.dart';

part 'article_ui.freezed.dart';

@freezed
class ArticleUi with _$ArticleUi {
  factory ArticleUi({
    required Article article,
    bool? isFavorite,
  }) = _ArticleUi;
}
