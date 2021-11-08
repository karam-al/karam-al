import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/constants.dart';

class NotesServicee {
  // static const headers = {
  //   'Authorization':
  //       'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvb3h5ZHUuY29tIiwiaWF0IjoxNjM1NjY3Nzg0LCJuYmYiOjE2MzU2Njc3ODQsImV4cCI6MTYzNjI3MjU4NCwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMSJ9fX0.zNSI2jDA7NSrfYuyQYz0ohf5CX0PyQ4ZpOeHYZ7Q5d4'
  //   //'Content-Type': 'application/json'
  // };

  _snackBarCheck(int statusCode, BuildContext context) {
    if (statusCode == 201 || statusCode == 200) {
      final snackBar =
          SnackBar(content: Text(translator.translate("Added successfully")));
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar =
          SnackBar(content: Text(translator.translate("Something went wrong")));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  usedCars(
      dynamic imageFeatured,
      dynamic galaryImage,
      dynamic title,
      dynamic car,
      dynamic carModel,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic type,
      dynamic model,
      dynamic yearofManuf,
      dynamic km,
      dynamic fullName,
      dynamic trim,
      dynamic doors,
      dynamic location,
      dynamic transmition,
      dynamic carColor,
      dynamic usedCars,
      BuildContext context) async { 
    var a = {
      'title': title,
      'motors-type': '$usedCars,$car,$carModel',
      'fields[image_featuerd]': '$imageFeatured',
      'fields[gallery]': '$galaryImage',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[year-of-manuf]': '$yearofManuf',
      'fields[type-used]': '$type',
      'fields[model-used]': '$model',
      'fields[kilometers-used]': '$km',
      'fields[trim-used]': '$trim',
      'fields[doors-used]': '$doors',
      'fields[location]': '$location',
      'fields[transmission-type]': '$transmition',
      'fields[color-used]': '$carColor',
      'status': 'pending',
      'lang': '${translator.currentLanguage}'
    };
    // Dio dio = new Dio();
    // dio.options.headers["Authorization"] = "Bearer $s";
    // Response responseval = await dio.post(
    //     'https://oxydu.com/wp-json/wp/v2/motors',
    //     data: FormData.fromMap(a));
    // _snackBarCheck(responseval.statusCode, context);
  }
  //update ==> put
  //delete ==> delete

  carsForRent(
      dynamic title,
      dynamic carForRentType,
      dynamic pricePer,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic type,
      dynamic location,
      dynamic carsForRent,
      BuildContext context) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': title,
      'motors-type': '$carsForRent,$carForRentType',
      'fields[price]': '$price',
      'fields[per]': '$pricePer',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[car-type]': '$type',
      'fields[location]': '$location',
      'status': 'pending',
      'lang': '${translator.currentLanguage}'
    };
    Response responseval = await dio.post(
        'https://oxydu.com/wp-json/wp/v2/motors',
        data: FormData.fromMap(a));
    _snackBarCheck(responseval.statusCode, context);
  }

