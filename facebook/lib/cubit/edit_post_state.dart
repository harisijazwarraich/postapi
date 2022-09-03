import 'package:flutter/material.dart';

@immutable
abstract class EditPostState {}

class EditPostInitial extends EditPostState {}

class EditPostError extends EditPostState {
  final String error;

  EditPostError({required this.error});
}

class PostEdited extends EditPostState {}
