import 'package:app_model/app_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_ui.freezed.dart';

@freezed
class ArticleUi with _$ArticleUi {
  factory ArticleUi({
    required Article article,
    bool? isFavorite,
  }) = _ArticleUi;
}
