import 'package:app_model/app_model.dart';

abstract class NewsRepository {
  Stream<List<Article>> get articles;
  Future<void> loadMore();
}
