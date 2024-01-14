import 'dart:async';

import 'package:app_model/app_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/features/news/bloc/news_bloc.dart';
import 'package:news_app/repository/app_repository.dart';

import 'news_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NewsRepository>()])
void main() {
  group('NewsBloc', () {
    late NewsBloc newsBloc;
    late NewsRepository newsRepository;
    late Stream<List<Article>> articlesStream;
    final articlesStreamController = StreamController<List<Article>>();

    setUp(() {
      newsRepository = MockNewsRepository();
      articlesStream = articlesStreamController.stream;
      when(newsRepository.articles).thenAnswer((_) => articlesStream);
      newsBloc = NewsBloc(newsRepository);
    });

    tearDown(() {
      newsBloc.close();
    });

    test('initial state is NewsState.initial()', () {
      expect(newsBloc.state, equals(const NewsState.initial()));
    });

    blocTest<NewsBloc, NewsState>(
      'emits [NewsState.loadInProgress(), NewsState.loadSuccess()] when _Load event is added',
      setUp: () {
        when(newsRepository.loadMore()).thenAnswer((_) async {
          articlesStreamController.add([]);
        });
      },
      build: () => newsBloc,
      act: (bloc) => bloc
        ..add(const NewsEvent.subscriptionRequested())
        ..add(const NewsEvent.load()),
      expect: () {
        return [
          const NewsState.loadInProgress(),
          const NewsState.loadSuccess([]), // Replace [] with your expected articles list
        ];
      },
    );
  });
}
