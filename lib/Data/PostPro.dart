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
/*
import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.age,
    this.id,
    this.km,
    this.type,
    this.year,
    this.name,
    /* this.doors,
        this.color,
        this.kilometers,
        this.year,*/
  });

  int age;
 // DateTime date;
  int km;
  int type;
  int year;
  int id;
   String name;
   /* String color;
    String kilometers;
    String year;*/

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        age: json["age"],
        id:json["_id"],
        name: json["name"],
      //  date: DateTime.parse(json["date"]),
        km: json["km"],
        type: json["type"],
        year: json["year"],
        /*  doors: json["doors"],
        color: json["color"],
        kilometers: json["kilometers"],
        year: json["year"],*/
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "_id":id,
        "name":name,
       // "date": date.toIso8601String(),
        "km": km,
        "type": type,
        "year": year,
        /*"doors": doors,
        "color": color,
        "kilometers": kilometers,
        "year": year,*/
      };
}*/
import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.id,
    this.slug,
  });

  int id;
  String slug;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {"id": id, "slug": slug};
}