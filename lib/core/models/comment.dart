// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Comment {
  String author;
  String text;

  Comment({
    required this.author,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'text': text,
    };
  }

  factory Comment.fromMap(Map<dynamic, dynamic> map) {
    return Comment(
      author: map['author'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);
}
