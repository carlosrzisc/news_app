import 'package:news_api/news_api.dart';

abstract class NewsRepository {
  Stream<List<Article>> get articles;
  Future<void> loadMore();
}
