/// Wrapper class for the DateTime to override the toString method to return the ISO8601 string.
class NewsDateTime extends DateTime {
  NewsDateTime(super.year);

  @override
  String toString() => toIso8601String();

  String toJson() => toString();
}
