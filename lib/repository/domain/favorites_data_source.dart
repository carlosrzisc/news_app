import 'package:app_model/app_model.dart';

abstract class FavoritesDataSource {
  Future<List<Article>> getFavorites();
  Future<void> addFavorite(Article article);
  Future<void> removeFavorite(Article article);
}
