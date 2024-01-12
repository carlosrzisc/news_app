enum NewsCategory {
  business._('business'),
  entertainment._('entertainment'),
  general._('general'),
  health._('health'),
  science._('science'),
  sports._('sports'),
  technology._('technology');

  const NewsCategory._(this._value);
  final String _value;

  @override
  String toString() => _value;
}
