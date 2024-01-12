part of 'favorites_bloc.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loadInProgress() = _LoadInProgress;
  const factory FavoritesState.loadSuccess(List<Article> favorites) = _LoadSuccess;
  const factory FavoritesState.loadFailure() = _LoadFailure;
}
