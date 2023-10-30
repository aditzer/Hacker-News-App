import 'package:flutter/material.dart';

class CommentCardWidget extends StatelessWidget {
  final String author;
  final String text;
  const CommentCardWidget(
      {super.key, required this.author, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 12, offset: Offset(0, 6))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(author,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent)),
          const SizedBox(height: 10),
          Text(text, style: const TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}
