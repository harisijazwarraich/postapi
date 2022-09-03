import 'package:facebook/cubit/edit_post_cubit.dart';
import 'package:facebook/cubit/edit_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import '../../cubit/posts_cubit.dart';
import '../../data/models/post.dart';

class EditPostScreen extends StatelessWidget {
  final Post post;
  EditPostScreen({Key? key, required this.post}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = post.title;

    return BlocListener<EditPostCubit, EditPostState>(
      listener: (context, state) {
        if (state is PostEdited) {
          Navigator.pop(context);
        } else if (state is EditPostError) {
          Toast.show(state.error,
              backgroundColor: Colors.red, duration: 3, gravity: Toast.center);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Post"),
          actions: [
            InkWell(
              onTap: () {
                BlocProvider.of<EditPostCubit>(context).deletePost(post);
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.delete),
              ),
            )
          ],
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            controller: _controller,
            autocorrect: true,
            decoration: const InputDecoration(hintText: "Update Post"),
          ),
          const Expanded(child: SizedBox()),
          InkWell(
              onTap: () {
                BlocProvider.of<EditPostCubit>(context)
                    .updatePost(post, _controller.text);
              },
              child: _updateBtn(context))
        ],
      ),
    );
  }

  Widget _updateBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Text(
          "Save Post",
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ),
    );
  }
}
