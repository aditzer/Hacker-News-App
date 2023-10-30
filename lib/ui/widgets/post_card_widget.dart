import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  final String title;
  final String author;
  final int points;
  const PostCardWidget(
      {super.key,
      required this.title,
      required this.author,
      required this.points});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
                colors: [Colors.pink, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            boxShadow: const [
              BoxShadow(color: Colors.red, blurRadius: 12, offset: Offset(0, 6))
            ]),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "written by ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  author,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.star),
                Text(
                  " Points $points",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
