part of 'hacker_news_bloc.dart';

@immutable
sealed class HackerNewsState {}

final class HackerNewsBlocInitial extends HackerNewsState {}

class HackerNewsLoadingState extends HackerNewsState {}

class HackerNewsGetAllPostsSuccessState extends HackerNewsState {
  final List<Post> posts;
  HackerNewsGetAllPostsSuccessState({required this.posts});
}

class HackerNewsGetAllPostsFaliureState extends HackerNewsState {
  final String error;
  HackerNewsGetAllPostsFaliureState({required this.error});
}

class HackerNewsGetPostSuccessState extends HackerNewsState {
  final List<Comment> comments;
  HackerNewsGetPostSuccessState({required this.comments});
}

class HackerNewsGetPostFaliureState extends HackerNewsState {
  final String error;
  HackerNewsGetPostFaliureState({required this.error});
}
