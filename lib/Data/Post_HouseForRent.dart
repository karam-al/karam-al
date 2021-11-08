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

////////

import 'dart:convert';

List<Post3> postFromJson(String str) =>
    List<Post3>.from(json.decode(str).map((x) => Post3.fromJson(x)));

String postToJson(List<Post3> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post3 {
  Post3({this.beds, this.sqFt, this.baths, this.amenities,this.price});

  int beds, sqFt, baths , price;
  String amenities;
  factory Post3.fromJson(Map<String, dynamic> json) => Post3(
        beds: json["Beds"],
        baths: json["Baths"],
        sqFt: json["SqFt"],
        amenities: json["Amenities"],
        price : json["Price"]
      );

  Map<String, dynamic> toJson() => {
        "Beds": beds,
        "Baths": baths,
        "SqFt": sqFt,
        "Amenities": amenities,
        "Price":price
      };
}
