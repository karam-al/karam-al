import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/PlaceYouAdd/Motors/notes_service.dart';
import 'package:oxydu/constants.dart';

import '../SnackBarService.dart';

class NotesServiceeForRent {
  SnackBarService get obj => GetIt.I<SnackBarService>();
  static const headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvb3h5ZHUuY29tIiwiaWF0IjoxNjM1NjY3Nzg0LCJuYmYiOjE2MzU2Njc3ODQsImV4cCI6MTYzNjI3MjU4NCwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMSJ9fX0.zNSI2jDA7NSrfYuyQYz0ohf5CX0PyQ4ZpOeHYZ7Q5d4'
    //'Content-Type': 'application/json'
  };
  //update ==> put
  //delete ==> delete

  commercialforRent(
      dynamic rootAPI,
      dynamic childAPI,
      dynamic title,
      dynamic price,
      dynamic per,
      dynamic desctiption,
      dynamic location,
      dynamic phoneNumber,
      // dynamic urltour,
      // dynamic youurl,
      dynamic paid,
      dynamic fee,
      dynamic discount,
      dynamic sqft,
      dynamic furnished,
      dynamic building,
      dynamic neighborhood,
      /////////////////////
      dynamic referenceid,
      dynamic reraname,
      dynamic status,
      dynamic deed,
      dynamic registration,
      dynamic period,
      dynamic contractperiod,
      dynamic occupancy,
      BuildContext context
      //dynamic amenities,
      ) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      "title": "$title",
      'status': 'pending',
      'lang': '${translator.currentLanguage}',
      'property-type': '$rootAPI,$childAPI',
      'fields[location]': "dvvvv",
      "fields[discount]": "3456",
      "fields[neighborhood]": "$neighborhood",
      'fields[price]': '$price',
      'fields[per]': '$per',
      'fields[desctiption]': '$desctiption',
      'fields[prop_phone_number]': '$phoneNumber',
      'fields[rent-is-paid]': '$paid',
      'fields[maintenance-fee]': '$fee',
      'fields[sqft]': '$sqft',
      'fields[is-it-furnished]': '$furnished',
      'fields[building]': '$building',
      'fields[property-reference-id]': '$referenceid',
      'fields[rera-landlord-name]': '$reraname',
      'fields[rera-property-status]': '$status',
      'fields[rera-title-deed-number]': '$deed',
      'fields[rera-pre-registration-number]': '$registration',
      'fields[notice-period]': '$period',
      'fields[minimum-contract-period]': '$contractperiod',
      'fields[occupancy-status]': '$occupancy',
    };
    Response responseval = await dio.post(
        'https://oxydu.com/wp-json/wp/v2/property-for-rent',
        data: FormData.fromMap(a));
    obj.snackBar(responseval.statusCode, context);
  }

  residentialUnitsForRent(
      dynamic rootAPI,
      dynamic childAPI,
      dynamic title,
      dynamic price,
      dynamic per,
      dynamic desctiption,
      dynamic location,
      dynamic phoneNumber,
      dynamic paid,
      dynamic fee,
      dynamic discount,
      dynamic sqft,
      dynamic furnished,
      dynamic building,
      dynamic neighborhood,
      /////////////////////
      dynamic referenceid,
      dynamic reraname,
      dynamic status,
      dynamic deed,
      dynamic registration,
      dynamic period,
      dynamic contractperiod,
      dynamic occupancy,
      //dynamic amenities,
      dynamic bathroom,
      dynamic bedroom,
      BuildContext context) async {
    Dio dio = new Dio(); 
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': title,
      'status': 'pending',
      'lang': '${translator.currentLanguage}',
      'property-type': '$rootAPI,$childAPI',
      'fields[price]': '$price',
      'fields[per]': '$per',
      'fields[desctiption]': '$desctiption',
      'fields[location]': '$location',
      'fields[prop_phone_number]': '$phoneNumber',
      'fields[rent-is-paid]': '$paid',
      'fields[maintenance-fee]': '$fee',
      'fields[discount]': '$discount',
      'fields[sqft]': '$sqft',
      'fields[is-it-furnished]': '$furnished',
      'fields[building]': '$building',
      'fields[neighborhood]': '$neighborhood',
      'fields[prop-refe-id]': '$referenceid',
      'fields[rera-landlord-name_719]': '$reraname',
      'fields[rera-property-status_0]': '$status',
      'fields[rera-title-deed-number_842]': '$deed',
      'fields[rera-pre-registration-number_61]': '$registration',
      'fields[minimum-contract-period-in-month]': '$contractperiod',
      'fields[notice-period-in-month]': '$period',
      'fields[occupancy-status]': '$occupancy',
      //'fields[amenities]': '$amenities',
      'fields[bathroom]': '$bathroom',
      'fields[bedroom]': '$bedroom',
    };
    Response responseval = await dio.post(
        'https://oxydu.com/wp-json/wp/v2/property-for-rent',
        data: FormData.fromMap(a));
    obj.snackBar(responseval.statusCode, context);
  }

  roomsForRent(
      dynamic rootAPI,
      dynamic childAPI,
      dynamic title,
      dynamic price,
      dynamic per,
      dynamic desctiption,
      dynamic location,
      dynamic phoneNumber,
      dynamic urltour,
      dynamic youurl,
      dynamic discount,
      dynamic building,
      dynamic neighborhood,
      dynamic referenceid,
      dynamic period,
      dynamic contractperiod,
      dynamic allowed,
      dynamic type,
      dynamic preferred,
      dynamic baths,
      dynamic tenants,
      dynamic deposit,
      BuildContext context) async {
         
        print(rootAPI);
        print(childAPI);
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': title,
      'status': 'pending',
      'lang': '${translator.currentLanguage}',
      'property-type': '$rootAPI,$childAPI',
      'fields[price]': '$price',
      'fields[per]': '$per',
      'fields[desctiption]': '$desctiption',
      'fields[location]': '$location',
      'fields[prop_phone_number]': '$phoneNumber',
      'fields[360-tour-url]': '$urltour',
      'fields[youtube-url]': '$youurl',
      'fields[discount]': '$discount',
      'fields[building]': '$building',
      'fields[neighborhood]': '$neighborhood',
      'fields[property-reference-id-]': '$referenceid',
      'fields[minimum-contract-period-in-months]': '$contractperiod',
      'fields[notice-period-in-months]': '$period',
      // 'fields[amenities_679]': '$amenities',
      'fields[type-of-tenants-allowed]': '$allowed',
      'fields[room-type]': '$type',
      'fields[preferred-nationality-of-tenants]': '$preferred',
      'fields[baths]': '$baths',
      'fields[number-of-tenants]': '$tenants',
      'fields[security-deposit]': '$deposit',
    };
    Response responseval = await dio.post(
        'https://oxydu.com/wp-json/wp/v2/property-for-rent',
        data: FormData.fromMap(a));
    obj.snackBar(responseval.statusCode, context);
  }

  shortTermForRent(
      dynamic rootAPI,
      dynamic childAPI,
      dynamic title,
      dynamic price,
      dynamic per,
      dynamic desctiption,
      dynamic location,
      dynamic phoneNumber,
      dynamic urltour,
      dynamic youurl,
      dynamic discount,
      dynamic sqft,
      dynamic furnished,
      dynamic building,
      dynamic neighborhood,
      dynamic referenceid,
      dynamic period,
      dynamic contractperiod,
      //dynamic amenities,
      dynamic bathroom,
      dynamic bedroom,
      BuildContext context) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': title,
      'status': 'pending',
      'lang': '${translator.currentLanguage}',
      'property-type': '$rootAPI,$childAPI',
      'fields[price]': '$price',
      'fields[per]': '$per',
      'fields[desctiption]': '$desctiption',
      'fields[location]': '$location',
      'fields[prop_phone_number]': '$phoneNumber',
      'fields[360-tour-url]': '$urltour',
      'fields[youtube-url]': '$youurl',
      'fields[discount]': '$discount',
      'fields[sqft]': '$sqft',
      'fields[is-it-furnished]': '$furnished',
      'fields[building]': '$building',
      'fields[neighborhood]': '$neighborhood',
      'fields[property-reference-id_417]': '$referenceid',
      'fields[minimum-contract-period_332]': '$contractperiod',
      'fields[notice-period_373]': '$period',
      // 'fields[amenities_368]': '$amenities',
      'fields[bathrooms]': '$bathroom',
      'fields[bedrooms]': '$bedroom',
    };
    Response responseval = await dio.post(
        'https://oxydu.com/wp-json/wp/v2/property-for-rent',
        data: FormData.fromMap(a));
    obj.snackBar(responseval.statusCode, context);
  }

  shortTermDailyForRent(
      dynamic rootAPI,
      dynamic childAPI,
      dynamic title,
      dynamic price,
      dynamic per,
      dynamic desctiption,
      dynamic location,
      dynamic phoneNumber,
      dynamic urltour,
      dynamic youurl,
      //dynamic paid,
      //dynamic fee,
      dynamic discount,
      dynamic sqft,
      dynamic furnished,
      dynamic building,
      dynamic neighborhood,
      dynamic referenceid,
      dynamic period,
      dynamic contractperiod,
      dynamic bathroom,
      dynamic bedroom,
      BuildContext context) async {
        
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': title,
      'status': 'pending',
      'lang': '${translator.currentLanguage}',
      'property-type': '$rootAPI,$childAPI',
      'fields[price]': '$price',
      'fields[per]': '$per',
      'fields[desctiption]': '$desctiption',
      'fields[location]': '$location',
      'fields[prop_phone_number]': '$phoneNumber',
      'fields[360-tour-url]': '$urltour',
      'fields[youtube-url]': '$youurl',
      'fields[discount]': '$discount',
      'fields[sqft]': '$sqft',
      'fields[is-it-furnished]': '$furnished',
      'fields[building]': '$building',
      'fields[neighborhood]': '$neighborhood',
      'fields[property-reference-id_485]': '$referenceid',
      'fields[minimum-contract-period_992]': '$contractperiod',
      'fields[notice-period_894]': '$period',
      'fields[bathrooms_163]': '$bathroom',
      'fields[bedrooms_840]': '$bedroom',
    };
   
    Response responseval = await dio.post(
        'https://oxydu.com/wp-json/wp/v2/property-for-rent',
        data: FormData.fromMap(a));
print("ok ?");
         print(responseval.statusCode);
    obj.snackBar(responseval.statusCode, context);
  }
}
