import 'package:facebook/constants/strings.dart';
import 'package:facebook/cubit/add_post_state.dart';
import 'package:facebook/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/add_post_cubit.dart';
import '../../cubit/posts_state.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostsCubit>(context).getPosts();

    return Scaffold(
      appBar: AppBar(title: const Text('Posts API Presentation')),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is! PostsLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          final posts = (state).posts;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: posts
                        .map(
                          (post) => InkWell(
                            onDoubleTap: () {
                              BlocProvider.of<PostsCubit>(context)
                                  .likePost(post);
                            },
                            onTap: () {
                              Navigator.pushNamed(context, EDIT_POST_ROUTE,
                                  arguments: post);
                            },
                            child: Card(
                              child: ListTile(
                                enabled: true,
                                trailing: Text(
                                  '${post.likes} Likes',
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(post.title),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: InkWell(
        onTap: () => Navigator.pushNamed(context, CREATE_POST_ROUTE),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(Icons.add, color: Colors.black, size: 35),
        ),
      ),
    );
  }
}
