import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:facebook/cubit/add_post_state.dart';
import 'package:facebook/cubit/posts_cubit.dart';
import 'package:facebook/data/repository.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final Repository repository;
  final PostsCubit postsCubit;

  AddPostCubit({required this.repository, required this.postsCubit})
      : super(AddPostInitial());
  void addTodo(String title) {
    if (title.isEmpty) {
      emit(AddPostError(error: "Post Body cannot be empty"));
      return;
    }
    emit(AddingPost());
    Timer(const Duration(seconds: 2), () {
      repository.createPost(title).then((post) {
        if (post != null) {
          postsCubit.createPost(post);
          emit(PostAdded());
        }
      });
    });
  }
}
