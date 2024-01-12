import 'package:app_model/app_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/repository/favorites_repository.dart';

part 'favorites_state.dart';
part 'favorites_event.dart';
part 'favorites_bloc.freezed.dart';

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(this._favoritesRepository) : super(const FavoritesState.initial()) {
    on<_Load>(_onLoad);
  }
  final FavoritesRepository _favoritesRepository;

  Future<void> _onLoad(_Load event, Emitter<FavoritesState> emit) async {
    emit(const FavoritesState.loadInProgress());
    final favorites = await _favoritesRepository.getFavorites();
    emit(FavoritesState.loadSuccess(favorites));
  }
}
