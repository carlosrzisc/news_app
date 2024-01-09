import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:news_api/src/model/news/article.dart';

part 'news_response.freezed.dart';
part 'news_response.g.dart';

/// Represents a news articles response from the News API.
@freezed
class NewsResponse with _$NewsResponse {
  factory NewsResponse({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);
}