  motorcycleMotors(
      dynamic sportChoice,
      dynamic title,
      dynamic motocycleType,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic location,
      dynamic sportBikeTypeSend,
      dynamic motorSection,
      BuildContext context) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    if (sportChoice != 2) {
      var a = {
        'title': title,
        'motors-type': '$motorSection,$motocycleType',
        'fields[price]': '$price',
        'fields[_description]': '$description',
        'fields[phone-number]': '$phoneNumber',
        'fields[discount]': '$discount',
        'fields[location]': '$location',
        'status': 'pending',
        'lang': '${translator.currentLanguage}'
      };

      Response responseval = await dio.post(
          'https://oxydu.com/wp-json/wp/v2/motors',
          data: FormData.fromMap(a));
      _snackBarCheck(responseval.statusCode, context);
    }
    if (sportChoice == 2) {
      var a = {
        'title': title,
        'motors-type': '$motorSection,$motocycleType,$sportBikeTypeSend',
        'fields[price]': '$price',
        'fields[_description]': '$description',
        'fields[phone-number]': '$phoneNumber',
        'fields[discount]': '$discount',
        'fields[location]': '$location',
        'status': 'pending',
        'lang': '${translator.currentLanguage}'
      };
      Response responseval = await dio.post(
          'https://oxydu.com/wp-json/wp/v2/motors',
          data: FormData.fromMap(a));
      _snackBarCheck(responseval.statusCode, context);
    }
  }

  heavyVehicles(
      dynamic heavyVehicles,
      dynamic title,
      dynamic price,
      dynamic description,
      dynamic heavyVehiclesType,
      dynamic heavyVehiclesChild,
      dynamic phoneNumber,
      dynamic discount,
      dynamic bodyCondition,
      dynamic mechanicalCondition,
      dynamic sellerType,
      dynamic model,
      dynamic make,
      dynamic capacityWeight,
      dynamic noOfCylinders,
      dynamic horsePower,
      dynamic warranty,
      dynamic fuelType,
      dynamic location,
      dynamic heavyChoice,
      dynamic kilometers,
      dynamic yearofmanufacture,
      BuildContext context) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";

    if (heavyChoice == 7) {
      var a = {
        'title': title,
        'motors-type': '$heavyVehicles,$heavyVehiclesType',
        'fields[price]': '$price',
        'fields[_description]': '$description',
        'fields[phone-number]': '$phoneNumber',
        'fields[discount]': '$discount',
        'fields[location]': '$location',
        'fields[bodycondition-heavyvehi]': '$bodyCondition',
        'fields[mechanical-condition-heavyvehicles]': '$mechanicalCondition',
        'fields[sellertype-heavyve]': '$sellerType',
        'fields[model_721]': '$model',
        'fields[make]': '$make',
        'fields[capacity-weight]': '$capacityWeight',
        'fields[no-of-cylinders]': '$noOfCylinders',
        'fields[horsepower]': '$horsePower',
        'fields[warranty_797]': '$warranty',
        'fields[fuel-type]': '$fuelType',
        'fields[year_heavyveh]': '$yearofmanufacture',
        'fields[kilometer_heavyveh]': '$kilometers',
        'status': 'pending',
        'lang': '${translator.currentLanguage}'
      };
      Response responseval = await dio.post(
          'https://oxydu.com/wp-json/wp/v2/motors',
          data: FormData.fromMap(a));
      _snackBarCheck(responseval.statusCode, context);
    }
    if (heavyChoice != 7) {
      var a = {
        'title': title,
        'motors-type': '$heavyVehicles,$heavyVehiclesType,$heavyVehiclesChild',
        'fields[price]': '$price',
        'fields[_description]': '$description',
        'fields[phone-number]': '$phoneNumber',
        'fields[discount]': '$discount',
        'fields[location]': '$location',
        'fields[bodycondition-heavyvehi]': '$bodyCondition',
        'fields[mechanical-condition-heavyvehicles]': '$mechanicalCondition',
        'fields[sellertype-heavyve]': '$sellerType',
        'fields[model_721]': '$model',
        'fields[capacity-weight]': '$capacityWeight',
        'fields[no-of-cylinders]': '$noOfCylinders',
        'fields[horsepower]': '$horsePower',
        'fields[warranty_797]': '$warranty',
        'fields[fuel-type]': '$fuelType',
        'fields[year_heavyveh]': '$yearofmanufacture',
        'fields[kilometer_heavyveh]': '$kilometers',
        'fields[make]': '$make',
        'status': 'pending',
        'lang': '${translator.currentLanguage}'
      };
      Response responseval = await dio.post(
          'https://oxydu.com/wp-json/wp/v2/motors',
          data: FormData.fromMap(a));
      _snackBarCheck(responseval.statusCode, context);
    }
  }

  autoAccessories(
      dynamic autoAccessories,
      dynamic title,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic location,
      dynamic autoChoice,
      dynamic autoAccessoriesAPI,
      dynamic autoAccessoriesAPIChild,
      dynamic sellerType,
      dynamic condition,
      dynamic usage,
      BuildContext context) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";

    if (autoChoice == 5) {
      var a = {
        'title': title,
        'motors-type': '$autoAccessories,$autoAccessoriesAPI',
        'fields[price]': '$price',
        'fields[_description]': '$description',
        'fields[phone-number]': '$phoneNumber',
        'fields[discount]': '$discount',
        'fields[location]': '$location',
        'fields[auto-accessories-sellery-type]': '$sellerType',
        'fields[auto-accessories-condition]': '$condition',
        'fields[auto-accessories-usage]': '$usage',
        'status': 'pending',
        'lang': '${translator.currentLanguage}'
      };
      Response responseval = await dio.post(
          'https://oxydu.com/wp-json/wp/v2/motors',
          data: FormData.fromMap(a));
      _snackBarCheck(responseval.statusCode, context);
    }
    if (autoChoice != 5) {
      var a = {
        'title': title,
        'motors-type':
            '$autoAccessories,$autoAccessoriesAPI,$autoAccessoriesAPIChild',
        'fields[price]': '$price',
        'fields[_description]': '$description',
        'fields[phone-number]': '$phoneNumber',
        'fields[discount]': '$discount',
        'fields[location]': '$location',
        'fields[auto-accessories-sellery-type]': '$sellerType',
        'fields[auto-accessories-condition]': '$condition',
        'fields[auto-accessories-usage]': '$usage',
        'status': 'pending',
        'lang': '${translator.currentLanguage}'
      };
      Response responseval = await dio.post(
          'https://oxydu.com/wp-json/wp/v2/motors',
          data: FormData.fromMap(a));
      _snackBarCheck(responseval.statusCode, context);
    }
  }

  boats(
      dynamic boats,
      dynamic title,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic location,
      dynamic boatsAPI,
      dynamic boatsAPIChild,
      dynamic sellerType,
      dynamic condition,
      dynamic usage,
      dynamic length,
      dynamic warranty,
      dynamic age,
      BuildContext context) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': title,
      'motors-type': '$boats,$boatsAPI,$boatsAPIChild',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'fields[age]': '$age',
      'fields[usage_176]': '$usage',
      'fields[condition]': '$condition',
      'fields[seller-type_303]': '$sellerType',
      'fields[warranty_509]': '$warranty',
      'fields[lengthlength]': '$length',
      'status': 'pending',
      'lang': '${translator.currentLanguage}'
    };
    Response responseval = await dio.post(
        'https://oxydu.com/wp-json/wp/v2/motors',
        data: FormData.fromMap(a));
    _snackBarCheck(responseval.statusCode, context);
  }

  numberPlate(
      dynamic numberPlate,
      dynamic title,
      dynamic price,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic location,
      dynamic numberPlateAPI,
      dynamic numberPlateChild,
      BuildContext context) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': title,
      'motors-type': '$numberPlate,$numberPlateAPI,$numberPlateChild',
      'fields[price]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'status': 'pending',
      'lang': '${translator.currentLanguage}'
    };
    Response responseval = await dio.post(
        'https://oxydu.com/wp-json/wp/v2/motors',
        data: FormData.fromMap(a));
    _snackBarCheck(responseval.statusCode, context);
  }

