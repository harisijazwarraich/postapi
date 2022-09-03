import 'dart:convert';

import 'package:http/http.dart';

import 'models/post.dart';

class NetworkService {
  final baseUrl = "http://localhost:5000/api/v1/posts";

  Future<List<dynamic>> getPosts() async {
    try {
      final response = await get(Uri.parse(baseUrl));
      return jsonDecode(response.body)['posts'];
    } catch (e) {
      return [];
    }
  }

  Future<bool> updatePost(Map<String, String> reqBody, String id) async {
    try {
      await patch(Uri.parse("$baseUrl/$id"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'title': reqBody['title']!,
          }));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>?> createPost(Map<String, String> reqBody) async {
    try {
      final response = await post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': reqBody['title']!,
        }),
      );
      return jsonDecode(response.body)['post'];
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> deletePost(String id) async {
    try {
      final response = await delete(Uri.parse("$baseUrl/$id"));
      return jsonDecode(response.body);
    } catch (err) {
      return {"err": err};
    }
  }

  Future<Map<String, dynamic>> likePost(String id, int likes) async {
    try {
      final response = await patch(Uri.parse("$baseUrl/$id"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'likes': likes}));

      return jsonDecode(response.body);
    } catch (err) {
      return {"err": err};
    }
  }
}
