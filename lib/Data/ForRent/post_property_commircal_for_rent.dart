// To parse this JSON data, do
//
//     final PostPropertyCommericalForRent = PostPropertyForRentFromJson(jsonString);
/*
import 'dart:convert';

List<PostPropertyCommericalForRent> PostPropertyForRentFromJson(String str) =>
    List<PostPropertyCommericalForRent>.from(json.decode(str).map((x) => PostPropertyCommericalForRent.fromJson(x)));

String PostPropertyForRentToJson(List<PostPropertyCommericalForRent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostPropertyCommericalForRent {
  PostPropertyCommericalForRent({
    this.city,
    this.name,
    /* this.doors,
        this.color,
        this.kilometers,
        this.year,*/
  });

  String name;
  String city;

  factory PostPropertyCommericalForRent.fromJson(Map<String, dynamic> json) => PostPropertyCommericalForRent(
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

List<PostPropertyCommericalForRent> postFromJson(String str) =>
    List<PostPropertyCommericalForRent>.from(
        json.decode(str).map((x) => PostPropertyCommericalForRent.fromJson(x)));

String postToJson(List<PostPropertyCommericalForRent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostPropertyCommericalForRent {
  PostPropertyCommericalForRent({
    //this.image,
    this.lang,
    this.price,
    this.per,
    this.url,
    this.paid,
    this.furnished,
    this.landlordname,
    this.propertystatus,
    this.noticeperiod,
    this.contractperiod,
    this.occupancystatus,
    this.amenities,
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
    this.deednumber,
    this.registrationnumber,
  });
  dynamic // image,
      lang,
      price,
      per,
      url,
      paid,
      furnished,
      landlordname,
      propertystatus,
      noticeperiod,
      contractperiod,
      occupancystatus,
      amenities,
      youtubeurl,
      mainfee,
      gallery,
      description,
      location,
      discount,
      sqft,
      referenceid,
      building,
      neighborhood,
      deednumber,
      registrationnumber;

  factory PostPropertyCommericalForRent.fromJson(Map<String, dynamic> json) =>
      PostPropertyCommericalForRent(
        // image: json["property-for-rent-image"],
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
        landlordname: json["rera-landlord-name"],
        propertystatus: json["rera-property-status"],
        noticeperiod: json["notice-period"],
        contractperiod: json["minimum-contract-period"],
        occupancystatus: json["occupancy-status"],
        amenities: json["amenities_263"],
        referenceid: json["property-reference-id"],
        building: json["building"],
        neighborhood: json["neighborhood"],
        deednumber: json["rera-title-deed-number"],
        registrationnumber: json["rera-pre-registration-number"],
        lang: json["lang"],
      );
  Map<String, dynamic> toJson() => {
        //  "property-for-rent-image": image,
        "lang": lang,
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
        "rera-landlord-name": landlordname,
        "rera-property-status": propertystatus,
        "notice-period": noticeperiod,
        "minimum-contract-period": contractperiod,
        "occupancy-status": occupancystatus,
        "amenities_263": amenities,
        "property-reference-id": referenceid,
        "building": building,
        "neighborhood": neighborhood,
        "rera-title-deed-number": deednumber,
        "rera-pre-registration-number": registrationnumber,
      };
}
