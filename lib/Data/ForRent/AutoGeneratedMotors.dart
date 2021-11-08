// To parse this JSON data, do
//
//     final motorsParse = motorsParseFromJson(jsonString);

import 'dart:convert';

List<MotorsParse> motorsParseFromJson(String str) => List<MotorsParse>.from(json.decode(str).map((x) => MotorsParse.fromJson(x)));

String motorsParseToJson(List<MotorsParse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MotorsParse {
    MotorsParse({
        this.date,
        this.dateGmt,
        this.title,
        this.lang,
        this.acf,
    });

    DateTime date;
    DateTime dateGmt;
    Title title;
    String lang;
    Acf acf;

    factory MotorsParse.fromJson(Map<String, dynamic> json) => MotorsParse(
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        title: Title.fromJson(json["title"]),
        lang: json["lang"],
        acf: Acf.fromJson(json["acf"]),
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "title": title.toJson(),
        "lang": lang,
        "acf": acf.toJson(),
    };
}

class Acf {
    Acf({
        this.price,
        this.description,
        this.gallery,
        this.phoneNumber,
        this.discount,
        this.location,
        this.yearOfManuf,
        this.transmissionType,
        this.kilometersMotorcycle,
        this.sellerType,
        this.finalDriveSystem,
        this.autoAccessoriesUsage,
        this.autoAccessoriesCondition,
        this.autoAccessoriesSelleryType,
        this.sellertypeHeavyve,
        this.make,
        this.yearHeavyveh,
        this.kilometerHeavyveh,
        this.model721,
        this.capacityWeight,
        this.noOfCylinders,
        this.horsepower,
        this.warranty797,
        this.fuelType,
        this.age,
        this.usage176,
        this.condition,
        this.sellerType303,
        this.warranty509,
        this.lengthlength,
        this.carType,
        this.per,
        this.typeUsed,
        this.modelUsed,
        this.kilometersUsed,
        this.colorUsed,
        this.trimUsed,
        this.doorsUsed,
        this.usageMotorcycle,
        this.yearOfManfMotorcycle,
        this.wheelsMotorcycle,
        this.manufacturerMotorcycle,
        this.engineSizeMotorcycle,
        this.warrantyMotorcycle,
        this.bodyconditionHeavyvehi,
        this.mechanicalConditionHeavyvehicles,
        this.plateCodeNumpla,
        this.plateNumberNumberPlate,
        this.typeDesignNumberPlate,
    });

    String price;
    String description;
    List<String> gallery;
    String phoneNumber;
    String discount;
    String location;
    String yearOfManuf;
    String transmissionType;
    String kilometersMotorcycle;
    String sellerType;
    String finalDriveSystem;
    String autoAccessoriesUsage;
    String autoAccessoriesCondition;
    String autoAccessoriesSelleryType;
    String sellertypeHeavyve;
    String make;
    String yearHeavyveh;
    String kilometerHeavyveh;
    String model721;
    String capacityWeight;
    String noOfCylinders;
    String horsepower;
    String warranty797;
    String fuelType;
    String age;
    String usage176;
    String condition;
    String sellerType303;
    String warranty509;
    String lengthlength;
    String carType;
    String per;
    String typeUsed;
    String modelUsed;
    String kilometersUsed;
    String colorUsed;
    String trimUsed;
    String doorsUsed;
    String usageMotorcycle;
    String yearOfManfMotorcycle;
    String wheelsMotorcycle;
    String manufacturerMotorcycle;
    String engineSizeMotorcycle;
    String warrantyMotorcycle;
    String bodyconditionHeavyvehi;
    String mechanicalConditionHeavyvehicles;
    String plateCodeNumpla;
    String plateNumberNumberPlate;
    String typeDesignNumberPlate;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        price: json["price"],
        description: json["_description"],
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        phoneNumber: json["phone-number"],
        discount: json["discount"],
        location: json["location"],
        // yearOfManuf: DateTime.parse(json["year-of-manuf"]),
        yearOfManuf:json["year-of-manuf"],
        transmissionType: json["transmission-type"],
        kilometersMotorcycle: json["kilometers_motorcycle"],
        sellerType: json["seller-type"],
        finalDriveSystem: json["final-drive-system"],
        autoAccessoriesUsage: json["auto-accessories-usage"],
        autoAccessoriesCondition: json["auto-accessories-condition"],
        autoAccessoriesSelleryType: json["auto-accessories-sellery-type"],
        sellertypeHeavyve: json["sellertype-heavyve"],
        make: json["make"],
        yearHeavyveh:json["year_heavyveh"],
        kilometerHeavyveh: json["kilometer_heavyveh"],
        model721: json["model_721"],
        capacityWeight: json["capacity-weight"],
        noOfCylinders: json["no-of-cylinders"],
        horsepower: json["horsepower"],
        warranty797: json["warranty_797"],
        fuelType: json["fuel-type"],
        age: json["age"],
        usage176: json["usage_176"],
        condition: json["condition"],
        sellerType303: json["seller-type_303"],
        warranty509: json["warranty_509"],
        lengthlength: json["lengthlength"],
        carType: json["car-type"],
        per: json["per"],
        typeUsed: json["type-used"],
        modelUsed: json["model-used"],
        kilometersUsed: json["kilometers-used"],
        colorUsed: json["color-used"],
        trimUsed: json["trim-used"],
        doorsUsed: json["doors-used"],
        usageMotorcycle: json["usage-motorcycle"],
        yearOfManfMotorcycle: json["year-of-manf-motorcycle"],
        wheelsMotorcycle: json["wheels-motorcycle"],
        manufacturerMotorcycle: json["manufacturer-motorcycle"],
        engineSizeMotorcycle: json["engine-size-motorcycle"],
        warrantyMotorcycle: json["warranty-motorcycle"],
        bodyconditionHeavyvehi: json["bodycondition-heavyvehi"],
        mechanicalConditionHeavyvehicles: json["mechanical-condition-heavyvehicles"],
        plateCodeNumpla: json["plate_code_numpla"],
        plateNumberNumberPlate: json["plate_number_number_plate"],
        typeDesignNumberPlate: json["type_design_number_plate"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "_description": description,
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "phone-number": phoneNumber,
        "discount": discount,
        "location": location,
        "year-of-manuf": yearOfManuf,
        "transmission-type": transmissionType,
        "kilometers_motorcycle": kilometersMotorcycle,
        "seller-type": sellerType,
        "final-drive-system": finalDriveSystem,
        "auto-accessories-usage": autoAccessoriesUsage,
        "auto-accessories-condition": autoAccessoriesCondition,
        "auto-accessories-sellery-type": autoAccessoriesSelleryType,
        "sellertype-heavyve": sellertypeHeavyve,
        "make": make,
        "year_heavyveh": yearHeavyveh,
        "kilometer_heavyveh": kilometerHeavyveh,
        "model_721": model721,
        "capacity-weight": capacityWeight,
        "no-of-cylinders": noOfCylinders,
        "horsepower": horsepower,
        "warranty_797": warranty797,
        "fuel-type": fuelType,
        "age": age,
        "usage_176": usage176,
        "condition": condition,
        "seller-type_303": sellerType303,
        "warranty_509": warranty509,
        "lengthlength": lengthlength,
        "car-type": carType,
        "per": per,
        "type-used": typeUsed,
        "model-used": modelUsed,
        "kilometers-used": kilometersUsed,
        "color-used": colorUsed,
        "trim-used": trimUsed,
        "doors-used": doorsUsed,
        "usage-motorcycle": usageMotorcycle,
        "year-of-manf-motorcycle":yearOfManfMotorcycle,
        "wheels-motorcycle": wheelsMotorcycle,
        "manufacturer-motorcycle": manufacturerMotorcycle,
        "engine-size-motorcycle": engineSizeMotorcycle,
        "warranty-motorcycle": warrantyMotorcycle,
        "bodycondition-heavyvehi": bodyconditionHeavyvehi,
        "mechanical-condition-heavyvehicles": mechanicalConditionHeavyvehicles,
        "plate_code_numpla": plateCodeNumpla,
        "plate_number_number_plate": plateNumberNumberPlate,
        "type_design_number_plate": typeDesignNumberPlate,
    };
}

class Title {
    Title({
        this.rendered,
    });

    String rendered;

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}
