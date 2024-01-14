import 'dart:async';
import 'package:app_model/app_model.dart';
import 'package:injectable/injectable.dart';
import 'package:news_api/news_api.dart';
import 'package:news_app/repository/domain/news_repository.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._newsApi) {
    Timer.periodic(const Duration(minutes: 4), (_) {
      page = 1;
      _newsController.add([]);
      loadMore();
    });
    _newsController.add([]);
  }

  final NewsApi _newsApi;
  final _newsController = BehaviorSubject<List<Article>>();
  int page = 1;
  static const int limit = 20;

  @override
  bool get hasReachedMax => _hasReachedMax;
  bool _hasReachedMax = false;

  @override
  Stream<List<Article>> get articles => _newsController.asBroadcastStream();

  @override
  Future<void> loadMore() async {
    if (hasReachedMax) return;

    try {
      final result = (await _newsApi.getTopHeadlines(
        country: NewsCountry.unitedStates,
        page: page,
        pageSize: limit,
      ))
          .articles;
      if (result == null) {
        _newsController.addError(Exception('Error fetching news'));
        return;
      }

      page++;
      final currentList = _newsController.hasValue ? _newsController.value : <Article>[];
      _hasReachedMax = result.length < limit;

      _newsController.add(
        [
          ...currentList,
          ...result.where(
            (element) => !(element.url?.contains('removed.com') ?? true),
          ),
        ],
      );
    } catch (e) {
      _newsController.addError(e);
    }
  }
}
