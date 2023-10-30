// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  String author;
  String title;
  String objectId;
  int points;

  Post({
    required this.author,
    required this.title,
    required this.objectId,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'objectID': objectId,
      'points': points,
    };
  }

  factory Post.fromMap(Map<dynamic, dynamic> map) {
    return Post(
      author: map['author'] as String,
      title: map['title'] as String,
      objectId: map['objectID'] as String,
      points: map['points'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
