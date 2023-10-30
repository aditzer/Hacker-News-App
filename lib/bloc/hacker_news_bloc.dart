import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news_app/core/models/comment.dart';
import 'package:hacker_news_app/core/models/post.dart';
import 'package:hacker_news_app/core/repository/reposioty.dart';
import 'package:meta/meta.dart';

part 'hacker_news_event.dart';
part 'hacker_news_state.dart';

class HackerNewsBloc extends Bloc<HackerNewsEvent, HackerNewsState> {
  final Repository repository = Repository();
  HackerNewsBloc() : super(HackerNewsBlocInitial()) {
    on<HackerNewsSearchNewsEvent>(hackerNewsSearchNewsEvent);
    on<HackerNewsGetPostEvent>(hackerNewsGetPostEvent);
  }

  FutureOr<void> hackerNewsSearchNewsEvent(
      HackerNewsSearchNewsEvent event, Emitter<HackerNewsState> emit) async {
    String query = event.query;
    emit(HackerNewsLoadingState());
    List<Post> posts =
        await repository.getAllPosts(query).onError((error, stackTrace) {
      emit(HackerNewsGetAllPostsFaliureState(error: "An Error Occurred!"));
      return [];
    });
    emit(HackerNewsGetAllPostsSuccessState(posts: posts));
  }

  Future<FutureOr<void>> hackerNewsGetPostEvent(
      HackerNewsGetPostEvent event, Emitter<HackerNewsState> emit) async {
    String id = event.id;
    emit(HackerNewsLoadingState());
    List<Comment> comments =
        await repository.getComments(id).onError((error, stackTrace) {
      emit(HackerNewsGetPostFaliureState(error: "An Error Occurred!"));
      return [];
    });
    emit(HackerNewsGetPostSuccessState(comments: comments));
  }
}
