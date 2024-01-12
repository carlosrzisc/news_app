import 'dart:async';

import 'package:app_model/app_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/repository/app_repository.dart';

part 'news_state.dart';
part 'news_event.dart';
part 'news_bloc.freezed.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this._repository) : super(const NewsState.initial()) {
    on<_Load>(_onLoad);
    on<_SubscriptionRequested>(_onSubscriptionRequested);
    on<_Search>(_onSearch);
  }
  final NewsRepository _repository;

  Future<void> _onSubscriptionRequested(
    _SubscriptionRequested event,
    Emitter<NewsState> emit,
  ) async {
    await emit.forEach<List<Article>>(
      _repository.articles,
      onData: NewsState.loadSuccess,
      onError: (error, stackTrace) => const NewsState.loadFailure(),
    );
  }

  void _onLoad(_Load event, Emitter<NewsState> emit) {
    if (state is LoadInProgress) return;

    emit(const NewsState.loadInProgress());
    _repository.loadMore();
  }

  FutureOr<void> _onSearch(_Search event, Emitter<NewsState> emit) {}
}
