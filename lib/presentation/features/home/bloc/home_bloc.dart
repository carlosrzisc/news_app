import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_api/news_api.dart';
import 'package:news_app/repository/app_repository.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repository) : super(const HomeState.initial()) {
    on<_Load>(_onLoad);
    on<_SubscriptionRequested>(_onSubscriptionRequested);
    on<_Search>(_onSearch);
  }
  final NewsRepository _repository;

  Future<void> _onSubscriptionRequested(
    _SubscriptionRequested event,
    Emitter<HomeState> emit,
  ) async {
    await emit.forEach<List<Article>>(
      _repository.articles,
      onData: HomeState.loadSuccess,
      onError: (error, stackTrace) => const HomeState.loadFailure(),
    );
  }

  void _onLoad(_Load event, Emitter<HomeState> emit) {
    if (state is LoadInProgress) return;

    emit(const HomeState.loadInProgress());
    _repository.loadMore();
  }

  FutureOr<void> _onSearch(_Search event, Emitter<HomeState> emit) {}
}
