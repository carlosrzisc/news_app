import 'package:app_model/app_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/repository/domain/favorites_data_source.dart';
import 'package:news_app/repository/favorites_repository.dart';
import 'favorites_repository_test.mocks.dart';

@GenerateMocks([FavoritesDataSource])
void main() {
  late FavoritesRepository favoritesRepository;
  late FavoritesDataSource favoritesDataSource;

  setUp(() {
    favoritesDataSource = MockFavoritesDataSource();
    favoritesRepository = FavoritesRepository(favoritesDataSource);
  });

  group('FavoritesRepository', () {
    test('getFavorites should call getFavorites method of FavoritesDataSource', () async {
      final expectedFavorites = [Article(), Article(), Article()];
      when(favoritesDataSource.getFavorites()).thenAnswer((_) async => expectedFavorites);

      final result = await favoritesRepository.getFavorites();

      expect(result, expectedFavorites);
      verify(favoritesDataSource.getFavorites()).called(1);
    });

    test('addFavorite should call addFavorite method of FavoritesDataSource', () async {
      final article = Article();
      await favoritesRepository.addFavorite(article);

      verify(favoritesDataSource.addFavorite(article)).called(1);
    });

    test('removeFavorite should call removeFavorite method of FavoritesDataSource', () async {
      final article = Article();
      await favoritesRepository.removeFavorite(article);

      verify(favoritesDataSource.removeFavorite(article)).called(1);
    });

    test('isFavorite should return true if article is in favorites', () async {
      final article = Article();
      final favorites = [article, Article(), Article()];
      when(favoritesDataSource.getFavorites()).thenAnswer((_) async => favorites);

      final result = await favoritesRepository.isFavorite(article);

      expect(result, true);
      verify(favoritesDataSource.getFavorites()).called(1);
    });

    test('isFavorite should return false if article is not in favorites', () async {
      final article = Article(title: 'not a favorite');
      final favorites = [Article(), Article(), Article()];
      when(favoritesDataSource.getFavorites()).thenAnswer((_) async => favorites);

      final result = await favoritesRepository.isFavorite(article);

      expect(result, false);
      verify(favoritesDataSource.getFavorites()).called(1);
    });
  });
}
