part of 'hacker_news_bloc.dart';

@immutable
sealed class HackerNewsEvent {}

class HackerNewsSearchNewsEvent extends HackerNewsEvent {
  final String query;
  HackerNewsSearchNewsEvent({required this.query});
}

class HackerNewsGetPostEvent extends HackerNewsEvent {
  final String id;
  HackerNewsGetPostEvent({required this.id});
}
