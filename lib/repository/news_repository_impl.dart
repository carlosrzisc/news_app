import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:news_api/news_api.dart';
import 'package:news_app/repository/domain/news_repository.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._newsApi);
  final NewsApi _newsApi;
  final _newsController = BehaviorSubject<List<Article>>();
  int page = 1;
  static const int _limit = 20;
  bool hasReachedMax = false;

  @override
  Stream<List<Article>> get articles => _newsController.asBroadcastStream();

  @override
  Future<void> loadMore() async {
    if (hasReachedMax) return;

    try {
      final result = (await _newsApi.getTopHeadlines(country: NewsCountry.unitedStates)).articles;
      if (result == null) {
        _newsController.addError(Exception('Error fetching news'));
        return;
      }

      page++;
      final currentList = _newsController.hasValue ? _newsController.value : <Article>[];
      hasReachedMax = result.length < _limit;

      _newsController.add([...currentList, ...result]);
    } catch (e) {
      _newsController.addError(e);
    }
  }
}