// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);
/*
import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.city,
    this.name,
    /* this.doors,
        this.color,
        this.kilometers,
        this.year,*/
  });

  String name;
  String city;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        name: json["name"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "name": name,
      };
}
*/
//////////////////////////////////////

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({this.user_login, this.user_email, this.user_nicename });
  dynamic user_login, user_email, user_nicename  ; 
 
  factory Post.fromJson(Map<String, dynamic> json) => Post(
      user_login: json["user_login"],
      user_email: json["user_email"],
      user_nicename: json["user_nicename"] );
  Map<String, dynamic> toJson() => {
       "user_login": user_login,
        "user_email": user_email,
        "user_nicename": user_nicename, 
      };
}
