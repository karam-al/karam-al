import 'dart:convert';

List<Post2> postFromJson(String str) =>
    List<Post2>.from(json.decode(str).map((x) => Post2.fromJson(x)));

String postToJson(List<Post2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post2 {
  Post2({this.color, this.model, this.condition, this.memory, this.price
      /* this.doors,
        this.color,
        this.kilometers,
        this.year,*/
      });

  String color;
  String model;
  String condition;
  String memory;
  int price;
  /* String color;
    String kilometers;
    String year;*/

  factory Post2.fromJson(Map<String, dynamic> json) => Post2(
        color: json["Color"],
        model: json["Model"],
        condition: json["Condition"],
        //  date: DateTime.parse(json["date"]),
        memory: json["Memory"],
        price: json["Price"],
      );

  Map<String, dynamic> toJson() => {
        "Color": color,
        "Model": model,
        "Condition": condition,
        // "date": date.toIso8601String(),
        "Memory": memory,
        "Price": price,
        /*"doors": doors,
        "color": color,
        "kilometers": kilometers,
        "year": year,*/
      };
}
