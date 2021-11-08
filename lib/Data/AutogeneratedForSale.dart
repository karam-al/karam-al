// To parse this JSON data, do
//
//     final forSale = forSaleFromJson(jsonString);

import 'dart:convert';

List<ForSale> forSaleFromJson(String str) => List<ForSale>.from(json.decode(str).map((x) => ForSale.fromJson(x)));

String forSaleToJson(List<ForSale> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForSale {
    ForSale({
        this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.title,
        this.lang,
        this.acf,
    });

    int id;
    DateTime date;
    DateTime dateGmt;
    Guid guid;
    DateTime modified;
    DateTime modifiedGmt;
    Guid title;
    String lang;
    Acf acf;

    factory ForSale.fromJson(Map<String, dynamic> json) => ForSale(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        title: Guid.fromJson(json["title"]),
        lang: json["lang"],
        acf: Acf.fromJson(json["acf"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "title": title.toJson(),
        "lang": lang,
        "acf": acf.toJson(),
    };
}

class Acf {
    Acf({
        this.priceSale,
        this.galleryForSale,
        this.the360TourUrl,
        this.readBy,
        this.annualCommunityFee,
        this.youtubeUrl,
        this.developer,
        this.maintenanceFee,
        this.phoneNumber,
        this.description,
        this.location,
        this.discount,
        this.sqftForSale,
        this.totalClosingFee,
        this.propertyReferenceId,
        this.buyerTransferFee,
        this.sellerTransferFee,
        this.listedBy,
        this.zoneFor,
        this.unfurnished,
        this.occupancyStatus,
        this.building,
        this.neighborhood,
        this.landOrAgent,
        this.reraLandlordName,
        this.property,
        this.reraTitleDeedNumber,
        this.reraPreRegistrationNumber,
        this.reraBrokerIdNumber,
        this.reraListerCompanyName,
        this.reraPremitNumber,
        this.reraAgentName,
        this.checkBoxes1,
        this.bedrooms,
        this.bathrooms,
        this.checkBoxes,
        this.approvedBuildUpAreaSize,
        this.freeHold,
    });

    String priceSale;
    List<String> galleryForSale;
    String the360TourUrl;
    String readBy;
    String annualCommunityFee;
    String youtubeUrl;
    String developer;
    String maintenanceFee;
    String phoneNumber;
    String description;
    String location;
    String discount;
    String sqftForSale;
    String totalClosingFee;
    String propertyReferenceId;
    String buyerTransferFee;
    String sellerTransferFee;
    String listedBy;
    String zoneFor;
    String unfurnished;
    String occupancyStatus;
    String building;
    String neighborhood;
    String landOrAgent;
    String reraLandlordName;
    String property;
    String reraTitleDeedNumber;
    String reraPreRegistrationNumber;
    String reraBrokerIdNumber;
    String reraListerCompanyName;
    String reraPremitNumber;
    String reraAgentName;
    List<dynamic> checkBoxes1;
    String bedrooms;
    String bathrooms;
    List<dynamic> checkBoxes;
    String approvedBuildUpAreaSize;
    String freeHold;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        priceSale: json["price_sale"],
        galleryForSale: List<String>.from(json["gallery-for-sale"].map((x) => x)),
        the360TourUrl: json["360-tour-url"],
        readBy: json["read-by-"],
        annualCommunityFee: json["annual-community-fee"],
        youtubeUrl: json["youtube-url"],
        developer: json["developer"],
        maintenanceFee: json["maintenance-fee"],
        phoneNumber: json["phone-number"],
        description: json["_description"],
        location: json["location"],
        discount: json["discount"],
        sqftForSale: json["sqft-for-sale"],
        totalClosingFee: json["total-closing-fee"],
        propertyReferenceId: json["property-reference-id"],
        buyerTransferFee: json["buyer-transfer-fee"],
        sellerTransferFee: json["seller-transfer-fee"],
        listedBy: json["listed-by"],
        zoneFor: json["zone-for"],
        unfurnished: json["unfurnished"],
        occupancyStatus: json["occupancy-status-"],
        building: json["building"],
        neighborhood: json["neighborhood"],
        landOrAgent: json["land-or-agent"],
        reraLandlordName: json["rera-landlord-name"],
        property: json["property"],
        reraTitleDeedNumber: json["rera-title-deed-number"],
        reraPreRegistrationNumber: json["rera-pre-registration-number"],
        reraBrokerIdNumber: json["rera-broker-id-number"],
        reraListerCompanyName: json["rera-lister-company-name"],
        reraPremitNumber: json["rera-premit-number"],
        reraAgentName: json["rera-agent-name"],
        checkBoxes1: List<dynamic>.from(json["check-boxes1"].map((x) => x)),
        bedrooms: json["bedrooms-"],
        bathrooms: json["bathrooms-"],
        checkBoxes: List<dynamic>.from(json["check-boxes"].map((x) => x)),
        approvedBuildUpAreaSize: json["approved-build-up-area-size"],
        freeHold: json["free-hold-"],
    );

    Map<String, dynamic> toJson() => {
        "price_sale": priceSale,
        "gallery-for-sale": List<dynamic>.from(galleryForSale.map((x) => x)),
        "360-tour-url": the360TourUrl,
        "read-by-": readBy,
        "annual-community-fee": annualCommunityFee,
        "youtube-url": youtubeUrl,
        "developer": developer,
        "maintenance-fee": maintenanceFee,
        "phone-number": phoneNumber,
        "_description": description,
        "location": location,
        "discount": discount,
        "sqft-for-sale": sqftForSale,
        "total-closing-fee": totalClosingFee,
        "property-reference-id": propertyReferenceId,
        "buyer-transfer-fee": buyerTransferFee,
        "seller-transfer-fee": sellerTransferFee,
        "listed-by": listedBy,
        "zone-for": zoneFor,
        "unfurnished": unfurnished,
        "occupancy-status-": occupancyStatus,
        "building": building,
        "neighborhood": neighborhood,
        "land-or-agent": landOrAgent,
        "rera-landlord-name": reraLandlordName,
        "property": property,
        "rera-title-deed-number": reraTitleDeedNumber,
        "rera-pre-registration-number": reraPreRegistrationNumber,
        "rera-broker-id-number": reraBrokerIdNumber,
        "rera-lister-company-name": reraListerCompanyName,
        "rera-premit-number": reraPremitNumber,
        "rera-agent-name": reraAgentName,
        "check-boxes1": List<dynamic>.from(checkBoxes1.map((x) => x)),
        "bedrooms-": bedrooms,
        "bathrooms-": bathrooms,
        "check-boxes": List<dynamic>.from(checkBoxes.map((x) => x)),
        "approved-build-up-area-size": approvedBuildUpAreaSize,
        "free-hold-": freeHold,
    };
}

class Guid {
    Guid({
        this.rendered,
    });

    String rendered;

    factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}
