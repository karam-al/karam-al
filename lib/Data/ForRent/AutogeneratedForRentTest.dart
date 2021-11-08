// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.title,
        this.lang,
        this.acf,
    });

    DateTime date;
    DateTime dateGmt;
    Guid guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    String status;
    Guid title;
    String lang;
    Acf acf;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        title: Guid.fromJson(json["title"]),
        lang: json["lang"],
        acf: Acf.fromJson(json["acf"]),
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "title": title.toJson(),
        "lang": lang,
        "acf": acf.toJson(),
    };
}

class Acf {
    Acf({
        this.price,
        this.per,
        this.galleryForRent,
        this.desctiption,
        this.location,
        this.propPhoneNumber,
        this.the360TourUrl,
        this.youtubeUrl,
        this.rentIsPaid,
        this.maintenanceFee,
        this.discount,
        this.sqft,
        this.isItFurnished,
        this.building,
        this.neighborhood,
        this.propRefeId,
        this.minimumContractPeriodInMonth,
        this.noticePeriodInMonth,
        this.bathroom,
        this.bedroom,
        this.reraLandlordName719,
        this.reraPropertyStatus0,
        this.reraTitleDeedNumber842,
        this.reraPreRegistrationNumber61,
        this.amenities,
        this.propertyReferenceId,
        this.reraLandlordName,
        this.reraPropertyStatus,
        this.reraTitleDeedNumber,
        this.reraPreRegistrationNumber,
        this.noticePeriod,
        this.minimumContractPeriod,
        this.occupancyStatus,
        this.amenities263,
        this.acfPropertyReferenceId,
        this.minimumContractPeriodInMonths,
        this.noticePeriodInMonths,
        this.amenities679,
        this.typeOfTenantsAllowed,
        this.roomType,
        this.preferredNationalityOfTenants,
        this.baths,
        this.numberOfTenants,
        this.securityDeposit,
        this.minimumContractPeriod332,
        this.amenities368,
        this.noticePeriod373,
        this.propertyReferenceId417,
        this.bathrooms,
        this.bedrooms,
        this.bedrooms840,
        this.bathrooms163,
        this.minimumContractPeriod992,
        this.noticePeriod894,
        this.propertyReferenceId485,
    });

