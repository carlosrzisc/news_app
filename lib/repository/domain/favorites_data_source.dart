import 'package:news_api/news_api.dart';

abstract class FavoritesDataSource {
  Future<List<Article>> getFavorites();
  Future<void> addFavorite(Article article);
  Future<void> removeFavorite(Article article);
}
