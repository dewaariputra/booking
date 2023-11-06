// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int id;
  String judul;
  String user;
  String image;
  String deskripsi;
  String status;
  // DateTime createdAt;
  // DateTime updatedAt;

  Post({
    required this.id,
    required this.judul,
    required this.user,
    required this.image,
    required this.deskripsi,
    required this.status,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        judul: json["judul"],
        user: json["user"],
        image: json["image"],
        deskripsi: json["deskripsi"],
        status: json["status"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "user": user,
        "image": image,
        "deskripsi": deskripsi,
        "status": status,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };
}
