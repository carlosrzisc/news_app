part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loadInProgress() = LoadInProgress;
  const factory NewsState.loadSuccess(List<Article> articles) = _LoadSuccess;
  const factory NewsState.loadFailure() = _LoadFailure;
  const factory NewsState.articlesNotFound() = ArticlesNotFound;
}
