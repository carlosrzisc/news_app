// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SourcesResponseImpl _$$SourcesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SourcesResponseImpl(
      status: json['status'] as String?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SourcesResponseImplToJson(
        _$SourcesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'articles': instance.articles,
    };
