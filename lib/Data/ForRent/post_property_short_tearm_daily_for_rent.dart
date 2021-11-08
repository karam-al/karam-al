// To parse this JSON data, do
//
//     final PostPropertyShortTearmDailyForRent = PostPropertyShortTearmDailyForRentFromJson(jsonString);
/*
import 'dart:convert';

List<PostPropertyShortTearmDailyForRent> PostPropertyShortTearmDailyForRentFromJson(String str) =>
    List<PostPropertyShortTearmDailyForRent>.from(json.decode(str).map((x) => PostPropertyShortTearmDailyForRent.fromJson(x)));

String PostPropertyShortTearmDailyForRentToJson(List<PostPropertyShortTearmDailyForRent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostPropertyShortTearmDailyForRent {
  PostPropertyShortTearmDailyForRent({
    this.city,
    this.name,
    /* this.doors,
        this.color,
        this.kilometers,
        this.year,*/
  });

  String name;
  String city;

  factory PostPropertyShortTearmDailyForRent.fromJson(Map<String, dynamic> json) => PostPropertyShortTearmDailyForRent(
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

List<PostPropertyShortTearmDailyForRent> postFromJson(String str) =>
    List<PostPropertyShortTearmDailyForRent>.from(json
        .decode(str)
        .map((x) => PostPropertyShortTearmDailyForRent.fromJson(x)));

String postToJson(List<PostPropertyShortTearmDailyForRent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostPropertyShortTearmDailyForRent {
  PostPropertyShortTearmDailyForRent({
    this.lang,
    this.image,
    this.price,
    this.per,
    this.url,
    this.paid,
    this.furnished,
    this.bedrooms,
    this.bathrooms,
    this.contractperiod,
    this.noticeperiod,
    this.youtubeurl,
    this.mainfee,
    this.gallery,
    this.description,
    this.location,
    this.discount,
    this.sqft,
    this.referenceid,
    this.building,
    this.neighborhood,
  });
  dynamic lang,
      image,
      price,
      per,
      url,
      paid,
      furnished,
      bedrooms,
      bathrooms,
      contractperiod,
      noticeperiod,
      youtubeurl,
      mainfee,
      gallery,
      description,
      location,
      discount,
      sqft,
      referenceid,
      building,
      neighborhood;

  factory PostPropertyShortTearmDailyForRent.fromJson(
          Map<String, dynamic> json) =>
      PostPropertyShortTearmDailyForRent(
        image: json["property-for-rent-image"],
        price: json["price"],
        per: json["per"],
        url: json["360-tour-url"],
        paid: json["rent-is-paid"],
        youtubeurl: json["youtube-url"],
        mainfee: json["maintenance-fee"],
        gallery: json["gallery-for-rent"],
        description: json["desctiption"],
        location: json["location"],
        discount: json["discount"],
        sqft: json["sqft"],
        furnished: json["is-it-furnished"],
        bedrooms: json["bedrooms_840"],
        bathrooms: json["bathrooms_163"],
        contractperiod: json["minimum-contract-period_992"],
        noticeperiod: json["notice-period_894"],
        referenceid: json["property-reference-id_485"],
        building: json["building"],
        neighborhood: json["neighborhood"],
        lang: json["lang"],
      );
  Map<String, dynamic> toJson() => {
        "lang": lang,
        "property-for-rent-image": image,
        "price": price,
        "per": per,
        "360-tour-url": url,
        "rent-is-paid": paid,
        "youtube-url": youtubeurl,
        "maintenance-fee": mainfee,
        "gallery-for-rent": gallery,
        "desctiption": description,
        "location": location,
        "discount": discount,
        "sqft": sqft,
        "is-it-furnished": furnished,
        "bedrooms_840": bedrooms,
        "bathrooms_163": bathrooms,
        "minimum-contract-period_992": contractperiod,
        "notice-period_894": noticeperiod,
        "property-reference-id_485": referenceid,
        "building": building,
        "neighborhood": neighborhood,
      };
}
