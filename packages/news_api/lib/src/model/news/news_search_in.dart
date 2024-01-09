import 'dart:collection';

/// The language to search for articles.
enum NewsSearchIn {
  title._('title'),
  description._('description'),
  content._('content');

  const NewsSearchIn._(this._value);
  final String _value;

  @override
  String toString() => _value;
}

/// A list of [NewsSearchIn]s.
class NewsSearchInList extends ListBase<NewsSearchIn> {
  NewsSearchInList(this._innerList);
  final List<NewsSearchIn> _innerList;

  @override
  int get length => _innerList.length;

  @override
  set length(int newLength) => _innerList.length = newLength;

  @override
  NewsSearchIn operator [](int index) => _innerList[index];

  @override
  void operator []=(int index, NewsSearchIn value) {
    _innerList[index] = value;
  }

  @override
  String toString() {
    return _innerList.map((item) => item.toString()).join(', ');
  }
}
