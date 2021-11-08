import 'package:dio/dio.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/constants.dart';

class NotesServiceeOffers {
  static const headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvb3h5ZHUuY29tIiwiaWF0IjoxNjM1NjY3Nzg0LCJuYmYiOjE2MzU2Njc3ODQsImV4cCI6MTYzNjI3MjU4NCwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMSJ9fX0.zNSI2jDA7NSrfYuyQYz0ohf5CX0PyQ4ZpOeHYZ7Q5d4'
    //'Content-Type]': 'application/json'
  }; 
  //update ==> put
  //delete ==> delete

  bungalows(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic activities,
      dynamic destination,
      dynamic transportation,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[activities]': '$activities',
      'fields[destination]': '$destination',
      'fields[transportation]': '$transportation',
      'fields[location]': '$location',
      'fields[website_411]': '$website',
      'fields[email_367]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data: FormData.fromMap(a));
  }

  hotelsResorts(
    dynamic title,
    dynamic rootAPI,
    dynamic childAPI,
    dynamic price,
    dynamic description,
    dynamic yearOfferFrom,
    dynamic monthOfferFrom,
    dynamic dayOfferFrom,
    dynamic yearOfferTo,
    dynamic monthOfferTo,
    dynamic dayOfferTo,
    dynamic roomType,
    dynamic guests,
    dynamic roomCounts,
    dynamic bathrooms,
    dynamic website,
    dynamic websiteKey,
    dynamic email,
    dynamic emailKey,
    dynamic phoneNumber,
    dynamic discount,
    dynamic isitfree,
    dynamic location,
    dynamic rating,
    dynamic roomTypeKey,
    dynamic guestsKey,
    dynamic roomsCountKey,
    dynamic bathroomsKey,
  ) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[$websiteKey]': '$website',
      'fields[$emailKey]': '$email',
      'fields[$roomTypeKey]': '$roomType',
      'fields[$guestsKey]': '$guests',
      'fields[$roomsCountKey]': '$roomCounts',
      'fields[$bathroomsKey]': '$bathrooms',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
     } ;
    await dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  clinic(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic doctorName,
      dynamic department,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[website_285]': '$website',
      'fields[email_775]': '$email',
      'fields[doctor-name]': '$doctorName',
      'fields[department]': '$department',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    await dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  fitness(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic workoutSchedule,
      dynamic coachName,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[website_410]': '$website',
      'fields[email_747]': '$email',
      'fields[workout-schedule]': '$workoutSchedule',
      'fields[coach-name]': '$coachName',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
     };
    await dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  salons(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic services,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating)async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[website_733]': '$website',
      'fields[email_706]': '$email',
      'fields[service]': '$services',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
     };
    await dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  spa(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[website_818]': '$website',
      'fields[email_833]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

////////////////////////////////////////////////////////////////////////
  clothing(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic websiteKey,
      dynamic email,
      dynamic emailKey,
      dynamic sizekey,
      dynamic size,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[$sizekey]': '$size',
      'fields[$websiteKey]': '$website',
      'fields[$emailKey]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  accessories(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic usage,
      dynamic condition,
      dynamic age,
      dynamic isitfree,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[usage_789]': '$usage',
      'fields[condition_205]': '$condition',
      'fields[age_325]': '$age',
      'fields[location]': '$location',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  jewellery(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic usage,
      dynamic condition,
      dynamic age,
      dynamic isitfree,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[usage_39]': '$usage',
      'fields[condition_796]': '$condition',
      'fields[age_960]': '$age',
      'fields[location]': '$location',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  watches(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic usage,
      dynamic condition,
      dynamic age,
      dynamic isitfree,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[usage_753]': '$usage',
      'fields[condition_975]': '$condition',
      'fields[age_790]': '$age',
      'fields[location]': '$location',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  beaches(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic roomType,
      dynamic guests,
      dynamic roomCount,
      dynamic bathrooms,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[room-type_809]': '$roomType',
      'fields[guests_166]': '$guests',
      'fields[rooms-count_521]': '$roomCount',
      'fields[bathrooms_947]': '$bathrooms',
      'fields[location]': '$location',
      'fields[website_490]': '$website',
      'fields[email_782]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  camping(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic activities,
      dynamic destination,
      dynamic transportation,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[activities_914]': '$activities',
      'fields[destination_263]': '$destination',
      'fields[transportation_442]': '$transportation',
      'fields[location]': '$location',
      'fields[website_622]': '$website',
      'fields[email_580]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  chalets(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic roomType,
      dynamic guests,
      dynamic roomCount,
      dynamic bathroom,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
     var a = {
       'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[room-type_878]': '$roomType',
      'fields[guests_765]': '$guests',
      'fields[rooms-count_514]': '$roomCount',
      'fields[bathrooms_102]': '$bathroom',
      'fields[website_387]': '$website',
      'fields[email_40]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
     };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  resturant(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic menu,
      dynamic quentity,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[website_259]': '$website',
      'fields[email]': '$email',
      'fields[qty]': '$quentity',
      'fields[menu]': '$menu',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'lang': '${translator.currentLanguage}',
      'fields[free]': '$isitfree',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  waterparks(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic event,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[events]': '$event',
      'fields[website_596]': '$website',
      'fields[email_563]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  babyToys(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic quentity,
      dynamic usage,
      dynamic condition,
      dynamic age,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[qty_395]': '$quentity',
      'fields[usage_50]': '$usage',
      'fields[condition_550]': '$condition',
      'fields[age_36]': '$age',
      'fields[location]': '$location',
      'fields[website_972]': '$website',
      'fields[email_389]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  game(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic quentity,
      dynamic usage,
      dynamic condition,
      dynamic age,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[qty_72]': '$quentity',
      'fields[usage_943]': '$usage',
      'fields[condition_892]': '$condition',
      'fields[age_894]': '$age',
      'fields[location]': '$location',
      'fields[website_417]': '$website',
      'fields[email_845]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  healthBeauty(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic quentity,
      dynamic isitfree,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[qty_894]': '$quentity',
      'fields[website_578]': '$website',
      'fields[email_783]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  homeAndKitchen(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic quentity,
      dynamic usage,
      dynamic condition,
      dynamic age,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[qty_124]': '$quentity',
      'fields[usage]': '$usage',
      'fields[condition]': '$condition',
      'fields[age]': '$age',
      'fields[location]': '$location',
      'fields[website_605]': '$website',
      'fields[email_991]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  organic(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic quentity,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[qty_773]': '$quentity',
      'fields[location]': '$location',
      'fields[website_796]': '$website',
      'fields[email_244]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  phoneAndTab(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic usage,
      dynamic condition,
      dynamic model,
      dynamic warranty,
      dynamic color,
      dynamic memory,
      dynamic age,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[usage_762]': '$usage',
      'fields[condition_81]': '$condition',
      'fields[age_846]': '$age',
      'fields[location]': '$location',
      'fields[website_605]': '$website',
      'fields[email_991]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating',
      'fields[model]': '$model',
      'fields[warranty]': '$warranty',
      'fields[color]': '$color',
      'fields[memory]': '$memory',
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  sportAndFitness(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic quentity,
      dynamic usage,
      dynamic condition,
      dynamic age,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[qty_192]': '$quentity',
      'fields[usage_803]': '$usage',
      'fields[condition_177]': '$condition',
      'fields[age_182]': '$age',
      'fields[location]': '$location',
      'fields[website_249]': '$website',
      'fields[email_655]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }

  campingOutDoorsProducts(
      dynamic title,
      dynamic rootAPI,
      dynamic childAPI,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic isitfree,
      dynamic quentity,
      dynamic usage,
      dynamic condition,
      dynamic age,
      dynamic yearOfferFrom,
      dynamic monthOfferFrom,
      dynamic dayOfferFrom,
      dynamic yearOfferTo,
      dynamic monthOfferTo,
      dynamic dayOfferTo,
      dynamic website,
      dynamic email,
      dynamic location,
      dynamic rating) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': '$title',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[qty_101]': '$quentity',
      'fields[usage_667]': '$usage',
      'fields[condition_112]': '$condition',
      'fields[age_449]': '$age',
      'fields[location]': '$location',
      'fields[website_457]': '$website',
      'fields[email_426]': '$email',
      'fields[offer-date]': '$yearOfferFrom-$monthOfferFrom-$dayOfferFrom',
      'fields[to-date]': '$yearOfferTo-$monthOfferTo-$dayOfferTo',
      'offers-categories': '$rootAPI,$childAPI',
      'status': 'pending',
      'fields[free]': '$isitfree',
      'lang': '${translator.currentLanguage}',
      'fields[rating_560]': '$rating'
    };
    dio.post('https://oxydu.com/wp-json/wp/v2/offers', data:  FormData.fromMap(a));
  }
}
