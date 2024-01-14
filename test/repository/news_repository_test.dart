import 'dart:async';

import 'package:app_model/app_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_api/news_api.dart';
import 'package:news_app/repository/domain/news_repository.dart';
import 'package:news_app/repository/news_repository_impl.dart';

import 'news_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NewsApi>()])
void main() {
  late NewsRepository newsRepository;
  late NewsApi newsApi;

  setUp(() {
    newsApi = MockNewsApi();
    newsRepository = NewsRepositoryImpl(newsApi);
  });

  group('NewsRepositoryImpl', () {
    test('initial state', () {
      expect(newsRepository.articles, emitsInOrder([<Article>[]]));
    });

    test(
      'loadMore success',
      () async {
        final articles = [
          Article(title: 'Article 1', url: 'https://www.google.com'),
          Article(title: 'Article 2', url: 'https://www.google.com'),
        ];
        when(
          newsApi.getTopHeadlines(
            country: anyNamed('country'),
            page: anyNamed('page'),
            pageSize: anyNamed('pageSize'),
          ),
        ).thenAnswer((_) async => NewsResponse(articles: articles));

        unawaited(
          expectLater(
            newsRepository.articles,
            emitsInOrder([
              <Article>[],
              articles,
            ]),
          ),
        );
        await newsRepository.loadMore();
        verify(
          newsApi.getTopHeadlines(
            country: NewsCountry.unitedStates,
            page: 1,
            pageSize: NewsRepositoryImpl.limit,
          ),
        ).called(1);
      },
      timeout: const Timeout(Duration(milliseconds: 500)),
    );

    test('loadMore reached max', () async {
      final articles = [
        Article(title: 'Article 1', url: 'https://www.google.com'),
        Article(title: 'Article 2', url: 'https://www.google.com'),
      ];
      when(
        newsApi.getTopHeadlines(
          country: anyNamed('country'),
          page: anyNamed('page'),
          pageSize: anyNamed('pageSize'),
        ),
      ).thenAnswer((_) async => NewsResponse(articles: articles));

      await newsRepository.loadMore();
      expect(newsRepository.hasReachedMax, true);
    });
  });
}
