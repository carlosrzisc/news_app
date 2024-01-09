/// The order to sort articles in.
enum NewsSortBy {
  relevancy._('relevancy'),
  popularity._('popularity'),
  publishedAt._('publishedAt');

  const NewsSortBy._(this._value);
  final String _value;

  @override
  String toString() => _value;
}
