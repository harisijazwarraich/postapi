import 'package:flutter/material.dart';

import '../data/models/post.dart';

@immutable
abstract class AddPostState {}

class AddPostInitial extends AddPostState {}

class AddPostError extends AddPostState {
  final String error;

  AddPostError({required this.error});
}

class AddingPost extends AddPostState {}

class PostAdded extends AddPostState {}
