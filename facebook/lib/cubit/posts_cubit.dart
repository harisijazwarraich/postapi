import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:facebook/cubit/posts_state.dart';
import 'package:facebook/data/repository.dart';

import '../data/models/post.dart';

class PostsCubit extends Cubit<PostsState> {
  final Repository repository;

  PostsCubit({required this.repository}) : super(PostsInitial());

  void getPosts() {
    Timer(const Duration(seconds: 3), () {
      repository.getPosts().then((posts) {
        emit(PostsLoaded(posts: posts as List<Post>));
      });
    });
  }

  void updatePost(Post post) {
    final currentState = state;
    if (currentState is PostsLoaded) {
      emit(PostsLoaded(posts: currentState.posts));
    }
  }

  void likePost(Post post) {
    final currentState = state;
    if (currentState is PostsLoaded) {
      post.likes += 1;
      repository.likePost(post.id, post.likes);
      emit(PostsLoaded(posts: currentState.posts));
    }
  }

  createPost(Post post) {
    final currentState = state;
    if (currentState is PostsLoaded) {
      final postsList = currentState.posts;
      postsList.add(post);
      emit(PostsLoaded(posts: postsList));
    }
  }

  void deletePost(Post post) {
    final currentState = state;
    if (currentState is PostsLoaded) {
      final postsList =
          currentState.posts.where((element) => element.id != post.id).toList();
      emit(PostsLoaded(posts: postsList));
    }
  }
}
