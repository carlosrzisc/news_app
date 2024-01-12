import 'package:app_model/app_model.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/repository/favorites_repository.dart';

class NewsItemCubit extends Cubit<ArticleUi> {
  NewsItemCubit(Article article) : super(ArticleUi(article: article)) {
    _favoritesRepository = GetIt.I.get<FavoritesRepository>();
  }
  late final FavoritesRepository _favoritesRepository;

  Future<void> isFavorite() async {
    emit(state.copyWith(isFavorite: await _favoritesRepository.isFavorite(state.article)));
  }

  Future<void> toggleFavorite() async {
    await _favoritesRepository.toggle(state.article);
    emit(state.copyWith(isFavorite: !(state.isFavorite ?? false)));
  }
}
