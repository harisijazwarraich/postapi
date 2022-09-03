import 'package:facebook/data/models/post.dart';
import 'package:facebook/data/network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List> getPosts() async {
    final posts = await networkService.getPosts();
    return posts.map((e) => Post.fromJson(e)).toList();
  }

  // Future<bool> changeCompletion(bool isCompleted, int id) async {
  //   final patchObj = { "isCompleted": isCompleted.toString() };
  //   return await networkService.patchTodo(patchObj, id);
  // }

  Future<Post?> createPost(String title) async {
    final postObj = {"title": title};

    final postsMap = await networkService.createPost(postObj);
    if (postsMap == null) return null;

    return Post.fromJson(postsMap);
  }

  Future<Map<String, dynamic>> deletePost(String id) async {
    return await networkService.deletePost(id);
  }

  Future<Map<String, dynamic>> likePost(String id, int likes) async {
    return await networkService.likePost(id, likes);
  }

  Future<bool> updatePost(String title, String id) async {
    final updated = {"title": title};
    return await networkService.updatePost(updated, id);
  }
}
