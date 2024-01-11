enum NewsLanguage {
  arabian._('ar'),
  german._('de'),
  english._('en'),
  spanish._('es'),
  french._('fr'),
  hebrew._('he'),
  italian._('it'),
  dutch._('nl'),
  norwegian._('no'),
  portuguese._('pt'),
  russian._('ru'),
  swedish._('sv'),
  ud._('ud'),
  chinese._('zh');

  const NewsLanguage._(this._value);
  final String _value;

  @override
  String toString() => _value;

  String toJson() => _value;
}
