import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final Function onTap;
  const SearchBarWidget({super.key, required this.onTap});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          hintText: "Search News",
          filled: true,
          fillColor: Colors.grey.shade300,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: const Icon(Icons.search),
          suffix: TextButton(
            child: const Text("Search"),
            onPressed: () => widget.onTap(controller.text),
          )),
    );
  }
}
