import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacker_news_app/bloc/hacker_news_bloc.dart';
import 'package:hacker_news_app/core/models/comment.dart';
import 'package:hacker_news_app/core/models/post.dart';
import 'package:hacker_news_app/ui/widgets/comment_card_widget.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;
  const PostDetailPage({super.key, required this.post});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final bloc = HackerNewsBloc();

  @override
  void initState() {
    bloc.add(HackerNewsGetPostEvent(id: widget.post.objectId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hacker News"),
          centerTitle: true,
        ),
        body: BlocConsumer<HackerNewsBloc, HackerNewsState>(
            bloc: bloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HackerNewsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HackerNewsGetPostFaliureState) {
                return Center(child: Text(state.error));
              } else if (state is HackerNewsGetPostSuccessState) {
                List<Comment> comments = state.comments;
                return ListView(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  children: [
                    Center(
                      child: Text(widget.post.title,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    const SizedBox(height: 5),
                    const Divider(
                      thickness: 4,
                      color: Colors.redAccent,
                      endIndent: 150,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Written By ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          widget.post.author,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Points ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          widget.post.points.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        shrinkWrap: true,
                        physics: const PageScrollPhysics(),
                        itemCount: comments.length,
                        itemBuilder: (BuildContext context, int index) {
                          Comment comment = comments[index];
                          return CommentCardWidget(
                              author: comment.author, text: comment.text);
                        })
                  ],
                );
              } else {
                return Container();
              }
            }));
  }
}
