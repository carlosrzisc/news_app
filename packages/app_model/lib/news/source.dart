import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.freezed.dart';
part 'source.g.dart';

/// Represents a news source from the News API.
@freezed
class Source with _$Source {
  factory Source({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? country,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

/// A list of [Source]s.
class SourceList extends ListBase<Source> {
  SourceList(this._innerList);
  final List<Source> _innerList;

  @override
  int get length => _innerList.length;

  @override
  set length(int newLength) => _innerList.length = newLength;

  @override
  Source operator [](int index) => _innerList[index];

  @override
  void operator []=(int index, Source value) {
    _innerList[index] = value;
  }

  @override
  String toString() {
    return _innerList.map((item) => item.id).whereType<String>().join(', ');
  }

  String toJson() {
    return _innerList.map((item) => item.toString()).join(',');
  }
}
