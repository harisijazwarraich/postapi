import 'package:bloc/bloc.dart';
import 'package:facebook/cubit/edit_post_state.dart';
import 'package:facebook/cubit/posts_cubit.dart';
import 'package:facebook/data/models/post.dart';
import 'package:meta/meta.dart';

import '../data/repository.dart';

class EditPostCubit extends Cubit<EditPostState> {
  final Repository repository;
  final PostsCubit postsCubit;

  EditPostCubit({required this.repository, required this.postsCubit})
      : super(EditPostInitial());

  void deletePost(Post post) {
    repository.deletePost(post.id).then((isDeleted) {
      if (isDeleted.isNotEmpty) {
        postsCubit.deletePost(post);
        emit(PostEdited());
      }
    });
  }

  void updatePost(Post post, String title) {
    if (title.isEmpty) {
      emit(EditPostError(error: "Title cannot be empty"));
      return;
    }

    repository.updatePost(title, post.id).then((isEdited) {
      if (isEdited) {
        post.title = title;
        postsCubit.updatePost(post);
        emit(PostEdited());
      }
    });
  }
}
