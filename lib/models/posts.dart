import 'dart:convert';

List<Posts> postFromJson(String str) =>
    List<Posts>.from(json.decode(str).map((x) => Posts.fromMap(x)));

class Posts {
  int userId;
  int id;
  String title;
  String body;

  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Posts.fromMap(Map<String, dynamic> json) => Posts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
