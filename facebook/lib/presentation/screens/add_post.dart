import 'package:facebook/cubit/add_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import '../../cubit/add_post_cubit.dart';

class AddPostScreen extends StatelessWidget {
  final _controller = TextEditingController();

  AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a post"),
      ),
      body: BlocListener<AddPostCubit, AddPostState>(
        listener: (context, state) {
          if (state is PostAdded) {
            Navigator.pop(context);
          } else if (state is AddPostError) {
            Toast.show(
              state.error,
              duration: 3,
              backgroundColor: Colors.red,
              gravity: Toast.center,
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: _body(context),
        ),
      ),
    );
  }

  Widget _body(context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          controller: _controller,
          decoration: const InputDecoration(hintText: "What's up?"),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        InkWell(
          onTap: () {
            final message = _controller.text;
            BlocProvider.of<AddPostCubit>(context).addTodo(message);
          },
          child: _addBtn(context),
        )
      ],
    );
  }

  Widget _addBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: BlocBuilder<AddPostCubit, AddPostState>(
          builder: (context, state) {
            if (state is AddingPost) return const CircularProgressIndicator();

            return const Text(
              "Create a lovely post!",
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
