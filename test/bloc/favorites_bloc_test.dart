import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/features/favorites/bloc/favorites_bloc.dart';
import 'package:news_app/repository/favorites_repository.dart';

import 'favorites_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoritesRepository>()])
void main() {
  group('FavoritesBloc', () {
    late FavoritesBloc favoritesBloc;
    late FavoritesRepository favoritesRepository;

    setUp(() {
      favoritesRepository = MockFavoritesRepository();
      favoritesBloc = FavoritesBloc(favoritesRepository);
    });

    tearDown(() {
      favoritesBloc.close();
    });

    test('initial state is FavoritesState.initial()', () {
      expect(favoritesBloc.state, equals(const FavoritesState.initial()));
    });

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesState.loadInProgress(), FavoritesState.loadSuccess()] when _Load event is added',
      setUp: () {
        when(favoritesRepository.getFavorites()).thenAnswer((_) async => []);
      },
      build: () => favoritesBloc,
      act: (bloc) => bloc.add(const FavoritesEvent.load()),
      expect: () => [
        const FavoritesState.loadInProgress(),
        const FavoritesState.loadSuccess([]), // Replace [] with your expected favorites list
      ],
    );
  });
}
