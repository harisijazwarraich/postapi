class Post {
  String title;
  int likes;
  String id;

  Post.fromJson(Map json)
      : id = json["_id"],
        title = json["title"],
        likes = json["likes"] as int;
}
