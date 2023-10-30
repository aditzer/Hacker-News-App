import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news_app/bloc/hacker_news_bloc.dart';
import 'package:hacker_news_app/core/models/post.dart';
import 'package:hacker_news_app/ui/pages/post_detail_page.dart';
import 'package:hacker_news_app/ui/widgets/post_card_widget.dart';
import 'package:hacker_news_app/ui/widgets/search_bar_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hacker News"),
        centerTitle: true,
      ),
      body: BlocConsumer<HackerNewsBloc, HackerNewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HackerNewsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HackerNewsGetAllPostsFaliureState) {
              return Center(child: Text(state.error));
            } else if (state is HackerNewsBlocInitial) {
              return ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  children: [
                    SearchBarWidget(
                      onTap: onTapSearch,
                    )
                  ]);
            } else if (state is HackerNewsGetAllPostsSuccessState) {
              List<Post> posts = state.posts;
              return ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  children: [
                    SearchBarWidget(
                      onTap: onTapSearch,
                    ),
                    const SizedBox(height: 50),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const PageScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (BuildContext context, int index) {
                          Post post = posts[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PostDetailPage(
                                        post: post,
                                      )));
                            },
                            child: PostCardWidget(
                                title: post.title,
                                author: post.author,
                                points: post.points),
                          );
                        })
                  ]);
            } else {
              return Container();
            }
          }),
    );
  }

  void onTapSearch(String query) {
    BlocProvider.of<HackerNewsBloc>(context)
        .add(HackerNewsSearchNewsEvent(query: query));
  }
}
