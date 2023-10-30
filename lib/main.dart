import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news_app/bloc/hacker_news_bloc.dart';
import 'package:hacker_news_app/common/theme.dart';
import 'package:hacker_news_app/ui/pages/search_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HackerNewsBloc(),
        child: const SearchPage(),
      ),
    );
  }
}
