part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.load() = _Load;
  const factory NewsEvent.subscriptionRequested() = _SubscriptionRequested;
  const factory NewsEvent.search(String query) = _Search;
}
