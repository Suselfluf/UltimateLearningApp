// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.id,
    required this.meaning,
    required this.weight,
  });

  int id;
  String meaning;
  double weight;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        meaning: json["meaning"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meaning": meaning,
        "weight": weight,
      };
}
