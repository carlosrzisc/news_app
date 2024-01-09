import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_api/src/model/news/source.dart';

part 'sources_response.freezed.dart';
part 'sources_response.g.dart';

/// Represents a sources response from the News API.
@freezed
class SourcesResponse with _$SourcesResponse {
  factory SourcesResponse({
    String? status,
    List<Source>? articles,
  }) = _SourcesResponse;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) => _$SourcesResponseFromJson(json);
}