//////////////////////////////////////property For Sale/////////////////////////
  landForSale(
      dynamic price,
      dynamic title,
      dynamic description,
      dynamic phoneNumber,
      dynamic discount,
      dynamic sizeSQFT,
      dynamic url360,
      dynamic youTube,
      dynamic totalClosingFee,
      dynamic buyerTransferFee,
      dynamic propertyReferenceId,
      dynamic sellerTransferFee,
      dynamic listedBy,
      dynamic zonedFor,
      dynamic approvedBuildUpArea,
      dynamic areYouAlandLord,
      dynamic freeHold,
      dynamic location,
      dynamic landForSaleAPI,
      dynamic reralandLordName,
      dynamic property,
      dynamic reraBrokerIdNumber,
      dynamic reraListerCompanyName,
      dynamic reraPremitNumber,
      dynamic reraAgentName,
      dynamic reraTitleDeedNumber,
      dynamic reraPreRegistrationNumber,
      BuildContext context) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $s";
    var a = {
      'title': title,
      'fields[price_sale]': '$price',
      'fields[_description]': '$description',
      'fields[phone-number]': '$phoneNumber',
      'fields[discount]': '$discount',
      'fields[location]': '$location',
      'property-type-sale': '$landForSaleAPI',
      'fields[360-tour-url]': '$url360',
      'fields[youtube-url]': '$youTube',
      'fields[zone-for]': '$zonedFor',
      'fields[approved-build-up-area-size]': '$approvedBuildUpArea',
      'fields[free-hold]': '$freeHold',
      'fields[sqft-for-sale]': '$sizeSQFT',
      'fields[total-closing-fee]': '$totalClosingFee',
      'fields[property-reference-id]': '$propertyReferenceId',
      'fields[buyer-transfer-fee]': '$buyerTransferFee',
      'fields[seller-transfer-fee]': '$sellerTransferFee',
      'fields[listed-by]': '$listedBy',
      'fields[land-or-agent]': '$areYouAlandLord',
      'status': 'pending',
      'lang': '${translator.currentLanguage}',
      'fields[rera-landlord-name]': '$reralandLordName',
      'fields[property]': '$property',
      'fields[rera-broker-id-number]': '$reraBrokerIdNumber',
      'fields[rera-lister-company-name]': '$reraListerCompanyName',
      'fields[rera-premit-number]': '$reraPremitNumber',
      'fields[rera-agent-name]': '$reraAgentName',
      'fields[rera-title-deed-number]': '$reraTitleDeedNumber',
      'fields[rera-pre-registration-number]': '$reraPreRegistrationNumber',
    };
    Response responseval = await dio.post(
        'https://oxydu.com/wp-json/wp/v2/property-for-sale',
        data: FormData.fromMap(a));
    _snackBarCheck(responseval.statusCode, context);
  }
}
