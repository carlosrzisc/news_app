import 'package:app_model/app_model.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/repository/domain/favorites_data_source.dart';

@lazySingleton
class FavoritesRepository {
  FavoritesRepository(this._favoritesDataSource);
  final FavoritesDataSource _favoritesDataSource;

  Future<List<Article>> getFavorites() => _favoritesDataSource.getFavorites();

  Future<void> addFavorite(Article article) => _favoritesDataSource.addFavorite(article);

  Future<void> removeFavorite(Article article) => _favoritesDataSource.removeFavorite(article);

  Future<bool> isFavorite(Article? article) async {
    if (article == null) return false;
    return _favoritesDataSource.getFavorites().then((favorites) => favorites.contains(article));
  }

  Future<void> toggle(Article article) async {
    final isFavorite = await this.isFavorite(article);
    if (isFavorite) {
      await removeFavorite(article);
    } else {
      await addFavorite(article);
    }
  }
}
