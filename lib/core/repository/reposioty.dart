import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hacker_news_app/common/constants.dart';
import 'package:hacker_news_app/core/models/comment.dart';
import 'package:hacker_news_app/core/models/post.dart';

class Repository {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Post>> getAllPosts(String query) async {
    try {
      String path = "search?query=$query";
      var response = await dio.get(path);

      List<Post> data = [];
      if (response.statusCode == 200) {
        for (Map<dynamic, dynamic> child in response.data["hits"]) {
          Post post = Post.fromMap(child);
          data.add(post);
        }
      }
      return data;
    } catch (e) {
      log(e.toString());
      return Future.error("An Error occurred!");
    }
  }

  Future<List<Comment>> getComments(String postId) async {
    try {
      String path = postId;
      var response = await dio.get("items/$path");

      List<Comment> data = [];
      if (response.statusCode == 200) {
        for (Map<dynamic, dynamic> child in response.data["children"]) {
          Comment comment = Comment.fromMap(child);
          data.add(comment);
        }
      }
      return data;
    } catch (e) {
      log(e.toString());
      return Future.error("An Error occurred!");
    }
  }
}
