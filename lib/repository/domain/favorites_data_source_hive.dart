import 'package:app_model/app_model.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/repository/domain/favorites_data_source.dart';
import 'package:hive/hive.dart';
import 'package:news_app/repository/domain/hive_storage_objects.dart';

@LazySingleton(as: FavoritesDataSource)
class FavoritesDataSourceHive implements FavoritesDataSource {
  FavoritesDataSourceHive(this.favoritesBox);
  final Box<FavoriteArticle> favoritesBox;

  @override
  Future<void> addFavorite(Article article) => favoritesBox.put(article.url, article.toHive());

  @override
  Future<List<Article>> getFavorites() async => favoritesBox.values.map((e) => e.toArticle()).toList();

  @override
  Future<void> removeFavorite(Article article) => favoritesBox.delete(article.url);
}
