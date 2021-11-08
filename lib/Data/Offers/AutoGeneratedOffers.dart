// To parse this JSON data, do
//
//     final offersParse = offersParseFromJson(jsonString);

import 'dart:convert';

List<OffersParse> offersParseFromJson(String str) => List<OffersParse>.from(json.decode(str).map((x) => OffersParse.fromJson(x)));

String offersParseToJson(List<OffersParse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OffersParse {
    OffersParse({
        this.date,
        this.dateGmt,
        this.title,
        this.lang,
        this.translations,
        this.acf,
    });

    DateTime date;
    DateTime dateGmt;
    Title title;
    String lang;
    Translations translations;
    Acf acf;

    factory OffersParse.fromJson(Map<String, dynamic> json) => OffersParse(
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        title: Title.fromJson(json["title"]),
        lang: json["lang"],
        translations: Translations.fromJson(json["translations"]),
        acf: Acf.fromJson(json["acf"]),
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "title": title.toJson(),
        "lang": lang,
        "translations": translations.toJson(),
        "acf": acf.toJson(),
    };
}

class Acf {
    Acf({
        this.description,
        this.gallery,
        this.video,
        this.price,
        this.phoneNumber,
        this.discount,
        this.toDate,
        this.free,
        this.location,
        this.rating560,
        this.menu,
        this.qty,
        this.email,
        this.website259,
        this.roomType,
        this.guests,
        this.roomsCount,
        this.bathrooms,
        this.checkbox,
        this.email81,
        this.website,
        this.roomType400,
        this.guests77,
        this.roomsCount907,
        this.bathrooms609,
        this.checkbox842,
        this.email4,
        this.website651,
        this.roomType878,
        this.guests765,
        this.roomsCount514,
        this.bathrooms102,
        this.website387,
        this.email40,
        this.roomType809,
        this.guests166,
        this.roomsCount521,
        this.bathrooms947,
        this.website490,
        this.email782,
        this.activities,
        this.destination,
        this.transportation,
        this.website411,
        this.email367,
        this.activities914,
        this.destination263,
        this.transportation442,
        this.website622,
        this.email580,
        this.events,
        this.website596,
        this.email563,
        this.workoutSchedule,
        this.coachName,
        this.website410,
        this.email747,
        this.service,
        this.website733,
        this.email706,
        this.website818,
        this.email833,
        this.doctorName,
        this.department,
        this.website285,
        this.email775,
        this.size,
        this.website323,
        this.email234,
        this.size458,
        this.website615,
        this.email815,
        this.size23,
        this.website617,
        this.email592,
        this.usage,
        this.age,
        this.email991,
        this.website605,
        this.condition,
        this.qty124,
        this.qty894,
        this.website578,
        this.email783,
        this.usage803,
        this.condition177,
        this.age182,
        this.website249,
        this.email655,
        this.qty192,
        this.qty773,
        this.website796,
        this.email244,
        this.website972,
        this.email389,
        this.usage50,
        this.condition550,
        this.age36,
        this.qty395,
        this.usage943,
        this.age894,
        this.condition892,
        this.qty72,
        this.email845,
        this.website417,
        this.usage667,
        this.age449,
        this.condition112,
        this.qty101,
        this.website457,
        this.email426,
        this.usage762,
        this.condition81,
        this.age846,
        this.model,
        this.warranty,
        this.color,
        this.memory,
        this.usage753,
        this.condition975,
        this.age790,
        this.usage39,
        this.condition796,
        this.age960,
        this.usage789,
        this.condition205,
        this.age325,
    });

    String description;
    List<String> gallery;
    bool video;
    String price;
    String phoneNumber;
    String discount;
    String toDate;
    String free;
    String location;
    String rating560;
    String menu;
    String qty;
    String email;
    String website259;
    String roomType;
    String guests;
    String roomsCount;
    String bathrooms;
    List<dynamic> checkbox;
    String email81;
    String website;
    String roomType400;
    String guests77;
    String roomsCount907;
    String bathrooms609;
    String checkbox842;
    String email4;
    String website651;
    String roomType878;
    String guests765;
    String roomsCount514;
    String bathrooms102;
    String website387;
    String email40;
    String roomType809;
    String guests166;
    String roomsCount521;
    String bathrooms947;
    String website490;
    String email782;
    String activities;
    String destination;
    String transportation;
    String website411;
    String email367;
    String activities914;
    String destination263;
    String transportation442;
    String website622;
    String email580;
    String events;
    String website596;
    String email563;
    String workoutSchedule;
    String coachName;
    String website410;
    String email747;
    String service;
    String website733;
    String email706;
    String website818;
    String email833;
    String doctorName;
    String department;
    String website285;
    String email775;
    String size;
    String website323;
    String email234;
    String size458;
    String website615;
    String email815;
    String size23;
    String website617;
    String email592;
    String usage;
    String age;
    String email991;
    String website605;
    String condition;
    String qty124;
    String qty894;
    String website578;
    String email783;
    String usage803;
    String condition177;
    String age182;
    String website249;
    String email655;
    String qty192;
    String qty773;
    String website796;
    String email244;
    String website972;
    String email389;
    String usage50;
    String condition550;
    String age36;
    String qty395;
    String usage943;
    String age894;
    String condition892;
    String qty72;
    String email845;
    String website417;
    String usage667;
    String age449;
    String condition112;
    String qty101;
    String website457;
    String email426;
    String usage762;
    String condition81;
    String age846;
    String model;
    String warranty;
    String color;
    String memory;
    String usage753;
    String condition975;
    String age790;
    String usage39;
    String condition796;
    String age960;
    String usage789;
    String condition205;
    String age325;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        description: json["_description"],
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        video: json["video"],
        price: json["price"],
        phoneNumber: json["phone-number"],
        discount: json["discount"],
        toDate: json["to-date"],
        free: json["free"],
        location: json["location"],
        rating560: json["rating_560"],
        menu: json["menu"],
        qty: json["qty"],
        email: json["email"],
        website259: json["website_259"],
        roomType: json["room-type"],
        guests: json["guests"],
        roomsCount: json["rooms-count"],
        bathrooms: json["bathrooms"],
        checkbox: List<dynamic>.from(json["checkbox"].map((x) => x)),
        email81: json["email_81"],
        website: json["website"],
        roomType400: json["room-type_400"],
        guests77: json["guests_77"],
        roomsCount907: json["rooms-count_907"],
        bathrooms609: json["bathrooms_609"],
        checkbox842: json["checkbox_842"],
        email4: json["email_4"],
        website651: json["website_651"],
        roomType878: json["room-type_878"],
        guests765: json["guests_765"],
        roomsCount514: json["rooms-count_514"],
        bathrooms102: json["bathrooms_102"],
        website387: json["website_387"],
        email40: json["email_40"],
        roomType809: json["room-type_809"],
        guests166: json["guests_166"],
        roomsCount521: json["rooms-count_521"],
        bathrooms947: json["bathrooms_947"],
        website490: json["website_490"],
        email782: json["email_782"],
        activities: json["activities"],
        destination: json["destination"],
        transportation: json["transportation"],
        website411: json["website_411"],
        email367: json["email_367"],
        activities914: json["activities_914"],
        destination263: json["destination_263"],
        transportation442: json["transportation_442"],
        website622: json["website_622"],
        email580: json["email_580"],
        events: json["events"],
        website596: json["website_596"],
        email563: json["email_563"],
        workoutSchedule: json["workout-schedule"],
        coachName: json["coach-name"],
        website410: json["website_410"],
        email747: json["email_747"],
        service: json["service"],
        website733: json["website_733"],
        email706: json["email_706"],
        website818: json["website_818"],
        email833: json["email_833"],
        doctorName: json["doctor-name"],
        department: json["department"],
        website285: json["website_285"],
        email775: json["email_775"],
        size: json["size"],
        website323: json["website_323"],
        email234: json["email_234"],
        size458: json["size_458"],
        website615: json["website_615"],
        email815: json["email_815"],
        size23: json["size_23"],
        website617: json["website_617"],
        email592: json["email_592"],
        usage: json["usage"],
        age: json["age"],
        email991: json["email_991"],
        website605: json["website_605"],
        condition: json["condition"],
        qty124: json["qty_124"],
        qty894: json["qty_894"],
        website578: json["website_578"],
        email783: json["email_783"],
        usage803: json["usage_803"],
        condition177: json["condition_177"],
        age182: json["age_182"],
        website249: json["website_249"],
        email655: json["email_655"],
        qty192: json["qty_192"],
        qty773: json["qty_773"],
        website796: json["website_796"],
        email244: json["email_244"],
        website972: json["website_972"],
        email389: json["email_389"],
        usage50: json["usage_50"],
        condition550: json["condition_550"],
        age36: json["age_36"],
        qty395: json["qty_395"],
        usage943: json["usage_943"],
        age894: json["age_894"],
        condition892: json["condition_892"],
        qty72: json["qty_72"],
        email845: json["email_845"],
        website417: json["website_417"],
        usage667: json["usage_667"],
        age449: json["age_449"],
        condition112: json["condition_112"],
        qty101: json["qty_101"],
        website457: json["website_457"],
        email426: json["email_426"],
        usage762: json["usage_762"],
        condition81: json["condition_81"],
        age846: json["age_846"],
        model: json["model"],
        warranty: json["warranty"],
        color: json["color"],
        memory: json["memory"],
        usage753: json["usage_753"],
        condition975: json["condition_975"],
        age790: json["age_790"],
        usage39: json["usage_39"],
        condition796: json["condition_796"],
        age960: json["age_960"],
        usage789: json["usage_789"],
        condition205: json["condition_205"],
        age325: json["age_325"],
    );

    Map<String, dynamic> toJson() => {
        "_description": description,
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "video": video,
        "price": price,
        "phone-number": phoneNumber,
        "discount": discount,
        "to-date": toDate,
        "free": free,
        "location": location,
        "rating_560": rating560,
        "menu": menu,
        "qty": qty,
        "email": email,
        "website_259": website259,
        "room-type": roomType,
        "guests": guests,
        "rooms-count": roomsCount,
        "bathrooms": bathrooms,
        "checkbox": List<dynamic>.from(checkbox.map((x) => x)),
        "email_81": email81,
        "website": website,
        "room-type_400": roomType400,
        "guests_77": guests77,
        "rooms-count_907": roomsCount907,
        "bathrooms_609": bathrooms609,
        "checkbox_842": checkbox842,
        "email_4": email4,
        "website_651": website651,
        "room-type_878": roomType878,
        "guests_765": guests765,
        "rooms-count_514": roomsCount514,
        "bathrooms_102": bathrooms102,
        "website_387": website387,
        "email_40": email40,
        "room-type_809": roomType809,
        "guests_166": guests166,
        "rooms-count_521": roomsCount521,
        "bathrooms_947": bathrooms947,
        "website_490": website490,
        "email_782": email782,
        "activities": activities,
        "destination": destination,
        "transportation": transportation,
        "website_411": website411,
        "email_367": email367,
        "activities_914": activities914,
        "destination_263": destination263,
        "transportation_442": transportation442,
        "website_622": website622,
        "email_580": email580,
        "events": events,
        "website_596": website596,
        "email_563": email563,
        "workout-schedule": workoutSchedule,
        "coach-name": coachName,
        "website_410": website410,
        "email_747": email747,
        "service": service,
        "website_733": website733,
        "email_706": email706,
        "website_818": website818,
        "email_833": email833,
        "doctor-name": doctorName,
        "department": department,
        "website_285": website285,
        "email_775": email775,
        "size": size,
        "website_323": website323,
        "email_234": email234,
        "size_458": size458,
        "website_615": website615,
        "email_815": email815,
        "size_23": size23,
        "website_617": website617,
        "email_592": email592,
        "usage": usage,
        "age": age,
        "email_991": email991,
        "website_605": website605,
        "condition": condition,
        "qty_124": qty124,
        "qty_894": qty894,
        "website_578": website578,
        "email_783": email783,
        "usage_803": usage803,
        "condition_177": condition177,
        "age_182": age182,
        "website_249": website249,
        "email_655": email655,
        "qty_192": qty192,
        "qty_773": qty773,
        "website_796": website796,
        "email_244": email244,
        "website_972": website972,
        "email_389": email389,
        "usage_50": usage50,
        "condition_550": condition550,
        "age_36": age36,
        "qty_395": qty395,
        "usage_943": usage943,
        "age_894": age894,
        "condition_892": condition892,
        "qty_72": qty72,
        "email_845": email845,
        "website_417": website417,
        "usage_667": usage667,
        "age_449": age449,
        "condition_112": condition112,
        "qty_101": qty101,
        "website_457": website457,
        "email_426": email426,
        "usage_762": usage762,
        "condition_81": condition81,
        "age_846": age846,
        "model": model,
        "warranty": warranty,
        "color": color,
        "memory": memory,
        "usage_753": usage753,
        "condition_975": condition975,
        "age_790": age790,
        "usage_39": usage39,
        "condition_796": condition796,
        "age_960": age960,
        "usage_789": usage789,
        "condition_205": condition205,
        "age_325": age325,
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

class Translations {
    Translations({
        this.en,
    });

    int en;

    factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}