    String price;
    String per;
    List<String> galleryForRent;
    String desctiption;
    String location;
    String propPhoneNumber;
    String the360TourUrl;
    String youtubeUrl;
    String rentIsPaid;
    String maintenanceFee;
    String discount;
    String sqft;
    String isItFurnished;
    String building;
    String neighborhood;
    String propRefeId;
    String minimumContractPeriodInMonth;
    String noticePeriodInMonth;
    String bathroom;
    String bedroom;
    String reraLandlordName719;
    String reraPropertyStatus0;
    String reraTitleDeedNumber842;
    String reraPreRegistrationNumber61;
    List<dynamic> amenities;
    String propertyReferenceId;
    String reraLandlordName;
    String reraPropertyStatus;
    String reraTitleDeedNumber;
    String reraPreRegistrationNumber;
    String noticePeriod;
    String minimumContractPeriod;
    String occupancyStatus;
    List<dynamic> amenities263;
    String acfPropertyReferenceId;
    String minimumContractPeriodInMonths;
    String noticePeriodInMonths;
    List<dynamic> amenities679;
    String typeOfTenantsAllowed;
    String roomType;
    String preferredNationalityOfTenants;
    String baths;
    String numberOfTenants;
    String securityDeposit;
    String minimumContractPeriod332;
    List<Amenities368> amenities368;
    String noticePeriod373;
    String propertyReferenceId417;
    String bathrooms;
    String bedrooms;
    String bedrooms840;
    String bathrooms163;
    String minimumContractPeriod992;
    String noticePeriod894;
    String propertyReferenceId485;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        price: json["price"],
        per: json["per"],
        galleryForRent: List<String>.from(json["gallery-for-rent"].map((x) => x)),
        desctiption: json["desctiption"],
        location: json["location"],
        propPhoneNumber: json["prop_phone_number"],
        the360TourUrl: json["360-tour-url"],
        youtubeUrl: json["youtube-url"],
        rentIsPaid: json["rent-is-paid"],
        maintenanceFee: json["maintenance-fee"],
        discount: json["discount"],
        sqft: json["sqft"],
        isItFurnished: json["is-it-furnished"],
        building: json["building"],
        neighborhood: json["neighborhood"],
        propRefeId: json["prop-refe-id"],
        minimumContractPeriodInMonth: json["minimum-contract-period-in-month"],
        noticePeriodInMonth: json["notice-period-in-month"],
        bathroom: json["bathroom"],
        bedroom: json["bedroom"],
        reraLandlordName719: json["rera-landlord-name_719"],
        reraPropertyStatus0: json["rera-property-status_0"],
        reraTitleDeedNumber842: json["rera-title-deed-number_842"],
        reraPreRegistrationNumber61: json["rera-pre-registration-number_61"],
        amenities: List<dynamic>.from(json["amenities"].map((x) => x)),
        propertyReferenceId: json["property-reference-id"],
        reraLandlordName: json["rera-landlord-name"],
        reraPropertyStatus: json["rera-property-status"],
        reraTitleDeedNumber: json["rera-title-deed-number"],
        reraPreRegistrationNumber: json["rera-pre-registration-number"],
        noticePeriod: json["notice-period"],
        minimumContractPeriod: json["minimum-contract-period"],
        occupancyStatus: json["occupancy-status"],
        amenities263: List<dynamic>.from(json["amenities_263"].map((x) => x)),
        acfPropertyReferenceId: json["property-reference-id-"],
        minimumContractPeriodInMonths: json["minimum-contract-period-in-months"],
        noticePeriodInMonths: json["notice-period-in-months"],
        amenities679: List<dynamic>.from(json["amenities_679"].map((x) => x)),
        typeOfTenantsAllowed: json["type-of-tenants-allowed"],
        roomType: json["room-type"],
        preferredNationalityOfTenants: json["preferred-nationality-of-tenants"],
        baths: json["baths"],
        numberOfTenants: json["number-of-tenants"],
        securityDeposit: json["security-deposit"],
        minimumContractPeriod332: json["minimum-contract-period_332"],
        amenities368: List<Amenities368>.from(json["amenities_368"].map((x) => Amenities368.fromJson(x))),
        noticePeriod373: json["notice-period_373"],
        propertyReferenceId417: json["property-reference-id_417"],
        bathrooms: json["bathrooms"],
        bedrooms: json["bedrooms"],
        bedrooms840: json["bedrooms_840"],
        bathrooms163: json["bathrooms_163"],
        minimumContractPeriod992: json["minimum-contract-period_992"],
        noticePeriod894: json["notice-period_894"],
        propertyReferenceId485: json["property-reference-id_485"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "per": per,
        "gallery-for-rent": List<dynamic>.from(galleryForRent.map((x) => x)),
        "desctiption": desctiption,
        "location": location,
        "prop_phone_number": propPhoneNumber,
        "360-tour-url": the360TourUrl,
        "youtube-url": youtubeUrl,
        "rent-is-paid": rentIsPaid,
        "maintenance-fee": maintenanceFee,
        "discount": discount,
        "sqft": sqft,
        "is-it-furnished": isItFurnished,
        "building": building,
        "neighborhood": neighborhood,
        "prop-refe-id": propRefeId,
        "minimum-contract-period-in-month": minimumContractPeriodInMonth,
        "notice-period-in-month": noticePeriodInMonth,
        "bathroom": bathroom,
        "bedroom": bedroom,
        "rera-landlord-name_719": reraLandlordName719,
        "rera-property-status_0": reraPropertyStatus0,
        "rera-title-deed-number_842": reraTitleDeedNumber842,
        "rera-pre-registration-number_61": reraPreRegistrationNumber61,
        "amenities": List<dynamic>.from(amenities.map((x) => x)),
        "property-reference-id": propertyReferenceId,
        "rera-landlord-name": reraLandlordName,
        "rera-property-status": reraPropertyStatus,
        "rera-title-deed-number": reraTitleDeedNumber,
        "rera-pre-registration-number": reraPreRegistrationNumber,
        "notice-period": noticePeriod,
        "minimum-contract-period": minimumContractPeriod,
        "occupancy-status": occupancyStatus,
        "amenities_263": List<dynamic>.from(amenities263.map((x) => x)),
        "property-reference-id-": acfPropertyReferenceId,
        "minimum-contract-period-in-months": minimumContractPeriodInMonths,
        "notice-period-in-months": noticePeriodInMonths,
        "amenities_679": List<dynamic>.from(amenities679.map((x) => x)),
        "type-of-tenants-allowed": typeOfTenantsAllowed,
        "room-type": roomType,
        "preferred-nationality-of-tenants": preferredNationalityOfTenants,
        "baths": baths,
        "number-of-tenants": numberOfTenants,
        "security-deposit": securityDeposit,
        "minimum-contract-period_332": minimumContractPeriod332,
        "amenities_368": List<dynamic>.from(amenities368.map((x) => x.toJson())),
        "notice-period_373": noticePeriod373,
        "property-reference-id_417": propertyReferenceId417,
        "bathrooms": bathrooms,
        "bedrooms": bedrooms,
        "bedrooms_840": bedrooms840,
        "bathrooms_163": bathrooms163,
        "minimum-contract-period_992": minimumContractPeriod992,
        "notice-period_894": noticePeriod894,
        "property-reference-id_485": propertyReferenceId485,
    };
}

class Amenities368 {
    Amenities368({
        this.value,
        this.label,
    });

    String value;
    String label;

    factory Amenities368.fromJson(Map<String, dynamic> json) => Amenities368(
        value: json["value"],
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
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
