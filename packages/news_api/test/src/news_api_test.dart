import 'dart:math';

import 'package:app_model/app_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_api/src/news_api.dart';
import 'package:test/test.dart';
import 'news_api_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NewsApi>()])
void main() {
  group('#fetchNews', () {
    late NewsApi service;

    setUp(() {
      service = MockNewsApi();
    });

    test('Fetch news successfull call', () async {
      final mockedResponse = _mockNewsList;
      when(service.getEverything(query: 'search query')).thenAnswer((realInvocation) async => mockedResponse);

      expect(await service.getEverything(query: 'search query'), mockedResponse);
    });
  });
}

NewsResponse get _mockNewsList {
  final randomListOfNews = List.generate(5, (_) => generateRandomArticles());

  return NewsResponse(
    articles: randomListOfNews,
  );
}

final random = Random();
Article generateRandomArticles() {
  final id = random.nextInt(100);
  return Article(
    source: Source(
      id: 'id_$id',
      name: 'name_$id',
    ),
    url: 'https://www.google.com',
    title: 'title_$id',
    description: 'description_$id',
    urlToImage: 'https://picsum.photos/200/300',
    publishedAt: DateTime.now().toString(),
    content: 'content_$id',
  );
}
