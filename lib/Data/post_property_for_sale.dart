// To parse this JSON data, do
//
//     final PostPropertyForSale = PostPropertyForSaleFromJson(jsonString);
/*
import 'dart:convert';

List<PostPropertyForSale> PostPropertyForSaleFromJson(String str) =>
    List<PostPropertyForSale>.from(json.decode(str).map((x) => PostPropertyForSale.fromJson(x)));

String PostPropertyForSaleToJson(List<PostPropertyForSale> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostPropertyForSale {
  PostPropertyForSale({
    this.city,
    this.name,
    /* this.doors,
        this.color,
        this.kilometers,
        this.year,*/
  });

  String name;
  String city;

  factory PostPropertyForSale.fromJson(Map<String, dynamic> json) => PostPropertyForSale(
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

List<PostPropertyForSale> postFromJson(String str) =>
    List<PostPropertyForSale>.from(
        json.decode(str).map((x) => PostPropertyForSale.fromJson(x)));

String postToJson(List<PostPropertyForSale> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostPropertyForSale {
  PostPropertyForSale(
      {this.image,
      this.price,
      this.url,
      this.readby,
      this.anualfee,
      this.youtubeurl,
      this.developer,
      this.mainfee,
      this.phone,
      this.gallery,
      this.description,
      this.location,
      this.discount,
      this.sqft,
      this.totalclosfee,
      this.referenceid,
      this.transferfee,
      this.listedby,
      this.zonefor,
      this.unfurnished,
      this.occupancystatus,
      this.building,
      this.neighborhood,
      this.landoragent,
      this.reralandlordname,
      this.property,
      this.deednumber,
      this.registrationnumber,
      this.idnumber,
      this.companyname,
      this.premitnumber,
      this.agentname
      });
  dynamic image,
      price,
      url,
      readby,
      anualfee,
      youtubeurl,
      developer,
      mainfee,
      phone,
      gallery,
      description,
      location,
      discount,
      sqft,
      totalclosfee,
      referenceid,
      transferfee,
      listedby,
      zonefor,
      unfurnished,
      occupancystatus,
      building,
      neighborhood,
      landoragent,
      reralandlordname,
      property,
      deednumber,
      registrationnumber,
      idnumber,
      companyname,
      premitnumber,
      agentname;

  // DateTime date;

  factory PostPropertyForSale.fromJson(Map<String, dynamic> json) =>
      PostPropertyForSale(
        image: json["property-for-sale-image"],
        price: json["price_sale"],
        url: json["360-tour-url"],
        readby: json["read-by-"],
        anualfee: json["annual-community-fee"],
        youtubeurl: json["youtube-url"],
        developer: json["developer"],
        mainfee: json["maintenance-fee"],
        phone: json["phone-number"],
        gallery: json["gallery-for-sale"],
        description: json["_description"],
        location: json["location"],
        discount: json["discount"],
        sqft: json["sqft-for-sale"],
        totalclosfee: json["total-closing-fee"],
        referenceid: json["property-reference-id"],
        transferfee: json["buyer-transfer-fee"],
        listedby: json["listed-by"],
        zonefor: json["zone-for"],
        unfurnished: json["unfurnished"],
        occupancystatus: json["occupancy-status-"],
        building: json["building"],
        neighborhood: json["neighborhood"],
        landoragent: json["land-or-agent"],
        reralandlordname: json["rera-landlord-name"],
        property: json["property"],
        deednumber: json["rera-title-deed-number"],
        registrationnumber: json["rera-pre-registration-number"],
        idnumber: json["rera-broker-id-number"],
        companyname: json["rera-lister-company-name"],
        premitnumber: json["rera-premit-number"],
        agentname: json["rera-agent-name"],
      );

  Map<String, dynamic> toJson() => {
        "property-for-sale-image": image,
        "price_sale": price,
        "360-tour-url": url,
        "read-by-": readby,
        "annual-community-fee": anualfee,
        "youtube-url": youtubeurl,
        "developer": developer,
        "maintenance-fee": mainfee,
        "phone-number": phone,
        "gallery-for-sale": gallery,
        "_description": description,
        "location": location,
        "discount": discount,
        "sqft-for-sale": sqft,
        "total-closing-fee": totalclosfee,
        "property-reference-id": referenceid,
        "buyer-transfer-fee": transferfee,
        "listed-by": listedby,
        "zone-for": zonefor,
        "unfurnished": unfurnished,
        "occupancy-status-": occupancystatus,
        "building": building,
        "neighborhood": neighborhood,
        "land-or-agent": landoragent,
        "rera-landlord-name": reralandlordname,
        "property": property,
        "rera-title-deed-number": deednumber,
        "rera-pre-registration-number": registrationnumber,
        "rera-broker-id-number": idnumber,
        "rera-lister-company-name": companyname,
        "rera-premit-number": premitnumber,
        "rera-agent-name": agentname,
      };
}
