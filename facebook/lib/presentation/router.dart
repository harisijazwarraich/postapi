import 'package:facebook/cubit/edit_post_cubit.dart';
import 'package:facebook/presentation/screens/add_post.dart';
import 'package:facebook/presentation/screens/all_posts.dart';
import 'package:facebook/presentation/screens/edit_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:facebook/constants/strings.dart';

import '../cubit/add_post_cubit.dart';
import '../cubit/posts_cubit.dart';
import '../data/models/post.dart';
import '../data/network_service.dart';
import '../data/repository.dart';

class AppRouter {
  late Repository repository;
  late PostsCubit postsCubit;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
    postsCubit = PostsCubit(repository: repository);
  }

  MaterialPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => PostsCubit(repository: repository),
            child: const PostsScreen(),
          ),
        );
      case CREATE_POST_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
                AddPostCubit(repository: repository, postsCubit: postsCubit),
            child: AddPostScreen(),
          ),
        );
      case EDIT_POST_ROUTE:
        final post = settings.arguments as Post;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
                EditPostCubit(repository: repository, postsCubit: postsCubit),
            child: EditPostScreen(post: post),
          ),
        );
      default:
        return null;
    }
  }
}
