import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../SnackBarService.dart';
import 'notes_service.dart';
import 'package:oxydu/constants.dart';
import 'package:path/path.dart' as p;

class PlaceUsedCarForSaleInputForm extends StatefulWidget {
  @override
  _PlaceUsedCarForSaleInputFormState createState() =>
      _PlaceUsedCarForSaleInputFormState();
}

class _PlaceUsedCarForSaleInputFormState
    extends State<PlaceUsedCarForSaleInputForm> {
  final myController = TextEditingController();
  dynamic choice = 90, car, carModel, carModelAPI, price;
  dynamic newValuee;
  dynamic _selectedLocatioNcmc,
      _selectedLocatioNalfaRomeo,
      _selectedLocatioNastonMartin,
      _selectedLocatioNaudi,
      _selectedLocatioNbmw,
      _selectedLocatioNbentley,
      _selectedLocatioNborgward,
      _selectedLocatioNbrilliance,
      _selectedLocatioNbugatti,
      _selectedLocatioNcadillac,
      _selectedLocatioNchangan,
      _selectedLocatioNchevrolet,
      _selectedLocatioNchrysler,
      _selectedLocatioNcitroen,
      _selectedLocatioNdaihatsu,
      _selectedLocatioNdodge,
      _selectedLocatioNferrari,
      _selectedLocatioNfiat,
      _selectedLocatioNford,
      _selectedLocatioNfoton,
      _selectedLocatioNgac,
      _selectedLocatioNgmc,
      _selectedLocatioNgeely,
      _selectedLocatioNgenesis,
      _selectedLocatioNhaval,
      _selectedLocatioNhonda,
      _selectedLocatioNhummer,
      _selectedLocatioNhyundai,
      _selectedLocatioNinfiniti,
      _selectedLocatioNisuzu,
      _selectedLocatioNjAC,
      _selectedLocatioNjaguar,
      _selectedLocatioNjeep,
      _selectedLocatioNjetour,
      _selectedLocatioNkia,
      _selectedLocatioNlamborghini,
      _selectedLocatioNlancia,
      _selectedLocatioNlandRover,
      _selectedLocatioNlexus,
      _selectedLocatioNlincoln,
      _selectedLocatioNlotus,
      _selectedLocatioNmg,
      _selectedLocatioNmINI,
      _selectedLocatioNmahindra,
      _selectedLocatioNmaserati,
      _selectedLocatioNmaybach,
      _selectedLocatioNmazda,
      _selectedLocatioNmcLaren,
      _selectedLocatioNmercedesBenz,
      _selectedLocatioNmercury,
      _selectedLocatioNmitsubishi,
      _selectedLocatioNmorgan,
      _selectedLocatioNnissan,
      _selectedLocatioNopel,
      _selectedLocatioNothermake,
      _selectedLocatioNoullim,
      _selectedLocatioNpeugeot,
      _selectedLocatioNpontiac,
      _selectedLocatioNporsche,
      _selectedLocatioNproton,
      _selectedLocatioNrenault,
      _selectedLocatioNrollsRoyce,
      _selectedLocatioNrover,
      _selectedLocatioNseat,
      _selectedLocatioNskoda,
      _selectedLocatioNsmart,
      _selectedLocatioNsoueast,
      _selectedLocatioNssangYong,
      _selectedLocatioNsubaru,
      _selectedLocatioNsuzuki,
      _selectedLocatioNtata,
      _selectedLocatioNtesla,
      _selectedLocatioNtoyota,
      _selectedLocatioNvolkswagen,
      _selectedLocatioNvolvo,
      _selectedLocationcartype3,
      _selectedLocatioNwMotors;
  /////////////////////////////////////
  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic title, description;
  File featuredImage, galaryImage;
  bool loadingFeatured,
      loadingGalary,
      doseLoadFeaturedImage,
      doseLoadGalaryImage;
  var featuredImageID, galaryImageID;
  List<XFile> imageFileList = [];
  List<dynamic> testlist = [];
  SnackBarService get obj => GetIt.I<SnackBarService>();
  final picker = ImagePicker();
  static var carsModels,
      cmc,
      alfaRomeo,
      astonMartin,
      audi,
      bmw,
      bentley,
      borgward,
      brilliance,
      bugatti,
      cadillac,
      changan,
      chevrolet,
      chrysler,
      citroen,
      daihatsu,
      dodge,
      ferrari,
      fiat,
      fisker,
      ford,
      foton,
      gac,
      gmc,
      geely,
      genesis,
      grandTiger,
      greatWall,
      haval,
      honda,
      hongqi,
      hummer,
      hyundai,
      infiniti,
      isuzu,
      jAC,
      jaguar,
      jeep,
      jetour,
      kia,
      kingLong,
      lamborghini,
      lancia,
      landRover,
      lexus,
      lincoln,
      lotus,
      mg,
      mINI,
      mahindra,
      maserati,
      maybach,
      mazda,
      mcLaren,
      mercedesBenz,
      mercury,
      mitsubishi,
      morgan,
      nissan,
      opel,
      othermake,
      oullim,
      peugeot,
      pontiac,
      porsche,
      proton,
      renault,
      rollsRoyce,
      rover,
      seat,
      skoda,
      smart,
      soueast,
      ssangYong,
      subaru,
      suzuki,
      tata,
      tesla,
      toyota,
      uaz,
      volkswagen,
      volvo,
      wMotors;

  List<dynamic> type = ["ok"]; // Option 2
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
    loadingFeatured = false;
    loadingGalary = false;
    doseLoadFeaturedImage = false;
    doseLoadGalaryImage = false;
  }

  Future chooseImage(ImageSource source, dynamic x) async {
    if (x == 1) {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final path = pickedFile.path == null ? "" : pickedFile.path;
        final extension = p.extension(path);
        if (extension == ".png" ||
            extension == ".jpg" ||
            extension == ".jpeg") {
          setState(() {
            featuredImage = File(pickedFile.path);
          });
        }
      }
    }
    if (x == 2) {
      testlist.clear();
      imageFileList = [];
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = "Bearer $s";
      final List<XFile> pickedFileArray = await picker.pickMultiImage();
      if (pickedFileArray != null) {
        imageFileList.addAll(pickedFileArray);
        /////////////////////////////////////////////////
        setState(() {
          loadingGalary = true;
        });

        for (int i = 0; i < imageFileList.length; i++) {
          galaryImage = File(imageFileList[i].path);
          String fileName = galaryImage.path.split('/').last;
          FormData formData = FormData.fromMap({
            "file": await MultipartFile.fromFile(galaryImage.path,
                filename: fileName),
            'lang': '${translator.currentLanguage}'
          });
          Response response = await dio
              .post("https://oxydu.com/wp-json/wp/v2/media/", data: formData);
          if (response.statusCode == 201) {
            setState(() {
              galaryImageID = response.data["id"];
              testlist.add(galaryImageID);
            });
          }
        }
        setState(() {
          loadingGalary = false;
          doseLoadGalaryImage = true;
        });
      }
    }
  }

  Future uploadfeaturedImage() async {
    if (featuredImage != null) {
      setState(() {
        loadingFeatured = true;
      });
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = "Bearer $s";
      String fileName = featuredImage.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(featuredImage.path,
            filename: fileName),
        'lang': '${translator.currentLanguage}'
      });
      Response response = await dio
          .post("https://oxydu.com/wp-json/wp/v2/media/", data: formData);
      if (response.statusCode == 201) {
        setState(() {
          loadingFeatured = false;
          doseLoadFeaturedImage = true;
          featuredImageID = response.data["id"];
        });
      }
    } else {
      obj.snackBarSelectImage(context);
    }
  }

  Future uploadGalaryImage() async {
    if (featuredImage != null) {
      setState(() {
        loadingFeatured = true;
      });
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = "Bearer $s";
      String fileName = featuredImage.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(featuredImage.path,
            filename: fileName),
        'lang': '${translator.currentLanguage}'
      });
      Response response = await dio
          .post("https://oxydu.com/wp-json/wp/v2/media/", data: formData);
      if (response.statusCode == 201) {
        setState(() {
          loadingFeatured = false;
          doseLoadFeaturedImage = true;
          featuredImageID = response.data["id"];
        });
      }
    } else {
      obj.snackBarSelectImage(context);
    }
  }

  /* bool _phoneNumberValidator(dynamic value) {
    Pattern pattern = r'\d';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return true;
    else
      return false;
  }*/

  Widget _buildDropDown(dynamic text, List<dynamic> list, dynamic choicee,
      dynamic _selectedLocation2) {
    return Column(
      children: [
        DropdownButtonFormField(
          isExpanded: true,
          validator: (value) =>
              value == null ? translator.translate('Required') : null,
          decoration: InputDecoration(
              fillColor: Colors.grey,
              focusColor: Colors.grey,
              hoverColor: Colors.grey,
              labelStyle: TextStyle(fontSize: 4.w),
              contentPadding: EdgeInsets.fromLTRB(15, padding, 15, 0),
              isDense: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(5.0),
                ),
              )),
          selectedItemBuilder: (BuildContext context) {
            return list.map<Widget>((dynamic text) {
              return Text(
                text,
                overflow: TextOverflow.ellipsis,
              );
            }).toList();
          },
          items: list.map<DropdownMenuItem<dynamic>>((dynamic text) {
            return DropdownMenuItem<dynamic>(
              value: text,
              child: Column(
                children: [
                  Text(text, maxLines: 3, overflow: TextOverflow.ellipsis),
                  Divider(),
                  SizedBox(height: 10),
                ],
              ),
            );
          }).toList(),
          hint: Text(text),
          value: _selectedLocation2,
          onChanged: (dynamic newValue) {
            setState(() {
              carModel = list.indexOf(newValue);
              if (translator.currentLanguage == 'ar') {
                if (choice == 0) {
                  car = 1113;
                  if (carModel == 0) carModelAPI = 3979;
                  if (carModel == 1) carModelAPI = 3969;
                  if (carModel == 2) carModelAPI = 3957;
                  if (carModel == 3) carModelAPI = 3965;
                  if (carModel == 4) carModelAPI = 3961;
                  if (carModel == 5) carModelAPI = 3951;
                  if (carModel == 6) carModelAPI = 3949;
                  if (carModel == 7) carModelAPI = 3947;
                  _selectedLocatioNalfaRomeo = newValue;
                }
                if (choice == 1) {
                  car = 1111;
                  if (carModel == 0) carModelAPI = 1115;
                  if (carModel == 1) carModelAPI = 4031;
                  if (carModel == 2) carModelAPI = 4035;
                  if (carModel == 3) carModelAPI = 4029;
                  if (carModel == 4) carModelAPI = 1117;
                  if (carModel == 5) carModelAPI = 1119;
                  if (carModel == 6) carModelAPI = 4037;
                  if (carModel == 7) carModelAPI = 4043;
                  if (carModel == 8) carModelAPI = 4053;
                  _selectedLocatioNastonMartin = newValue;
                }
                if (choice == 2) {
                  car = 829;
                  if (carModel == 0) carModelAPI = 3917;
                  if (carModel == 1) carModelAPI = 935;
                  if (carModel == 2) carModelAPI = 937;
                  if (carModel == 3) carModelAPI = 939;
                  if (carModel == 4) carModelAPI = 3125;
                  if (carModel == 5) carModelAPI = 3137;
                  if (carModel == 6) carModelAPI = 3143;
                  if (carModel == 7) carModelAPI = 3249;
                  if (carModel == 8) carModelAPI = 3261;
                  if (carModel == 9) carModelAPI = 3269;
                  if (carModel == 10) carModelAPI = 3271;
                  if (carModel == 11) carModelAPI = 3281;
                  if (carModel == 12) carModelAPI = 3919;
                  if (carModel == 13) carModelAPI = 3291;
                  if (carModel == 14) carModelAPI = 3921;
                  if (carModel == 15) carModelAPI = 3299;
                  if (carModel == 16) carModelAPI = 3301;
                  if (carModel == 17) carModelAPI = 3923;
                  if (carModel == 18) carModelAPI = 3303;
                  if (carModel == 19) carModelAPI = 3305;
                  _selectedLocatioNaudi = newValue;
                }
                if (choice == 3) {
                  car = 941;
                  if (carModel == 0) carModelAPI = 943;
                  if (carModel == 1) carModelAPI = 947;
                  if (carModel == 2) carModelAPI = 3335;
                  if (carModel == 3) carModelAPI = 3379;
                  if (carModel == 4) carModelAPI = 3387;
                  if (carModel == 5) carModelAPI = 3393;
                  if (carModel == 6) carModelAPI = 3397;
                  if (carModel == 7) carModelAPI = 3415;
                  if (carModel == 8) carModelAPI = 3535;
                  if (carModel == 9) carModelAPI = 3681;
                  if (carModel == 10) carModelAPI = 3463;
                  if (carModel == 11) carModelAPI = 3417;
                  if (carModel == 12) carModelAPI = 3659;
                  if (carModel == 13) carModelAPI = 3423;
                  if (carModel == 14) carModelAPI = 3669;
                  if (carModel == 15) carModelAPI = 3435;
                  if (carModel == 16) carModelAPI = 3811;
                  if (carModel == 17) carModelAPI = 3467;
                  if (carModel == 18) carModelAPI = 3691;
                  if (carModel == 19) carModelAPI = 3501;
                  if (carModel == 20) carModelAPI = 3509;
                  if (carModel == 21) carModelAPI = 3517;
                  if (carModel == 22) carModelAPI = 3523;
                  if (carModel == 23) carModelAPI = 3257;
                  if (carModel == 24) carModelAPI = 3699;
                  if (carModel == 25) carModelAPI = 3531;
                  if (carModel == 26) carModelAPI = 3701;
                  //if (carModel == 27) carModelAPI = 3651;
                  _selectedLocatioNbmw = newValue;
                }
                if (choice == 4) {
                  car = 1121;
                  if (carModel == 0) carModelAPI = 3831;
                  if (carModel == 1) carModelAPI = 3859;
                  if (carModel == 2) carModelAPI = 1235;
                  if (carModel == 3) carModelAPI = 1237;
                  if (carModel == 4) carModelAPI = 1243;
                  if (carModel == 5) carModelAPI = 3547;
                  if (carModel == 6) carModelAPI = 3539;
                  if (carModel == 7) carModelAPI = 3543;
                  if (carModel == 8) carModelAPI = 3907;
                  _selectedLocatioNbentley = newValue;
                }
                if (choice == 5) {
                  car = 3954;
                  if (carModel == 0) carModelAPI = 3959;
                  if (carModel == 1) carModelAPI = 3967;
                  _selectedLocatioNborgward = newValue;
                }
                if (choice == 6) {
                  car = 4009;
                  if (carModel == 0) carModelAPI = 4033;
                  _selectedLocatioNbrilliance = newValue;
                }
                if (choice == 7) {
                  car = 4051;
                  if (carModel == 1) carModelAPI = 4085;
                  if (carModel == 2) carModelAPI = 4097;
                  if (carModel == 0) carModelAPI = 4095;
                  if (carModel == 3) carModelAPI = 4099;
                  _selectedLocatioNbugatti = newValue;
                }
                if (choice == 8) {
                  car = 4089;
                  if (carModel == 0) carModelAPI = 4093;
                  _selectedLocatioNcmc = newValue;
                }
                if (choice == 9) {
                  car = 1123;
                  if (carModel == 0) carModelAPI = 1251;
                  if (carModel == 1) carModelAPI = 4135;
                  if (carModel == 2) carModelAPI = 3565;
                  if (carModel == 3) carModelAPI = 1253;
                  if (carModel == 4) carModelAPI = 4139;
                  if (carModel == 5) carModelAPI = 1259;
                  if (carModel == 6) carModelAPI = 3569;
                  if (carModel == 7) carModelAPI = 4133;
                  if (carModel == 8) carModelAPI = 3599;
                  if (carModel == 9) carModelAPI = 4143;
                  if (carModel == 10) carModelAPI = 4147;
                  if (carModel == 11) carModelAPI = 4153;
                  if (carModel == 12) carModelAPI = 4155;
                  if (carModel == 13) carModelAPI = 3621;
                  _selectedLocatioNcadillac = newValue;
                }
                if (choice == 10) {
                  car = 1125;
                  if (carModel == 0) carModelAPI = 4131;
                  if (carModel == 1) carModelAPI = 4137;
                  if (carModel == 2) carModelAPI = 1285;
                  if (carModel == 3) carModelAPI = 4141;
                  if (carModel == 4) carModelAPI = 4145;
                  _selectedLocatioNchangan = newValue;
                }
                if (choice == 11) {
                  car = 949;
                  if (carModel == 0) carModelAPI = 6291;
                  if (carModel == 1) carModelAPI = 4269;
                  if (carModel == 2) carModelAPI = 6267;
                  if (carModel == 3) carModelAPI = 951;
                  if (carModel == 4) carModelAPI = 4265;
                  if (carModel == 5) carModelAPI = 953;
                  if (carModel == 6) carModelAPI = 955;
                  if (carModel == 7) carModelAPI = 4263;
                  if (carModel == 8) carModelAPI = 4261;
                  if (carModel == 9) carModelAPI = 4259;
                  if (carModel == 10) carModelAPI = 4257;
                  if (carModel == 11) carModelAPI = 6255;
                  if (carModel == 12) carModelAPI = 4253;
                  if (carModel == 13) carModelAPI = 4251;
                  if (carModel == 14) carModelAPI = 4247;
                  if (carModel == 15) carModelAPI = 4245;
                  if (carModel == 16) carModelAPI = 6221;
                  if (carModel == 17) carModelAPI = 4243;
                  if (carModel == 18) carModelAPI = 4239;
                  if (carModel == 19) carModelAPI = 4237;
                  if (carModel == 20) carModelAPI = 4235;
                  if (carModel == 21) carModelAPI = 4241;
                  if (carModel == 22) carModelAPI = 4233;
                  if (carModel == 23) carModelAPI = 4231;
                  if (carModel == 24) carModelAPI = 4229;
                  if (carModel == 25) carModelAPI = 4227;
                  if (carModel == 26) carModelAPI = 4225;
                  if (carModel == 27) carModelAPI = 4223;
                  _selectedLocatioNchevrolet = newValue;
                }
                if (choice == 12) {
                  car = 1127;
                  if (carModel == 0) carModelAPI = 1340;
                  if (carModel == 1) carModelAPI = 1342;
                  if (carModel == 2) carModelAPI = 4295;
                  if (carModel == 3) carModelAPI = 4285;
                  if (carModel == 4) carModelAPI = 4287;
                  if (carModel == 5) carModelAPI = 4283;
                  if (carModel == 6) carModelAPI = 4289;
                  if (carModel == 7) carModelAPI = 4293;
                  _selectedLocatioNchrysler = newValue;
                }
                if (choice == 13) {
                  car = 1129;
                  if (carModel == 0) carModelAPI = 4313;
                  if (carModel == 1) carModelAPI = 4311;
                  if (carModel == 2) carModelAPI = 4305;
                  if (carModel == 3) carModelAPI = 1358;
                  _selectedLocatioNcitroen = newValue;
                }
                if (choice == 14) {
                  car = 4317;
                  if (carModel == 0) carModelAPI = 4349;
                  if (carModel == 1) carModelAPI = 4353;
                  if (carModel == 2) carModelAPI = 4341;
                  _selectedLocatioNdaihatsu = newValue;
                }
                if (choice == 15) {
                  car = 1131;
                  if (carModel == 0) carModelAPI = 4351;
                  if (carModel == 1) carModelAPI = 4355;
                  if (carModel == 2) carModelAPI = 4357;
                  if (carModel == 3) carModelAPI = 1388;
                  if (carModel == 4) carModelAPI = 1390;
                  if (carModel == 5) carModelAPI = 4359;
                  if (carModel == 6) carModelAPI = 4361;
                  if (carModel == 7) carModelAPI = 4363;
                  if (carModel == 8) carModelAPI = 4365;
                  if (carModel == 9) carModelAPI = 4371;
                  if (carModel == 10) carModelAPI = 4393;
                  if (carModel == 11) carModelAPI = 4379;
                  if (carModel == 12) carModelAPI = 4387;
                  _selectedLocatioNdodge = newValue;
                }
                if (choice == 16) {
                  car = 1135;
                  if (carModel == 0) carModelAPI = 4485;
                  if (carModel == 1) carModelAPI = 4483;
                  if (carModel == 2) carModelAPI = 1406;
                  if (carModel == 3) carModelAPI = 4481;
                  if (carModel == 4) carModelAPI = 4479;
                  if (carModel == 5) carModelAPI = 4477;
                  if (carModel == 6) carModelAPI = 4475;
                  if (carModel == 7) carModelAPI = 4473;
                  if (carModel == 8) carModelAPI = 4471;
                  if (carModel == 9) carModelAPI = 4469;
                  if (carModel == 10) carModelAPI = 1412;
                  if (carModel == 11) carModelAPI = 4467;
                  if (carModel == 12) carModelAPI = 4465;
                  if (carModel == 13) carModelAPI = 4463;
                  if (carModel == 14) carModelAPI = 4461;
                  if (carModel == 15) carModelAPI = 4459;
                  if (carModel == 16) carModelAPI = 4455;
                  if (carModel == 17) carModelAPI = 4453;
                  if (carModel == 18) carModelAPI = 4449;
                  if (carModel == 19) carModelAPI = 4443;
                  if (carModel == 20) carModelAPI = 4445;
                  if (carModel == 21) carModelAPI = 4439;
                  if (carModel == 22) carModelAPI = 4433;
                  if (carModel == 23) carModelAPI = 4425;
                  if (carModel == 24) carModelAPI = 4431;
                  if (carModel == 25) carModelAPI = 4429;
                  if (carModel == 26) carModelAPI = 4427;
                  _selectedLocatioNferrari = newValue;
                }
                if (choice == 17) {
                  car = 1133;
                  if (carModel == 0) carModelAPI = 1430;
                  if (carModel == 1) carModelAPI = 1436;
                  if (carModel == 2) carModelAPI = 4447;
                  if (carModel == 3) carModelAPI = 4451;
                  if (carModel == 4) carModelAPI = 4457;
                  _selectedLocatioNfiat = newValue;
                }
                /* if (choice == 18) {
                _selectedLocatioNfisker = newValue;
              }*/
                if (choice == 18) {
                  car = 957;
                  if (carModel == 0) carModelAPI = 4545;
                  if (carModel == 1) carModelAPI = 4547;
                  if (carModel == 2) carModelAPI = 959;
                  if (carModel == 3) carModelAPI = 961;
                  if (carModel == 4) carModelAPI = 963;
                  if (carModel == 5) carModelAPI = 4549;
                  if (carModel == 6) carModelAPI = 4551;
                  if (carModel == 7) carModelAPI = 4553;
                  if (carModel == 8) carModelAPI = 4557;
                  if (carModel == 9) carModelAPI = 4561;
                  if (carModel == 10) carModelAPI = 4563;
                  if (carModel == 11) carModelAPI = 4565;
                  if (carModel == 12) carModelAPI = 4567;
                  if (carModel == 13) carModelAPI = 4571;
                  if (carModel == 14) carModelAPI = 4573;
                  if (carModel == 15) carModelAPI = 4577;
                  if (carModel == 16) carModelAPI = 4579;
                  if (carModel == 17) carModelAPI = 4607;
                  if (carModel == 18) carModelAPI = 4581;
                  if (carModel == 19) carModelAPI = 4583;
                  if (carModel == 20) carModelAPI = 4589;
                  if (carModel == 21) carModelAPI = 4591;
                  if (carModel == 22) carModelAPI = 4593;
                  if (carModel == 23) carModelAPI = 4597;
                  if (carModel == 24) carModelAPI = 4601;
                  _selectedLocatioNford = newValue;
                }
                if (choice == 19) {
                  car = 4525;
                  if (carModel == 0) carModelAPI = 4559;
                  if (carModel == 1) carModelAPI = 4543;
                  _selectedLocatioNfoton = newValue;
                }
                if (choice == 20) {
                  car = 4599;
                  if (carModel == 0) carModelAPI = 4615;
                  if (carModel == 1) carModelAPI = 4609;
                  _selectedLocatioNgac = newValue;
                }
                if (choice == 21) {
                  car = 1139;
                  if (carModel == 0) carModelAPI = 1456;
                  if (carModel == 1) carModelAPI = 4631;
                  if (carModel == 2) carModelAPI = 4635;
                  if (carModel == 3) carModelAPI = 4655;
                  if (carModel == 4) carModelAPI = 1460;
                  if (carModel == 5) carModelAPI = 4639;
                  if (carModel == 6) carModelAPI = 4643;
                  if (carModel == 7) carModelAPI = 4651;
                  if (carModel == 8) carModelAPI = 4653;
                  if (carModel == 9) carModelAPI = 4647;
                  _selectedLocatioNgmc = newValue;
                }
                if (choice == 22) {
                  car = 1137;
                  if (carModel == 0) carModelAPI = 4633;
                  if (carModel == 1) carModelAPI = 1476;
                  if (carModel == 2) carModelAPI = 4641;
                  if (carModel == 3) carModelAPI = 4649;
                  _selectedLocatioNgeely = newValue;
                }
                if (choice == 23) {
                  car = 4669;
                  if (carModel == 0) carModelAPI = 4699;
                  if (carModel == 1) carModelAPI = 4711;
                  if (carModel == 2) carModelAPI = 4716;
                  if (carModel == 3) carModelAPI = 4720;
                  _selectedLocatioNgenesis = newValue;
                }
                /* if (choice == 24) {
                _selectedLocatioNgrandTiger = newValue;
              }*/
                /*if (choice == 24) {
                _selectedLocatioNgreatWall = newValue;
              }*/
                if (choice == 24) {
                  car = 4724;
                  if (carModel == 0) carModelAPI = 4738;
                  if (carModel == 1) carModelAPI = 4742;
                  _selectedLocatioNhaval = newValue;
                }
                if (choice == 25) {
                  car = 1141;
                  if (carModel == 0) carModelAPI = 1484;
                  if (carModel == 1) carModelAPI = 4701;
                  if (carModel == 2) carModelAPI = 4703;
                  if (carModel == 3) carModelAPI = 1486;
                  if (carModel == 4) carModelAPI = 4705;
                  if (carModel == 5) carModelAPI = 4707;
                  if (carModel == 6) carModelAPI = 4709;
                  if (carModel == 7) carModelAPI = 4713;
                  if (carModel == 8) carModelAPI = 4718;
                  if (carModel == 9) carModelAPI = 4727;
                  if (carModel == 10) carModelAPI = 4731;
                  if (carModel == 11) carModelAPI = 4729;
                  _selectedLocatioNhonda = newValue;
                }
                /* if (choice == 26) {
                car = 1047;
                _selectedLocatioNhongqi = newValue;
              }*/
                if (choice == 26) {
                  car = 1145;
                  if (carModel == 0) carModelAPI = 4786;
                  if (carModel == 1) carModelAPI = 4782;
                  if (carModel == 2) carModelAPI = 1159;
                  _selectedLocatioNhummer = newValue;
                }
                if (choice == 27) {
                  car = 956;
                  if (carModel == 0) carModelAPI = 967;
                  if (carModel == 1) carModelAPI = 4784;
                  if (carModel == 2) carModelAPI = 969;
                  if (carModel == 3) carModelAPI = 4788;
                  if (carModel == 4) carModelAPI = 9083;
                  if (carModel == 5) carModelAPI = 971;
                  if (carModel == 6) carModelAPI = 4792;
                  if (carModel == 7) carModelAPI = 4794;
                  if (carModel == 8) carModelAPI = 4796;
                  if (carModel == 9) carModelAPI = 4798;
                  if (carModel == 10) carModelAPI = 4800;
                  if (carModel == 11) carModelAPI = 4816;
                  if (carModel == 12) carModelAPI = 4818;
                  if (carModel == 13) carModelAPI = 4802;
                  if (carModel == 14) carModelAPI = 4820;
                  if (carModel == 15) carModelAPI = 4804;
                  if (carModel == 16) carModelAPI = 4806;
                  if (carModel == 17) carModelAPI = 4808;

                  if (carModel == 18) carModelAPI = 4810;
                  if (carModel == 19) carModelAPI = 4812;
                  if (carModel == 20) carModelAPI = 4814;
                  _selectedLocatioNhyundai = newValue;
                }
                if (choice == 28) {
                  car = 1147;
                  if (carModel == 0) carModelAPI = 4852;
                  if (carModel == 1) carModelAPI = 4854;
                  if (carModel == 2) carModelAPI = 1211;
                  if (carModel == 3) carModelAPI = 1213;
                  if (carModel == 4) carModelAPI = 4856;
                  if (carModel == 5) carModelAPI = 1219;
                  if (carModel == 6) carModelAPI = 4850;
                  if (carModel == 7) carModelAPI = 4858;
                  if (carModel == 8) carModelAPI = 4860;
                  if (carModel == 9) carModelAPI = 4862;
                  if (carModel == 10) carModelAPI = 4864;
                  if (carModel == 11) carModelAPI = 4866;
                  if (carModel == 12) carModelAPI = 4868;
                  if (carModel == 13) carModelAPI = 4870;
                  if (carModel == 14) carModelAPI = 4872;
                  if (carModel == 15) carModelAPI = 4844;
                  if (carModel == 16) carModelAPI = 4876;
                  _selectedLocatioNinfiniti = newValue;
                }
                if (choice == 29) {
                  car = 4884;
                  if (carModel == 0) carModelAPI = 4892;
                  if (carModel == 1) carModelAPI = 4890;
                  _selectedLocatioNisuzu = newValue;
                }
                if (choice == 30) {
                  car = 1149;
                  if (carModel == 0) carModelAPI = 1254;
                  if (carModel == 1) carModelAPI = 4896;
                  _selectedLocatioNjAC = newValue;
                }
                if (choice == 31) {
                  car = 1151;
                  if (carModel == 0) carModelAPI = 4926;
                  if (carModel == 1) carModelAPI = 4928;
                  if (carModel == 2) carModelAPI = 4930;
                  if (carModel == 3) carModelAPI = 4922;
                  if (carModel == 4) carModelAPI = 4924;
                  if (carModel == 5) carModelAPI = 1261;
                  if (carModel == 6) carModelAPI = 1267;
                  if (carModel == 7) carModelAPI = 1269;
                  if (carModel == 8) carModelAPI = 4934;
                  if (carModel == 9) carModelAPI = 4936;
                  if (carModel == 10) carModelAPI = 4938;
                  if (carModel == 11) carModelAPI = 4940;
                  if (carModel == 12) carModelAPI = 4944;
                  if (carModel == 13) carModelAPI = 4932;
                  if (carModel == 14) carModelAPI = 4942;
                  _selectedLocatioNjaguar = newValue;
                }
                if (choice == 32) {
                  car = 1153;
                  if (carModel == 0) carModelAPI = 1287;
                  if (carModel == 1) carModelAPI = 1295;
                  if (carModel == 2) carModelAPI = 1293;
                  if (carModel == 3) carModelAPI = 4964;
                  if (carModel == 4) carModelAPI = 4968;
                  if (carModel == 5) carModelAPI = 4972;
                  if (carModel == 6) carModelAPI = 4984;
                  if (carModel == 7) carModelAPI = 4976;
                  if (carModel == 8) carModelAPI = 4980;
                  if (carModel == 9) carModelAPI = 4982;
                  _selectedLocatioNjeep = newValue;
                }
                if (choice == 33) {
                  car = 4962;
                  if (carModel == 0) carModelAPI = 4970;
                  if (carModel == 1) carModelAPI = 4978;
                  _selectedLocatioNjetour = newValue;
                }
                if (choice == 34) {
                  car = 1155;
                  if (carModel == 0) carModelAPI = 1309;
                  if (carModel == 1) carModelAPI = 5024;
                  if (carModel == 2) carModelAPI = 1311;
                  if (carModel == 3) carModelAPI = 5026;
                  if (carModel == 4) carModelAPI = 5028;
                  if (carModel == 5) carModelAPI = 5030;
                  if (carModel == 6) carModelAPI = 5046;
                  if (carModel == 7) carModelAPI = 5034;
                  if (carModel == 8) carModelAPI = 5022;
                  if (carModel == 9) carModelAPI = 5052;
                  if (carModel == 10) carModelAPI = 5058;
                  if (carModel == 11) carModelAPI = 5064;
                  if (carModel == 12) carModelAPI = 5062;
                  if (carModel == 13) carModelAPI = 5068;

                  if (carModel == 14) carModelAPI = 5074;
                  if (carModel == 15) carModelAPI = 5078;
                  if (carModel == 16) carModelAPI = 5084;

                  if (carModel == 17) carModelAPI = 5092;
                  if (carModel == 18) carModelAPI = 5104;
                  if (carModel == 19) carModelAPI = 5110;
                  _selectedLocatioNkia = newValue;
                }
                /*if (choice == 36) {
                _selectedLocatioNkingLong = newValue;
              }*/
                if (choice == 35) {
                  car = 5032;
                  if (carModel == 0) carModelAPI = 5036;
                  if (carModel == 1) carModelAPI = 5038;
                  if (carModel == 2) carModelAPI = 5040;
                  if (carModel == 3) carModelAPI = 5044;
                  if (carModel == 4) carModelAPI = 5042;
                  _selectedLocatioNlamborghini = newValue;
                }
                if (choice == 36) {
                  car = 5184;
                  if (carModel == 0) carModelAPI = 5082;
                  _selectedLocatioNlancia = newValue;
                }

                ////////////////////
                if (choice == 37) {
                  car = 973;
                  if (carModel == 0) carModelAPI = 975;
                  if (carModel == 1) carModelAPI = 977;
                  if (carModel == 2) carModelAPI = 5102;
                  if (carModel == 3) carModelAPI = 5106;
                  if (carModel == 4) carModelAPI = 5108;
                  if (carModel == 5) carModelAPI = 979;
                  if (carModel == 6) carModelAPI = 5112;
                  if (carModel == 7) carModelAPI = 5116;
                  if (carModel == 8) carModelAPI = 5118;
                  if (carModel == 9) carModelAPI = 5114;
                  _selectedLocatioNlandRover = newValue;
                }
                if (choice == 38) {
                  car = 1157;
                  if (carModel == 0) carModelAPI = 1364;
                  if (carModel == 1) carModelAPI = 1366;
                  if (carModel == 2) carModelAPI = 1372;
                  if (carModel == 3) carModelAPI = 5148;
                  if (carModel == 4) carModelAPI = 5150;
                  if (carModel == 5) carModelAPI = 5152;
                  if (carModel == 6) carModelAPI = 5154;
                  if (carModel == 7) carModelAPI = 5156;
                  if (carModel == 8) carModelAPI = 5158;
                  if (carModel == 9) carModelAPI = 5160;
                  if (carModel == 10) carModelAPI = 5162;
                  if (carModel == 11) carModelAPI = 5164;
                  if (carModel == 12) carModelAPI = 5166;
                  if (carModel == 13) carModelAPI = 5174;
                  if (carModel == 14) carModelAPI = 5168;
                  if (carModel == 15) carModelAPI = 5170;
                  if (carModel == 16) carModelAPI = 5172;
                  _selectedLocatioNlexus = newValue;
                }
                if (choice == 39) {
                  car = 1159;
                  if (carModel == 0) carModelAPI = 5218;
                  if (carModel == 1) carModelAPI = 1396;
                  if (carModel == 2) carModelAPI = 1398;
                  if (carModel == 3) carModelAPI = 5240;
                  if (carModel == 4) carModelAPI = 5246;
                  if (carModel == 5) carModelAPI = 5252;
                  if (carModel == 6) carModelAPI = 5262;
                  if (carModel == 7) carModelAPI = 5256;
                  if (carModel == 8) carModelAPI = 5266;
                  if (carModel == 9) carModelAPI = 5238;
                  _selectedLocatioNlincoln = newValue;
                }
                if (choice == 40) {
                  car = 5206;
                  if (carModel == 0) carModelAPI = 5196;
                  if (carModel == 1) carModelAPI = 5200;
                  _selectedLocatioNlotus = newValue;
                }
                if (choice == 41) {
                  car = 5216;
                  if (carModel == 0) carModelAPI = 5268;
                  if (carModel == 1) carModelAPI = 5264;
                  if (carModel == 2) carModelAPI = 5260;
                  if (carModel == 3) carModelAPI = 5254;
                  if (carModel == 4) carModelAPI = 5250;
                  if (carModel == 5) carModelAPI = 5248;
                  if (carModel == 6) carModelAPI = 5244;
                  if (carModel == 7) carModelAPI = 5242;
                  if (carModel == 8) carModelAPI = 5258;
                  _selectedLocatioNmg = newValue;
                }
                if (choice == 42) {
                  car = 1169;
                  if (carModel == 0) carModelAPI = 1414;
                  if (carModel == 1) carModelAPI = 1420;
                  if (carModel == 2) carModelAPI = 5276;
                  if (carModel == 3) carModelAPI = 5280;
                  if (carModel == 4) carModelAPI = 5272;
                  _selectedLocatioNmINI = newValue;
                }
                if (choice == 43) {
                  car = 5284;
                  if (carModel == 0) carModelAPI = 5288;
                  _selectedLocatioNmahindra = newValue;
                }
                if (choice == 44) {
                  car = 1161;
                  if (carModel == 0) carModelAPI = 1438;
                  if (carModel == 1) carModelAPI = 5294;
                  if (carModel == 2) carModelAPI = 5298;
                  if (carModel == 3) carModelAPI = 1444;
                  if (carModel == 4) carModelAPI = 5307;
                  if (carModel == 5) carModelAPI = 5303;
                  _selectedLocatioNmaserati = newValue;
                }
                if (choice == 45) {
                  car = 5311;
                  if (carModel == 0) carModelAPI = 5322;
                  if (carModel == 1) carModelAPI = 5324;
                  if (carModel == 2) carModelAPI = 5326;
                  if (carModel == 3) carModelAPI = 5328;
                  _selectedLocatioNmaybach = newValue;
                }
                if (choice == 46) {
                  car = 1163;
                  if (carModel == 0) carModelAPI = 5345;
                  if (carModel == 1) carModelAPI = 1448;
                  if (carModel == 2) carModelAPI = 1450;
                  if (carModel == 3) carModelAPI = 5347;
                  if (carModel == 4) carModelAPI = 5349;
                  if (carModel == 5) carModelAPI = 5351;
                  if (carModel == 6) carModelAPI = 5353;
                  if (carModel == 7) carModelAPI = 5357;
                  if (carModel == 8) carModelAPI = 5355;
                  _selectedLocatioNmazda = newValue;
                }
                if (choice == 47) {
                  car = 1165;
                  if (carModel == 0) carModelAPI = 1462;
                  if (carModel == 1) carModelAPI = 5377;
                  if (carModel == 2) carModelAPI = 5398;
                  if (carModel == 3) carModelAPI = 5414;
                  if (carModel == 4) carModelAPI = 5428;
                  if (carModel == 5) carModelAPI = 5462;
                  if (carModel == 6) carModelAPI = 5470;
                  if (carModel == 7) carModelAPI = 5468;
                  if (carModel == 8) carModelAPI = 5472;
                  if (carModel == 9) carModelAPI = 5442;
                  _selectedLocatioNmcLaren = newValue;
                }
                if (choice == 48) {
                  car = 981;
                  if (carModel == 0) carModelAPI = 5492;
                  if (carModel == 1) carModelAPI = 5498;
                  if (carModel == 2) carModelAPI = 5504;
                  if (carModel == 3) carModelAPI = 983;
                  if (carModel == 4) carModelAPI = 5508;
                  if (carModel == 5) carModelAPI = 985;
                  if (carModel == 6) carModelAPI = 987;
                  if (carModel == 7) carModelAPI = 5512;
                  if (carModel == 8) carModelAPI = 5518;
                  if (carModel == 9) carModelAPI = 5524;

                  if (carModel == 10) carModelAPI = 5528;
                  if (carModel == 11) carModelAPI = 5534;
                  if (carModel == 12) carModelAPI = 5538;
                  if (carModel == 13) carModelAPI = 5544;
                  if (carModel == 14) carModelAPI = 5550;
                  if (carModel == 15) carModelAPI = 5554;

                  if (carModel == 16) carModelAPI = 5560;
                  if (carModel == 17) carModelAPI = 5564;
                  if (carModel == 18) carModelAPI = 5568;

                  if (carModel == 19) carModelAPI = 5576;
                  if (carModel == 20) carModelAPI = 5580;

                  if (carModel == 21) carModelAPI = 5584;
                  if (carModel == 22) carModelAPI = 5586;
                  if (carModel == 23) carModelAPI = 5582;

                  if (carModel == 24) carModelAPI = 5578;
                  if (carModel == 25) carModelAPI = 5574;
                  if (carModel == 26) carModelAPI = 5572;

                  if (carModel == 27) carModelAPI = 5570;
                  if (carModel == 28) carModelAPI = 5566;

                  if (carModel == 29) carModelAPI = 5562;

                  if (carModel == 30) carModelAPI = 5558;
                  if (carModel == 31) carModelAPI = 5556;
                  if (carModel == 32) carModelAPI = 5552;
                  if (carModel == 33) carModelAPI = 5548;
                  if (carModel == 34) carModelAPI = 5546;
                  if (carModel == 35) carModelAPI = 5542;
                  if (carModel == 36) carModelAPI = 5494;

                  if (carModel == 37) carModelAPI = 5540;
                  if (carModel == 38) carModelAPI = 5536;
                  if (carModel == 39) carModelAPI = 5532;
                  if (carModel == 40) carModelAPI = 5530;

                  if (carModel == 41) carModelAPI = 5526;
                  if (carModel == 42) carModelAPI = 5522;
                  if (carModel == 43) carModelAPI = 5520;
                  if (carModel == 44) carModelAPI = 5516;
                  if (carModel == 45) carModelAPI = 5588;
                  if (carModel == 46) carModelAPI = 5510;
                  if (carModel == 47) carModelAPI = 5506;
                  if (carModel == 48) carModelAPI = 5502;
                  if (carModel == 49) carModelAPI = 5500;
                  if (carModel == 50) carModelAPI = 5496;
                  _selectedLocatioNmercedesBenz = newValue;
                }
                if (choice == 49) {
                  car = 1167;
                  if (carModel == 0) carModelAPI = 5626;
                  if (carModel == 1) carModelAPI = 5594;
                  if (carModel == 2) carModelAPI = 1492;
                  _selectedLocatioNmercury = newValue;
                }
                if (choice == 50) {
                  car = 989;
                  if (carModel == 0) carModelAPI = 991;
                  if (carModel == 1) carModelAPI = 993;
                  if (carModel == 2) carModelAPI = 995;
                  if (carModel == 3) carModelAPI = 5740;
                  if (carModel == 4) carModelAPI = 5732;
                  if (carModel == 5) carModelAPI = 5728;
                  if (carModel == 6) carModelAPI = 5722;
                  if (carModel == 7) carModelAPI = 5712;
                  if (carModel == 8) carModelAPI = 5698;
                  if (carModel == 9) carModelAPI = 5688;
                  if (carModel == 10) carModelAPI = 5680;
                  if (carModel == 11) carModelAPI = 5660;
                  if (carModel == 12) carModelAPI = 5650;
                  if (carModel == 13) carModelAPI = 5644;
                  if (carModel == 14) carModelAPI = 5640;
                  if (carModel == 15) carModelAPI = 5634;
                  if (carModel == 16) carModelAPI = 5632;
                  if (carModel == 17) carModelAPI = 5630;
                  if (carModel == 18) carModelAPI = 5672;
                  _selectedLocatioNmitsubishi = newValue;
                }
                if (choice == 51) {
                  car = 5638;
                  if (carModel == 0) carModelAPI = 5646;
                  if (carModel == 1) carModelAPI = 5666;
                  _selectedLocatioNmorgan = newValue;
                }
                if (choice == 52) {
                  car = 1173;
                  if (carModel == 0) carModelAPI = 5724;
                  if (carModel == 1) carModelAPI = 5730;
                  if (carModel == 2) carModelAPI = 999;
                  if (carModel == 3) carModelAPI = 1001;
                  if (carModel == 4) carModelAPI = 1003;
                  if (carModel == 5) carModelAPI = 5736;
                  if (carModel == 6) carModelAPI = 5738;
                  if (carModel == 7) carModelAPI = 5742;
                  if (carModel == 8) carModelAPI = 5748;
                  if (carModel == 9) carModelAPI = 5752;
                  if (carModel == 10) carModelAPI = 5756;
                  if (carModel == 11) carModelAPI = 5758;
                  if (carModel == 12) carModelAPI = 5762;
                  if (carModel == 13) carModelAPI = 5768;
                  if (carModel == 14) carModelAPI = 5772;
                  if (carModel == 15) carModelAPI = 5778;
                  if (carModel == 16) carModelAPI = 5784;
                  if (carModel == 17) carModelAPI = 5792;
                  if (carModel == 18) carModelAPI = 5804;
                  if (carModel == 19) carModelAPI = 5816;
                  if (carModel == 20) carModelAPI = 5832;
                  if (carModel == 21) carModelAPI = 5838;
                  if (carModel == 22) carModelAPI = 5842;
                  if (carModel == 23) carModelAPI = 5848;
                  if (carModel == 24) carModelAPI = 5852;
                  if (carModel == 25) carModelAPI = 5764;
                  _selectedLocatioNnissan = newValue;
                }
                if (choice == 53) {
                  car = 1171;
                  if (carModel == 0) carModelAPI = 5726;
                  if (carModel == 1) carModelAPI = 5734;
                  if (carModel == 2) carModelAPI = 5744;
                  if (carModel == 3) carModelAPI = 1203;
                  if (carModel == 4) carModelAPI = 5720;
                  if (carModel == 5) carModelAPI = 1205;
                  if (carModel == 6) carModelAPI = 1199;
                  _selectedLocatioNopel = newValue;
                }
                //////////////////////////////////////////
                if (choice == 54) {
                  car = 1173;
                  if (carModel == 0) carModelAPI = 6274;
                  if (carModel == 1) carModelAPI = 1478;
                  if (carModel == 2) carModelAPI = 6272;
                  if (carModel == 3) carModelAPI = 6276;

                  _selectedLocatioNothermake = newValue;
                }
                if (choice == 55) {
                  car = 5754;
                  if (carModel == 0) carModelAPI = 5760;
                  _selectedLocatioNoullim = newValue;
                }
                if (choice == 56) {
                  car = 1175;
                  if (carModel == 0) carModelAPI = 1221;
                  if (carModel == 1) carModelAPI = 1227;
                  if (carModel == 2) carModelAPI = 5780;
                  if (carModel == 3) carModelAPI = 1229;
                  if (carModel == 4) carModelAPI = 5854;
                  if (carModel == 5) carModelAPI = 5892;
                  if (carModel == 6) carModelAPI = 5906;
                  if (carModel == 7) carModelAPI = 5954;
                  if (carModel == 8) carModelAPI = 5926;
                  if (carModel == 9) carModelAPI = 5930;
                  if (carModel == 10) carModelAPI = 5986;
                  if (carModel == 11) carModelAPI = 5970;
                  if (carModel == 12) carModelAPI = 5966;
                  if (carModel == 13) carModelAPI = 5960;
                  if (carModel == 14) carModelAPI = 5942;
                  if (carModel == 15) carModelAPI = 5866;

                  _selectedLocatioNpeugeot = newValue;
                }
                if (choice == 57) {
                  car = 5776;
                  if (carModel == 0) carModelAPI = 5782;

                  _selectedLocatioNpontiac = newValue;
                }
                if (choice == 58) {
                  car = 1005;
                  if (carModel == 0) carModelAPI = 5846;
                  if (carModel == 1) carModelAPI = 5844;
                  if (carModel == 2) carModelAPI = 1007;
                  if (carModel == 3) carModelAPI = 1011;
                  if (carModel == 4) carModelAPI = 5840;
                  if (carModel == 5) carModelAPI = 5836;
                  if (carModel == 6) carModelAPI = 5826;
                  if (carModel == 7) carModelAPI = 5820;
                  if (carModel == 8) carModelAPI = 1009;

                  _selectedLocatioNporsche = newValue;
                }
                if (choice == 59) {
                  car = 5856;
                  if (carModel == 0) carModelAPI = 5860;

                  _selectedLocatioNproton = newValue;
                }

                if (choice == 60) {
                  car = 1177;
                  if (carModel == 0) carModelAPI = 9079;
                  if (carModel == 1) carModelAPI = 5902;
                  if (carModel == 2) carModelAPI = 5908;
                  if (carModel == 3) carModelAPI = 1277;
                  if (carModel == 4) carModelAPI = 1279;
                  if (carModel == 5) carModelAPI = 5912;
                  if (carModel == 6) carModelAPI = 5914;
                  if (carModel == 7) carModelAPI = 5916;
                  if (carModel == 8) carModelAPI = 5920;
                  if (carModel == 9) carModelAPI = 5922;
                  if (carModel == 10) carModelAPI = 5928;
                  if (carModel == 11) carModelAPI = 5940;
                  if (carModel == 12) carModelAPI = 5946;
                  if (carModel == 13) carModelAPI = 5952;
                  if (carModel == 14) carModelAPI = 5936;

                  _selectedLocatioNrenault = newValue;
                }
                if (choice == 61) {
                  car = 1179;
                  if (carModel == 0) carModelAPI = 5924;
                  if (carModel == 1) carModelAPI = 5918;
                  if (carModel == 2) carModelAPI = 1301;
                  if (carModel == 3) carModelAPI = 1303;
                  if (carModel == 4) carModelAPI = 5904;
                  if (carModel == 5) carModelAPI = 5900;
                  if (carModel == 6) carModelAPI = 5910;

                  _selectedLocatioNrollsRoyce = newValue;
                }
                if (choice == 62) {
                  car = 5934;
                  if (carModel == 0) carModelAPI = 5944;

                  _selectedLocatioNrover = newValue;
                }
                if (choice == 63) {
                  car = 5950;
                  if (carModel == 0) carModelAPI = 5958;
                  _selectedLocatioNseat = newValue;
                }
                if (choice == 64) {
                  car = 1181;
                  if (carModel == 0) carModelAPI = 5978;
                  if (carModel == 1) carModelAPI = 5984;
                  if (carModel == 2) carModelAPI = 1331;

                  _selectedLocatioNskoda = newValue;
                }
                if (choice == 65) {
                  car = 5968;
                  if (carModel == 0) carModelAPI = 5974;

                  _selectedLocatioNsmart = newValue;
                }
                if (choice == 66) {
                  car = 5998;
                  if (carModel == 0) carModelAPI = 5990;
                  _selectedLocatioNsoueast = newValue;
                }
                if (choice == 67) {
                  car = 5994;
                  if (carModel == 0) carModelAPI = 5998;
                  _selectedLocatioNssangYong = newValue;
                }
                if (choice == 68) {
                  car = 1183;
                  if (carModel == 0) carModelAPI = 6008;
                  if (carModel == 1) carModelAPI = 1348;
                  if (carModel == 2) carModelAPI = 9081;
                  if (carModel == 3) carModelAPI = 1350;
                  if (carModel == 4) carModelAPI = 6012;
                  if (carModel == 5) carModelAPI = 1356;
                  _selectedLocatioNsubaru = newValue;
                }
                if (choice == 69) {
                  car = 1185;
                  if (carModel == 0) carModelAPI = 6122;
                  if (carModel == 1) carModelAPI = 6130;
                  if (carModel == 2) carModelAPI = 1374;
                  if (carModel == 3) carModelAPI = 6136;
                  if (carModel == 4) carModelAPI = 6140;
                  if (carModel == 5) carModelAPI = 1382;
                  if (carModel == 6) carModelAPI = 6144;
                  if (carModel == 7) carModelAPI = 6148;
                  if (carModel == 8) carModelAPI = 6158;
                  if (carModel == 9) carModelAPI = 6166;
                  if (carModel == 10) carModelAPI = 1380;
                  _selectedLocatioNsuzuki = newValue;
                }
                if (choice == 70) {
                  car = 1187;
                  if (carModel == 0) carModelAPI = 6010;
                  if (carModel == 1) carModelAPI = 1404;
                  _selectedLocatioNtata = newValue;
                }
                if (choice == 71) {
                  car = 1189;
                  if (carModel == 0) carModelAPI = 1422;
                  if (carModel == 1) carModelAPI = 1428;
                  if (carModel == 2) carModelAPI = 6016;

                  _selectedLocatioNtesla = newValue;
                }
                if (choice == 72) {
                  car = 927;
                  if (carModel == 0) carModelAPI = 6258;
                  if (carModel == 1) carModelAPI = 929;
                  if (carModel == 2) carModelAPI = 6254;
                  if (carModel == 3) carModelAPI = 6254;
                  if (carModel == 4) carModelAPI = 933;
                  if (carModel == 5) carModelAPI = 6250;
                  if (carModel == 6) carModelAPI = 6244;
                  if (carModel == 7) carModelAPI = 6242;
                  if (carModel == 8) carModelAPI = 6238;
                  if (carModel == 9) carModelAPI = 6236;
                  if (carModel == 10) carModelAPI = 6228;
                  if (carModel == 11) carModelAPI = 6222;
                  if (carModel == 12) carModelAPI = 6216;
                  if (carModel == 13) carModelAPI = 6212;
                  if (carModel == 14) carModelAPI = 6210;
                  if (carModel == 15) carModelAPI = 6208;
                  if (carModel == 16) carModelAPI = 6206;
                  if (carModel == 17) carModelAPI = 6200;
                  if (carModel == 18) carModelAPI = 6198;
                  if (carModel == 19) carModelAPI = 6194;
                  if (carModel == 20) carModelAPI = 6192;
                  if (carModel == 21) carModelAPI = 6019;
                  if (carModel == 22) carModelAPI = 6184;
                  if (carModel == 23) carModelAPI = 6180;
                  if (carModel == 24) carModelAPI = 6176;
                  if (carModel == 25) carModelAPI = 6172;
                  if (carModel == 26) carModelAPI = 6170;
                  if (carModel == 27) carModelAPI = 6164;
                  if (carModel == 28) carModelAPI = 6160;
                  if (carModel == 29) carModelAPI = 6154;
                  if (carModel == 30) carModelAPI = 6152;
                  if (carModel == 31) carModelAPI = 6146;
                  if (carModel == 32) carModelAPI = 6202;
                  _selectedLocatioNtoyota = newValue;
                }
                // if (choice == 75) {
                //   _selectedLocatioNuaz = newValue;
                //   }
                if (choice == 73) {
                  car = 1013;
                  if (carModel == 0) carModelAPI = 6138;
                  if (carModel == 1) carModelAPI = 1015;
                  if (carModel == 2) carModelAPI = 6142;
                  if (carModel == 3) carModelAPI = 1017;
                  if (carModel == 4) carModelAPI = 6150;
                  if (carModel == 5) carModelAPI = 6156;
                  if (carModel == 6) carModelAPI = 1019;
                  if (carModel == 7) carModelAPI = 6162;
                  if (carModel == 8) carModelAPI = 6168;
                  if (carModel == 9) carModelAPI = 6174;
                  if (carModel == 10) carModelAPI = 6178;
                  if (carModel == 11) carModelAPI = 6182;
                  if (carModel == 12) carModelAPI = 6188;
                  if (carModel == 13) carModelAPI = 6169;
                  if (carModel == 14) carModelAPI = 6260;
                  if (carModel == 15) carModelAPI = 6204;
                  if (carModel == 16) carModelAPI = 6214;
                  if (carModel == 17) carModelAPI = 6266;
                  if (carModel == 18) carModelAPI = 6248;
                  if (carModel == 19) carModelAPI = 6232;
                  _selectedLocatioNvolkswagen = newValue;
                }
                if (choice == 74) {
                  car = 1191;
                  if (carModel == 0) carModelAPI = 1470;
                  if (carModel == 1) carModelAPI = 6230;
                  if (carModel == 2) carModelAPI = 6234;
                  if (carModel == 3) carModelAPI = 6240;
                  if (carModel == 4) carModelAPI = 6246;
                  if (carModel == 5) carModelAPI = 1468;
                  _selectedLocatioNvolvo = newValue;
                }
              }
              /////////////////////////////////////////////////////
              if (translator.currentLanguage == 'en') {
                print("ok");
                if (choice == 0) {
                  car = 1021;
                  if (carModel == 0) carModelAPI = 3925;
                  if (carModel == 1) carModelAPI = 3927;
                  if (carModel == 2) carModelAPI = 3933;
                  if (carModel == 3) carModelAPI = 3929;
                  if (carModel == 4) carModelAPI = 3931;
                  if (carModel == 5) carModelAPI = 3935;
                  if (carModel == 6) carModelAPI = 3939;
                  if (carModel == 7) carModelAPI = 3943;
                  _selectedLocatioNalfaRomeo = newValue;
                }
                if (choice == 1) {
                  car = 1023;
                  if (carModel == 0) carModelAPI = 1105;
                  if (carModel == 1) carModelAPI = 4013;
                  if (carModel == 2) carModelAPI = 4017;
                  if (carModel == 3) carModelAPI = 4027;
                  if (carModel == 4) carModelAPI = 1107;
                  if (carModel == 5) carModelAPI = 4019;
                  if (carModel == 6) carModelAPI = 1109;
                  if (carModel == 7) carModelAPI = 4023;
                  if (carModel == 8) carModelAPI = 4025;
                  _selectedLocatioNastonMartin = newValue;
                }
                if (choice == 2) {
                  car = 827;
                  if (carModel == 0) carModelAPI = 3899;
                  if (carModel == 1) carModelAPI = 859;
                  if (carModel == 2) carModelAPI = 861;
                  if (carModel == 3) carModelAPI = 863;
                  if (carModel == 4) carModelAPI = 3123;
                  if (carModel == 5) carModelAPI = 3129;
                  if (carModel == 6) carModelAPI = 3131;
                  if (carModel == 7) carModelAPI = 3145;
                  if (carModel == 8) carModelAPI = 3147;
                  if (carModel == 9) carModelAPI = 3149;
                  if (carModel == 10) carModelAPI = 3153;
                  if (carModel == 11) carModelAPI = 3165;
                  if (carModel == 12) carModelAPI = 3903;
                  if (carModel == 13) carModelAPI = 3201;
                  if (carModel == 14) carModelAPI = 3905;
                  if (carModel == 15) carModelAPI = 3203;
                  if (carModel == 16) carModelAPI = 3205;
                  if (carModel == 17) carModelAPI = 3911;
                  if (carModel == 18) carModelAPI = 3209;
                  if (carModel == 19) carModelAPI = 3213;
                  _selectedLocatioNaudi = newValue;
                }
                if (choice == 3) {
                  car = 831;
                  if (carModel == 0) carModelAPI = 869;
                  if (carModel == 1) carModelAPI = 865;
                  if (carModel == 2) carModelAPI = 3311;
                  if (carModel == 3) carModelAPI = 3313;
                  if (carModel == 4) carModelAPI = 3313;
                  if (carModel == 5) carModelAPI = 3315;
                  if (carModel == 6) carModelAPI = 3319;
                  if (carModel == 7) carModelAPI = 3321;
                  if (carModel == 8) carModelAPI = 3325;
                  if (carModel == 9) carModelAPI = 3533;
                  if (carModel == 10) carModelAPI = 3655;
                  if (carModel == 11) carModelAPI = 3457;
                  if (carModel == 12) carModelAPI = 3329;
                  if (carModel == 13) carModelAPI = 3643;
                  if (carModel == 14) carModelAPI = 3331;
                  if (carModel == 15) carModelAPI = 3645;
                  if (carModel == 16) carModelAPI = 3333;
                  if (carModel == 17) carModelAPI = 3803;
                  if (carModel == 18) carModelAPI = 3465;
                  if (carModel == 19) carModelAPI = 3473;
                  if (carModel == 20) carModelAPI = 3499;
                  if (carModel == 21) carModelAPI = 3505;
                  if (carModel == 22) carModelAPI = 3513;
                  if (carModel == 23) carModelAPI = 3521;
                  if (carModel == 24) carModelAPI = 3525;
                  if (carModel == 25) carModelAPI = 3649;
                  if (carModel == 26) carModelAPI = 3529;
                  if (carModel == 27) carModelAPI = 3651;
                  _selectedLocatioNbmw = newValue;
                }
                if (choice == 4) {
                  car = 1025;
                  if (carModel == 0) carModelAPI = 3827;
                  if (carModel == 1) carModelAPI = 3855;
                  if (carModel == 2) carModelAPI = 1233;
                  if (carModel == 3) carModelAPI = 1239;
                  if (carModel == 4) carModelAPI = 1241;
                  if (carModel == 5) carModelAPI = 3545;
                  if (carModel == 6) carModelAPI = 3537;
                  if (carModel == 7) carModelAPI = 3541;
                  if (carModel == 8) carModelAPI = 3895;
                  _selectedLocatioNbentley = newValue;
                }
                if (choice == 5) {
                  car = 3937;
                  if (carModel == 0) carModelAPI = 3953;
                  if (carModel == 1) carModelAPI = 3963;
                  _selectedLocatioNborgward = newValue;
                }
                if (choice == 6) {
                  car = 4005;
                  if (carModel == 0) carModelAPI = 4021;
                  _selectedLocatioNbrilliance = newValue;
                }
                if (choice == 7) {
                  car = 4047;
                  if (carModel == 0) carModelAPI = 4057;
                  if (carModel == 1) carModelAPI = 4063;
                  if (carModel == 2) carModelAPI = 4073;
                  if (carModel == 3) carModelAPI = 4075;
                  _selectedLocatioNbugatti = newValue;
                }
                if (choice == 8) {
                  car = 4083;
                  if (carModel == 0) carModelAPI = 4087;
                  _selectedLocatioNcmc = newValue;
                }
                if (choice == 9) {
                  car = 1027;
                  if (carModel == 0) carModelAPI = 4113;
                  if (carModel == 1) carModelAPI = 4117;
                  if (carModel == 2) carModelAPI = 3551;
                  if (carModel == 3) carModelAPI = 1255;
                  if (carModel == 4) carModelAPI = 4119;
                  if (carModel == 5) carModelAPI = 1257;
                  if (carModel == 6) carModelAPI = 3567;
                  if (carModel == 7) carModelAPI = 4129;
                  if (carModel == 8) carModelAPI = 3571;
                  if (carModel == 9) carModelAPI = 4121;
                  if (carModel == 10) carModelAPI = 4123;
                  if (carModel == 11) carModelAPI = 4125;
                  if (carModel == 12) carModelAPI = 4127;
                  if (carModel == 13) carModelAPI = 3613;
                  _selectedLocatioNcadillac = newValue;
                }
                if (choice == 10) {
                  car = 1029;
                  if (carModel == 0) carModelAPI = 4105;
                  if (carModel == 1) carModelAPI = 4107;
                  if (carModel == 2) carModelAPI = 1283;
                  if (carModel == 3) carModelAPI = 4111;
                  if (carModel == 4) carModelAPI = 4115;
                  _selectedLocatioNchangan = newValue;
                }
                if (choice == 11) {
                  car = 833;
                  if (carModel == 0) carModelAPI = 4169;
                  if (carModel == 1) carModelAPI = 4171;
                  if (carModel == 2) carModelAPI = 4173;
                  if (carModel == 3) carModelAPI = 889;
                  if (carModel == 4) carModelAPI = 4175;
                  if (carModel == 5) carModelAPI = 891;
                  if (carModel == 6) carModelAPI = 893;
                  if (carModel == 7) carModelAPI = 4177;
                  if (carModel == 8) carModelAPI = 4179;
                  if (carModel == 9) carModelAPI = 4181;
                  if (carModel == 10) carModelAPI = 4183;
                  if (carModel == 11) carModelAPI = 4185;
                  if (carModel == 12) carModelAPI = 4187;
                  if (carModel == 13) carModelAPI = 4189;
                  if (carModel == 14) carModelAPI = 4191;
                  if (carModel == 15) carModelAPI = 4193;
                  if (carModel == 16) carModelAPI = 4195;
                  if (carModel == 17) carModelAPI = 4219;
                  if (carModel == 18) carModelAPI = 4197;
                  if (carModel == 19) carModelAPI = 4201;
                  if (carModel == 20) carModelAPI = 4203;
                  if (carModel == 21) carModelAPI = 4199;
                  if (carModel == 22) carModelAPI = 4207;
                  if (carModel == 23) carModelAPI = 4209;
                  if (carModel == 24) carModelAPI = 4211;
                  if (carModel == 25) carModelAPI = 4213;
                  if (carModel == 26) carModelAPI = 4215;
                  if (carModel == 27) carModelAPI = 4217;
                  _selectedLocatioNchevrolet = newValue;
                }
                if (choice == 12) {
                  car = 1031;
                  if (carModel == 0) carModelAPI = 1338;
                  if (carModel == 1) carModelAPI = 1344;
                  if (carModel == 2) carModelAPI = 4281;
                  if (carModel == 3) carModelAPI = 4273;
                  if (carModel == 4) carModelAPI = 4275;
                  if (carModel == 5) carModelAPI = 4271;
                  if (carModel == 6) carModelAPI = 4277;
                  if (carModel == 7) carModelAPI = 4279;
                  _selectedLocatioNchrysler = newValue;
                }
                if (choice == 13) {
                  car = 1033;
                  if (carModel == 0) carModelAPI = 4297;
                  if (carModel == 1) carModelAPI = 4301;
                  if (carModel == 2) carModelAPI = 4303;
                  if (carModel == 3) carModelAPI = 1360;
                  _selectedLocatioNcitroen = newValue;
                }
                if (choice == 14) {
                  car = 4315;
                  if (carModel == 0) carModelAPI = 4333;
                  if (carModel == 1) carModelAPI = 4337;
                  if (carModel == 2) carModelAPI = 4323;
                  _selectedLocatioNdaihatsu = newValue;
                }
                if (choice == 15) {
                  car = 1035;
                  if (carModel == 0) carModelAPI = 4319;
                  if (carModel == 1) carModelAPI = 4321;
                  if (carModel == 2) carModelAPI = 4325;
                  if (carModel == 3) carModelAPI = 1386;
                  if (carModel == 4) carModelAPI = 1392;
                  if (carModel == 5) carModelAPI = 4327;
                  if (carModel == 6) carModelAPI = 4329;
                  if (carModel == 7) carModelAPI = 4331;
                  if (carModel == 8) carModelAPI = 4335;
                  if (carModel == 9) carModelAPI = 4339;
                  if (carModel == 10) carModelAPI = 4347;
                  if (carModel == 11) carModelAPI = 4343;
                  if (carModel == 12) carModelAPI = 4345;
                  _selectedLocatioNdodge = newValue;
                }
                if (choice == 16) {
                  car = 1037;
                  if (carModel == 0) carModelAPI = 4367;
                  if (carModel == 1) carModelAPI = 4369;
                  if (carModel == 2) carModelAPI = 1408;
                  if (carModel == 3) carModelAPI = 4373;
                  if (carModel == 4) carModelAPI = 4375;
                  if (carModel == 5) carModelAPI = 4377;
                  if (carModel == 6) carModelAPI = 4381;
                  if (carModel == 7) carModelAPI = 4383;
                  if (carModel == 8) carModelAPI = 4385;
                  if (carModel == 9) carModelAPI = 4389;
                  if (carModel == 10) carModelAPI = 1410;
                  if (carModel == 11) carModelAPI = 4391;
                  if (carModel == 12) carModelAPI = 4395;
                  if (carModel == 13) carModelAPI = 4397;
                  if (carModel == 14) carModelAPI = 4399;
                  if (carModel == 15) carModelAPI = 4401;
                  if (carModel == 16) carModelAPI = 4403;
                  if (carModel == 17) carModelAPI = 4405;
                  if (carModel == 18) carModelAPI = 4407;
                  if (carModel == 19) carModelAPI = 4411;
                  if (carModel == 20) carModelAPI = 4409;
                  if (carModel == 21) carModelAPI = 4413;
                  if (carModel == 22) carModelAPI = 4415;
                  if (carModel == 23) carModelAPI = 4423;
                  if (carModel == 24) carModelAPI = 4417;
                  if (carModel == 25) carModelAPI = 4419;
                  if (carModel == 26) carModelAPI = 4421;
                  _selectedLocatioNferrari = newValue;
                }
                if (choice == 17) {
                  car = 1039;
                  if (carModel == 0) carModelAPI = 1432;
                  if (carModel == 1) carModelAPI = 1434;
                  if (carModel == 2) carModelAPI = 4435;
                  if (carModel == 3) carModelAPI = 4437;
                  if (carModel == 4) carModelAPI = 4441;
                  _selectedLocatioNfiat = newValue;
                }
                /* if (choice == 18) {
                _selectedLocatioNfisker = newValue;
              }*/
                if (choice == 18) {
                  car = 835;
                  if (carModel == 0) carModelAPI = 4493;
                  if (carModel == 1) carModelAPI = 4495;
                  if (carModel == 2) carModelAPI = 907;
                  if (carModel == 3) carModelAPI = 909;
                  if (carModel == 4) carModelAPI = 911;
                  if (carModel == 5) carModelAPI = 4497;
                  if (carModel == 6) carModelAPI = 4499;
                  if (carModel == 7) carModelAPI = 4501;
                  if (carModel == 8) carModelAPI = 4503;
                  if (carModel == 9) carModelAPI = 4505;
                  if (carModel == 10) carModelAPI = 4507;
                  if (carModel == 11) carModelAPI = 4509;
                  if (carModel == 12) carModelAPI = 4511;
                  if (carModel == 13) carModelAPI = 4513;
                  if (carModel == 14) carModelAPI = 4515;
                  if (carModel == 15) carModelAPI = 4519;
                  if (carModel == 16) carModelAPI = 4521;
                  if (carModel == 17) carModelAPI = 4541;
                  if (carModel == 18) carModelAPI = 4523;
                  if (carModel == 19) carModelAPI = 4527;
                  if (carModel == 20) carModelAPI = 4529;
                  if (carModel == 21) carModelAPI = 4531;
                  if (carModel == 22) carModelAPI = 4533;
                  if (carModel == 23) carModelAPI = 4535;
                  if (carModel == 24) carModelAPI = 4537;
                  _selectedLocatioNford = newValue;
                }
                if (choice == 19) {
                  car = 4517;
                  if (carModel == 0) carModelAPI = 4555;
                  if (carModel == 1) carModelAPI = 4539;
                  _selectedLocatioNfoton = newValue;
                }
                if (choice == 20) {
                  car = 4595;
                  if (carModel == 0) carModelAPI = 4603;
                  if (carModel == 1) carModelAPI = 4605;
                  _selectedLocatioNgac = newValue;
                }
                if (choice == 21) {
                  car = 1041;
                  if (carModel == 0) carModelAPI = 1454;
                  if (carModel == 1) carModelAPI = 4611;
                  if (carModel == 2) carModelAPI = 4613;
                  if (carModel == 3) carModelAPI = 4627;
                  if (carModel == 4) carModelAPI = 1458;
                  if (carModel == 5) carModelAPI = 4619;
                  if (carModel == 6) carModelAPI = 4617;
                  if (carModel == 7) carModelAPI = 4623;
                  if (carModel == 8) carModelAPI = 4625;
                  if (carModel == 9) carModelAPI = 4621;
                  _selectedLocatioNgmc = newValue;
                }
                if (choice == 22) {
                  car = 1043;
                  if (carModel == 0) carModelAPI = 4629;
                  if (carModel == 1) carModelAPI = 1474;
                  if (carModel == 2) carModelAPI = 4637;
                  if (carModel == 3) carModelAPI = 4645;
                  _selectedLocatioNgeely = newValue;
                }
                if (choice == 23) {
                  car = 4665;
                  if (carModel == 0) carModelAPI = 4691;
                  if (carModel == 1) carModelAPI = 4683;
                  if (carModel == 2) carModelAPI = 4687;
                  if (carModel == 3) carModelAPI = 4681;
                  _selectedLocatioNgenesis = newValue;
                }
                /* if (choice == 24) {
                _selectedLocatioNgrandTiger = newValue;
              }*/
                /*if (choice == 24) {
                _selectedLocatioNgreatWall = newValue;
              }*/
                if (choice == 24) {
                  car = 4722;
                  if (carModel == 0) carModelAPI = 4733;
                  if (carModel == 1) carModelAPI = 4735;
                  _selectedLocatioNhaval = newValue;
                }
                if (choice == 25) {
                  car = 1045;
                  if (carModel == 0) carModelAPI = 1482;
                  if (carModel == 1) carModelAPI = 4671;
                  if (carModel == 2) carModelAPI = 4673;
                  if (carModel == 3) carModelAPI = 1488;
                  if (carModel == 4) carModelAPI = 4675;
                  if (carModel == 5) carModelAPI = 4677;
                  if (carModel == 6) carModelAPI = 4679;
                  if (carModel == 7) carModelAPI = 4685;
                  if (carModel == 8) carModelAPI = 4689;
                  if (carModel == 9) carModelAPI = 4693;
                  if (carModel == 10) carModelAPI = 4697;
                  if (carModel == 11) carModelAPI = 4695;
                  _selectedLocatioNhonda = newValue;
                }
                /* if (choice == 26) {
                car = 1047;
                _selectedLocatioNhongqi = newValue;
              }*/
                if (choice == 26) {
                  car = 1049;
                  if (carModel == 0) carModelAPI = 4774;
                  if (carModel == 1) carModelAPI = 4768;
                  if (carModel == 2) carModelAPI = 1193;
                  _selectedLocatioNhummer = newValue;
                }
                if (choice == 27) {
                  car = 837;
                  if (carModel == 0) carModelAPI = 871;
                  if (carModel == 1) carModelAPI = 4740;
                  if (carModel == 2) carModelAPI = 873;
                  if (carModel == 3) carModelAPI = 4744;
                  if (carModel == 4) carModelAPI = 4746;
                  if (carModel == 5) carModelAPI = 875;
                  if (carModel == 6) carModelAPI = 4748;
                  if (carModel == 7) carModelAPI = 4750;
                  if (carModel == 8) carModelAPI = 4752;
                  if (carModel == 9) carModelAPI = 4754;
                  if (carModel == 10) carModelAPI = 4756;
                  if (carModel == 11) carModelAPI = 4776;
                  if (carModel == 12) carModelAPI = 4778;
                  if (carModel == 13) carModelAPI = 4758;
                  if (carModel == 14) carModelAPI = 4780;
                  if (carModel == 15) carModelAPI = 4760;
                  if (carModel == 16) carModelAPI = 4762;
                  if (carModel == 17) carModelAPI = 4764;

                  if (carModel == 18) carModelAPI = 4766;
                  if (carModel == 19) carModelAPI = 4770;
                  if (carModel == 20) carModelAPI = 4772;
                  _selectedLocatioNhyundai = newValue;
                }
                if (choice == 28) {
                  car = 1051;
                  if (carModel == 0) carModelAPI = 4822;
                  if (carModel == 1) carModelAPI = 4824;
                  if (carModel == 2) carModelAPI = 1209;
                  if (carModel == 3) carModelAPI = 1215;
                  if (carModel == 4) carModelAPI = 4826;
                  if (carModel == 5) carModelAPI = 1217;
                  if (carModel == 6) carModelAPI = 4848;
                  if (carModel == 7) carModelAPI = 4828;
                  if (carModel == 8) carModelAPI = 4830;
                  if (carModel == 9) carModelAPI = 4832;
                  if (carModel == 10) carModelAPI = 4834;
                  if (carModel == 11) carModelAPI = 4836;
                  if (carModel == 12) carModelAPI = 4838;
                  if (carModel == 13) carModelAPI = 4840;
                  if (carModel == 14) carModelAPI = 4842;
                  if (carModel == 15) carModelAPI = 4880;
                  if (carModel == 16) carModelAPI = 4846;
                  _selectedLocatioNinfiniti = newValue;
                }
                if (choice == 29) {
                  car = 4882;
                  if (carModel == 0) carModelAPI = 4888;
                  if (carModel == 1) carModelAPI = 4886;
                  _selectedLocatioNisuzu = newValue;
                }
                if (choice == 30) {
                  car = 1053;
                  if (carModel == 0) carModelAPI = 1247;
                  if (carModel == 1) carModelAPI = 4894;
                  _selectedLocatioNjAC = newValue;
                }
                if (choice == 31) {
                  car = 1055;
                  if (carModel == 0) carModelAPI = 4898;
                  if (carModel == 1) carModelAPI = 4900;
                  if (carModel == 2) carModelAPI = 4902;
                  if (carModel == 3) carModelAPI = 4920;
                  if (carModel == 4) carModelAPI = 4904;
                  if (carModel == 5) carModelAPI = 1263;
                  if (carModel == 6) carModelAPI = 1265;
                  if (carModel == 7) carModelAPI = 1271;
                  if (carModel == 8) carModelAPI = 4908;
                  if (carModel == 9) carModelAPI = 4910;
                  if (carModel == 10) carModelAPI = 4912;
                  if (carModel == 11) carModelAPI = 4914;
                  if (carModel == 12) carModelAPI = 4918;
                  if (carModel == 13) carModelAPI = 4906;
                  if (carModel == 14) carModelAPI = 4916;
                  _selectedLocatioNjaguar = newValue;
                }
                if (choice == 32) {
                  car = 1057;
                  if (carModel == 0) carModelAPI = 1289;
                  if (carModel == 1) carModelAPI = 1297;
                  if (carModel == 2) carModelAPI = 1291;

                  if (carModel == 3) carModelAPI = 4946;
                  if (carModel == 4) carModelAPI = 4948;
                  if (carModel == 5) carModelAPI = 4950;

                  if (carModel == 6) carModelAPI = 4958;
                  if (carModel == 7) carModelAPI = 4952;
                  if (carModel == 8) carModelAPI = 4954;
                  if (carModel == 9) carModelAPI = 4956;
                  _selectedLocatioNjeep = newValue;
                }
                if (choice == 33) {
                  car = 4960;
                  if (carModel == 0) carModelAPI = 4966;
                  if (carModel == 1) carModelAPI = 4974;
                  _selectedLocatioNjetour = newValue;
                }
                if (choice == 34) {
                  car = 1059;
                  if (carModel == 0) carModelAPI = 1307;
                  if (carModel == 1) carModelAPI = 4986;
                  if (carModel == 2) carModelAPI = 1313;
                  if (carModel == 3) carModelAPI = 4988;
                  if (carModel == 4) carModelAPI = 4990;
                  if (carModel == 5) carModelAPI = 4992;
                  if (carModel == 6) carModelAPI = 4994;
                  if (carModel == 7) carModelAPI = 4996;
                  if (carModel == 8) carModelAPI = 5020;
                  if (carModel == 9) carModelAPI = 4998;
                  if (carModel == 10) carModelAPI = 5000;
                  if (carModel == 11) carModelAPI = 5002;
                  if (carModel == 12) carModelAPI = 5004;
                  if (carModel == 13) carModelAPI = 5006;

                  if (carModel == 14) carModelAPI = 5008;
                  if (carModel == 15) carModelAPI = 5010;
                  if (carModel == 16) carModelAPI = 5012;

                  if (carModel == 17) carModelAPI = 5014;
                  if (carModel == 18) carModelAPI = 5016;
                  if (carModel == 19) carModelAPI = 5018;
                  _selectedLocatioNkia = newValue;
                }
                /*if (choice == 36) {
                _selectedLocatioNkingLong = newValue;
              }*/
                if (choice == 35) {
                  car = 5032;
                  if (carModel == 0) carModelAPI = 5036;
                  if (carModel == 1) carModelAPI = 5038;
                  if (carModel == 2) carModelAPI = 5040;
                  if (carModel == 3) carModelAPI = 5044;
                  if (carModel == 4) carModelAPI = 5042;
                  _selectedLocatioNlamborghini = newValue;
                }
                if (choice == 36) {
                  car = 5076;
                  if (carModel == 0) carModelAPI = 5080;
                  _selectedLocatioNlancia = newValue;
                }
                if (choice == 37) {
                  car = 839;
                  if (carModel == 0) carModelAPI = 883;
                  if (carModel == 1) carModelAPI = 885;
                  if (carModel == 2) carModelAPI = 5086;
                  if (carModel == 3) carModelAPI = 5088;
                  if (carModel == 4) carModelAPI = 5090;
                  if (carModel == 5) carModelAPI = 887;
                  if (carModel == 6) carModelAPI = 5094;
                  if (carModel == 7) carModelAPI = 5098;
                  if (carModel == 8) carModelAPI = 5100;
                  if (carModel == 9) carModelAPI = 5096;
                  _selectedLocatioNlandRover = newValue;
                }
                if (choice == 38) {
                  car = 1061;
                  if (carModel == 0) carModelAPI = 1362;
                  if (carModel == 1) carModelAPI = 1368;
                  if (carModel == 2) carModelAPI = 1370;
                  if (carModel == 3) carModelAPI = 5120;
                  if (carModel == 4) carModelAPI = 5122;
                  if (carModel == 5) carModelAPI = 5124;
                  if (carModel == 6) carModelAPI = 5126;
                  if (carModel == 7) carModelAPI = 5128;
                  if (carModel == 8) carModelAPI = 5130;
                  if (carModel == 9) carModelAPI = 5132;
                  if (carModel == 10) carModelAPI = 5134;
                  if (carModel == 11) carModelAPI = 5136;
                  if (carModel == 12) carModelAPI = 5138;
                  if (carModel == 13) carModelAPI = 5146;
                  if (carModel == 14) carModelAPI = 5140;
                  if (carModel == 15) carModelAPI = 5142;
                  if (carModel == 16) carModelAPI = 5144;
                  _selectedLocatioNlexus = newValue;
                }
                if (choice == 39) {
                  car = 1063;
                  if (carModel == 0) carModelAPI = 5190;
                  if (carModel == 1) carModelAPI = 1394;
                  if (carModel == 2) carModelAPI = 1400;
                  if (carModel == 3) carModelAPI = 5198;
                  if (carModel == 4) carModelAPI = 5202;
                  if (carModel == 5) carModelAPI = 5204;
                  if (carModel == 6) carModelAPI = 5208;
                  if (carModel == 7) carModelAPI = 5214;
                  if (carModel == 8) carModelAPI = 5210;
                  if (carModel == 9) carModelAPI = 5194;
                  _selectedLocatioNlincoln = newValue;
                }
                if (choice == 40) {
                  car = 5186;
                  if (carModel == 0) carModelAPI = 5188;
                  if (carModel == 1) carModelAPI = 5192;
                  _selectedLocatioNlotus = newValue;
                }
                if (choice == 41) {
                  car = 5212;
                  if (carModel == 0) carModelAPI = 5220;
                  if (carModel == 1) carModelAPI = 5222;
                  if (carModel == 2) carModelAPI = 5224;
                  if (carModel == 3) carModelAPI = 5228;
                  if (carModel == 4) carModelAPI = 5230;
                  if (carModel == 5) carModelAPI = 5232;
                  if (carModel == 6) carModelAPI = 5234;
                  if (carModel == 7) carModelAPI = 5236;
                  if (carModel == 8) carModelAPI = 5226;
                  _selectedLocatioNmg = newValue;
                }
                if (choice == 42) {
                  car = 1065;
                  if (carModel == 0) carModelAPI = 1416;
                  if (carModel == 1) carModelAPI = 1418;
                  if (carModel == 2) carModelAPI = 5274;
                  if (carModel == 3) carModelAPI = 5278;
                  if (carModel == 4) carModelAPI = 5270;
                  _selectedLocatioNmINI = newValue;
                }
                if (choice == 43) {
                  car = 5282;
                  if (carModel == 0) carModelAPI = 5286;
                  _selectedLocatioNmahindra = newValue;
                }
                if (choice == 44) {
                  car = 1067;
                  if (carModel == 0) carModelAPI = 1440;
                  if (carModel == 1) carModelAPI = 5290;
                  if (carModel == 2) carModelAPI = 5296;
                  if (carModel == 3) carModelAPI = 1442;
                  if (carModel == 4) carModelAPI = 5305;
                  if (carModel == 5) carModelAPI = 5301;
                  _selectedLocatioNmaserati = newValue;
                }
                if (choice == 45) {
                  car = 5309;
                  if (carModel == 0) carModelAPI = 5313;
                  if (carModel == 1) carModelAPI = 5317;
                  if (carModel == 2) carModelAPI = 5315;
                  if (carModel == 3) carModelAPI = 5319;
                  _selectedLocatioNmaybach = newValue;
                }
                if (choice == 46) {
                  car = 1069;
                  if (carModel == 0) carModelAPI = 5330;
                  if (carModel == 1) carModelAPI = 1446;
                  if (carModel == 2) carModelAPI = 1452;
                  if (carModel == 3) carModelAPI = 5332;
                  if (carModel == 4) carModelAPI = 5335;
                  if (carModel == 5) carModelAPI = 5337;
                  if (carModel == 6) carModelAPI = 5339;
                  if (carModel == 7) carModelAPI = 5343;
                  if (carModel == 8) carModelAPI = 5341;
                  _selectedLocatioNmazda = newValue;
                }
                if (choice == 47) {
                  car = 1071;
                  if (carModel == 0) carModelAPI = 1464;
                  if (carModel == 1) carModelAPI = 5359;
                  if (carModel == 2) carModelAPI = 5361;
                  if (carModel == 3) carModelAPI = 5363;
                  if (carModel == 4) carModelAPI = 5365;
                  if (carModel == 5) carModelAPI = 5369;
                  if (carModel == 6) carModelAPI = 5371;
                  if (carModel == 7) carModelAPI = 5373;
                  if (carModel == 8) carModelAPI = 5375;
                  if (carModel == 9) carModelAPI = 5367;
                  _selectedLocatioNmcLaren = newValue;
                }
                if (choice == 48) {
                  car = 841;
                  if (carModel == 0) carModelAPI = 5380;
                  if (carModel == 1) carModelAPI = 5382;
                  if (carModel == 2) carModelAPI = 8384;
                  if (carModel == 3) carModelAPI = 901;
                  if (carModel == 4) carModelAPI = 5386;
                  if (carModel == 5) carModelAPI = 903;
                  if (carModel == 6) carModelAPI = 905;
                  if (carModel == 7) carModelAPI = 5388;
                  if (carModel == 8) carModelAPI = 5390;
                  if (carModel == 9) carModelAPI = 5392;
                  if (carModel == 10) carModelAPI = 5394;
                  if (carModel == 11) carModelAPI = 5396;
                  if (carModel == 12) carModelAPI = 5400;
                  if (carModel == 13) carModelAPI = 5402;
                  if (carModel == 14) carModelAPI = 5404;
                  if (carModel == 15) carModelAPI = 5406;
                  if (carModel == 16) carModelAPI = 5408;
                  if (carModel == 17) carModelAPI = 5410;
                  if (carModel == 18) carModelAPI = 5412;
                  if (carModel == 19) carModelAPI = 5416;
                  if (carModel == 20) carModelAPI = 5418;
                  if (carModel == 21) carModelAPI = 5420;
                  if (carModel == 22) carModelAPI = 5422;
                  if (carModel == 23) carModelAPI = 5424;
                  if (carModel == 24) carModelAPI = 5426;
                  if (carModel == 25) carModelAPI = 5430;
                  if (carModel == 26) carModelAPI = 5432;
                  if (carModel == 27) carModelAPI = 5434;
                  if (carModel == 28) carModelAPI = 5436;
                  if (carModel == 29) carModelAPI = 5438;
                  if (carModel == 30) carModelAPI = 5440;
                  if (carModel == 31) carModelAPI = 5444;
                  if (carModel == 32) carModelAPI = 5446;

                  if (carModel == 33) carModelAPI = 5448;
                  if (carModel == 34) carModelAPI = 5450;

                  if (carModel == 35) carModelAPI = 5452;
                  if (carModel == 36) carModelAPI = 5490;
                  if (carModel == 37) carModelAPI = 5454;
                  if (carModel == 38) carModelAPI = 5456;
                  if (carModel == 39) carModelAPI = 5458;
                  if (carModel == 40) carModelAPI = 5460;
                  if (carModel == 41) carModelAPI = 5464;
                  if (carModel == 42) carModelAPI = 5466;
                  if (carModel == 43) carModelAPI = 5474;
                  if (carModel == 44) carModelAPI = 5476;
                  if (carModel == 45) carModelAPI = 5478;
                  if (carModel == 46) carModelAPI = 5480;
                  if (carModel == 47) carModelAPI = 5482;

                  if (carModel == 48) carModelAPI = 5484;
                  if (carModel == 49) carModelAPI = 5486;
                  if (carModel == 50) carModelAPI = 5488;
                  _selectedLocatioNmercedesBenz = newValue;
                }
                if (choice == 49) {
                  car = 1167;
                  if (carModel == 0) carModelAPI = 5590;
                  if (carModel == 1) carModelAPI = 5592;
                  if (carModel == 2) carModelAPI = 1490;
                  _selectedLocatioNmercury = newValue;
                }
                if (choice == 50) {
                  car = 843;
                  if (carModel == 0) carModelAPI = 913;
                  if (carModel == 1) carModelAPI = 915;
                  if (carModel == 2) carModelAPI = 917;
                  if (carModel == 3) carModelAPI = 5596;
                  if (carModel == 4) carModelAPI = 5598;
                  if (carModel == 5) carModelAPI = 5600;
                  if (carModel == 6) carModelAPI = 5602;
                  if (carModel == 7) carModelAPI = 5604;
                  if (carModel == 8) carModelAPI = 5606;
                  if (carModel == 9) carModelAPI = 5608;
                  if (carModel == 10) carModelAPI = 5610;
                  if (carModel == 11) carModelAPI = 5614;
                  if (carModel == 12) carModelAPI = 5616;
                  if (carModel == 13) carModelAPI = 5618;
                  if (carModel == 14) carModelAPI = 5620;
                  if (carModel == 15) carModelAPI = 5622;
                  if (carModel == 16) carModelAPI = 5624;
                  if (carModel == 17) carModelAPI = 5628;
                  if (carModel == 18) carModelAPI = 5612;
                  _selectedLocatioNmitsubishi = newValue;
                }
                if (choice == 51) {
                  car = 5636;
                  if (carModel == 0) carModelAPI = 5642;
                  if (carModel == 1) carModelAPI = 5656;
                  _selectedLocatioNmorgan = newValue;
                }
                if (choice == 52) {
                  car = 845;
                  if (carModel == 0) carModelAPI = 5648;
                  if (carModel == 1) carModelAPI = 5652;
                  if (carModel == 2) carModelAPI = 877;
                  if (carModel == 3) carModelAPI = 879;
                  if (carModel == 4) carModelAPI = 881;
                  if (carModel == 5) carModelAPI = 5654;
                  if (carModel == 6) carModelAPI = 5658;
                  if (carModel == 7) carModelAPI = 5662;
                  if (carModel == 8) carModelAPI = 5664;
                  if (carModel == 9) carModelAPI = 5668;
                  if (carModel == 10) carModelAPI = 5670;
                  if (carModel == 11) carModelAPI = 5674;
                  if (carModel == 12) carModelAPI = 5676;
                  if (carModel == 13) carModelAPI = 5682;
                  if (carModel == 14) carModelAPI = 5684;
                  if (carModel == 15) carModelAPI = 5686;
                  if (carModel == 16) carModelAPI = 5690;
                  if (carModel == 17) carModelAPI = 5694;
                  if (carModel == 18) carModelAPI = 5700;

                  if (carModel == 19) carModelAPI = 5706;
                  if (carModel == 20) carModelAPI = 5708;
                  if (carModel == 21) carModelAPI = 5710;
                  if (carModel == 22) carModelAPI = 5714;
                  if (carModel == 23) carModelAPI = 5716;
                  if (carModel == 24) carModelAPI = 5718;
                  if (carModel == 25) carModelAPI = 5678;
                  _selectedLocatioNnissan = newValue;
                }
                if (choice == 53) {
                  car = 1075;
                  if (carModel == 0) carModelAPI = 5692;
                  if (carModel == 1) carModelAPI = 5696;
                  if (carModel == 2) carModelAPI = 5702;
                  if (carModel == 3) carModelAPI = 1201;
                  if (carModel == 4) carModelAPI = 5704;
                  if (carModel == 5) carModelAPI = 1207;
                  if (carModel == 6) carModelAPI = 1197;
                  _selectedLocatioNopel = newValue;
                }
                //////////////////////////////////////////
                if (choice == 54) {
                  car = 1095;
                  if (carModel == 0) carModelAPI = 6268;
                  if (carModel == 1) carModelAPI = 1480;
                  if (carModel == 2) carModelAPI = 6270;
                  if (carModel == 3) carModelAPI = 6264;

                  _selectedLocatioNothermake = newValue;
                }
                if (choice == 55) {
                  car = 5746;
                  if (carModel == 0) carModelAPI = 5750;

                  _selectedLocatioNoullim = newValue;
                }
                if (choice == 56) {
                  car = 1077;
                  if (carModel == 0) carModelAPI = 1223;
                  if (carModel == 1) carModelAPI = 1225;
                  if (carModel == 2) carModelAPI = 5774;
                  if (carModel == 3) carModelAPI = 1231;
                  if (carModel == 4) carModelAPI = 5790;
                  if (carModel == 5) carModelAPI = 5794;
                  if (carModel == 6) carModelAPI = 5800;
                  if (carModel == 7) carModelAPI = 5808;
                  if (carModel == 8) carModelAPI = 5812;
                  if (carModel == 9) carModelAPI = 5818;
                  if (carModel == 10) carModelAPI = 5822;
                  if (carModel == 11) carModelAPI = 5824;
                  if (carModel == 12) carModelAPI = 5828;
                  if (carModel == 13) carModelAPI = 5830;
                  if (carModel == 14) carModelAPI = 5834;
                  if (carModel == 15) carModelAPI = 5788;

                  _selectedLocatioNpeugeot = newValue;
                }
                if (choice == 57) {
                  car = 5766;
                  if (carModel == 0) carModelAPI = 5770;

                  _selectedLocatioNpontiac = newValue;
                }
                if (choice == 58) {
                  car = 847;
                  if (carModel == 0) carModelAPI = 5796;
                  if (carModel == 1) carModelAPI = 5798;
                  if (carModel == 2) carModelAPI = 895;
                  if (carModel == 3) carModelAPI = 899;
                  if (carModel == 4) carModelAPI = 5802;
                  if (carModel == 5) carModelAPI = 5806;
                  if (carModel == 6) carModelAPI = 5810;
                  if (carModel == 7) carModelAPI = 5814;
                  if (carModel == 8) carModelAPI = 897;

                  _selectedLocatioNporsche = newValue;
                }
                if (choice == 59) {
                  car = 5850;
                  if (carModel == 0) carModelAPI = 5858;

                  _selectedLocatioNproton = newValue;
                }

                if (choice == 60) {
                  car = 1079;
                  if (carModel == 0) carModelAPI = 1273;
                  if (carModel == 1) carModelAPI = 5862;
                  if (carModel == 2) carModelAPI = 5864;
                  if (carModel == 3) carModelAPI = 1275;
                  if (carModel == 4) carModelAPI = 1281;
                  if (carModel == 5) carModelAPI = 5868;
                  if (carModel == 6) carModelAPI = 5870;
                  if (carModel == 7) carModelAPI = 5872;
                  if (carModel == 8) carModelAPI = 5874;
                  if (carModel == 9) carModelAPI = 5876;
                  if (carModel == 10) carModelAPI = 5880;
                  if (carModel == 11) carModelAPI = 5886;
                  if (carModel == 12) carModelAPI = 5890;
                  if (carModel == 13) carModelAPI = 5898;
                  if (carModel == 14) carModelAPI = 5882;

                  _selectedLocatioNrenault = newValue;
                }
                if (choice == 61) {
                  car = 1081;
                  if (carModel == 0) carModelAPI = 5878;
                  if (carModel == 1) carModelAPI = 5884;
                  if (carModel == 2) carModelAPI = 1299;
                  if (carModel == 3) carModelAPI = 1305;
                  if (carModel == 4) carModelAPI = 5894;
                  if (carModel == 5) carModelAPI = 5896;
                  if (carModel == 6) carModelAPI = 5888;

                  _selectedLocatioNrollsRoyce = newValue;
                }
                if (choice == 62) {
                  car = 5932;
                  if (carModel == 0) carModelAPI = 5938;

                  _selectedLocatioNrover = newValue;
                }
                if (choice == 63) {
                  car = 5948;
                  if (carModel == 0) carModelAPI = 5956;
                  _selectedLocatioNseat = newValue;
                }
                if (choice == 64) {
                  car = 1083;
                  if (carModel == 0) carModelAPI = 5972;
                  if (carModel == 1) carModelAPI = 5976;
                  if (carModel == 2) carModelAPI = 1329;

                  _selectedLocatioNskoda = newValue;
                }
                if (choice == 65) {
                  car = 5962;
                  if (carModel == 0) carModelAPI = 5964;

                  _selectedLocatioNsmart = newValue;
                }
                if (choice == 66) {
                  car = 5980;
                  if (carModel == 0) carModelAPI = 5982;
                  _selectedLocatioNsoueast = newValue;
                }
                if (choice == 67) {
                  car = 5992;
                  if (carModel == 0) carModelAPI = 5996;
                  _selectedLocatioNssangYong = newValue;
                }
                if (choice == 68) {
                  car = 1085;
                  if (carModel == 0) carModelAPI = 6000;
                  if (carModel == 1) carModelAPI = 1346;
                  if (carModel == 2) carModelAPI = 6004;
                  if (carModel == 3) carModelAPI = 1352;
                  if (carModel == 4) carModelAPI = 6002;
                  if (carModel == 5) carModelAPI = 1354;
                  _selectedLocatioNsubaru = newValue;
                }
                if (choice == 69) {
                  car = 1087;
                  if (carModel == 0) carModelAPI = 6080;
                  if (carModel == 1) carModelAPI = 6086;
                  if (carModel == 2) carModelAPI = 1376;
                  if (carModel == 3) carModelAPI = 6094;
                  if (carModel == 4) carModelAPI = 6096;
                  if (carModel == 5) carModelAPI = 1384;
                  if (carModel == 6) carModelAPI = 6098;
                  if (carModel == 7) carModelAPI = 6102;
                  if (carModel == 8) carModelAPI = 6104;
                  if (carModel == 9) carModelAPI = 6110;
                  if (carModel == 10) carModelAPI = 1378;
                  _selectedLocatioNsuzuki = newValue;
                }
                if (choice == 70) {
                  car = 1089;
                  if (carModel == 0) carModelAPI = 6006;
                  if (carModel == 1) carModelAPI = 1402;
                  _selectedLocatioNtata = newValue;
                }
                if (choice == 71) {
                  car = 1091;
                  if (carModel == 0) carModelAPI = 1424;
                  if (carModel == 1) carModelAPI = 1426;
                  if (carModel == 2) carModelAPI = 6014;

                  _selectedLocatioNtesla = newValue;
                }
                if (choice == 72) {
                  car = 849;
                  if (carModel == 0) carModelAPI = 6020;
                  if (carModel == 1) carModelAPI = 853;
                  if (carModel == 2) carModelAPI = 6022;
                  if (carModel == 3) carModelAPI = 855;
                  if (carModel == 4) carModelAPI = 857;
                  if (carModel == 5) carModelAPI = 6024;
                  if (carModel == 6) carModelAPI = 6026;
                  if (carModel == 7) carModelAPI = 6030;
                  if (carModel == 8) carModelAPI = 6032;
                  if (carModel == 9) carModelAPI = 6034;
                  if (carModel == 10) carModelAPI = 6036;
                  if (carModel == 11) carModelAPI = 6038;
                  if (carModel == 12) carModelAPI = 6040;
                  if (carModel == 13) carModelAPI = 6042;
                  if (carModel == 14) carModelAPI = 6044;
                  if (carModel == 15) carModelAPI = 6048;
                  if (carModel == 16) carModelAPI = 6050;
                  if (carModel == 17) carModelAPI = 6054;
                  if (carModel == 18) carModelAPI = 6056;
                  if (carModel == 19) carModelAPI = 6058;
                  if (carModel == 20) carModelAPI = 6060;
                  if (carModel == 21) carModelAPI = 6062;
                  if (carModel == 22) carModelAPI = 6064;
                  if (carModel == 23) carModelAPI = 6066;
                  if (carModel == 24) carModelAPI = 6068;
                  if (carModel == 25) carModelAPI = 6070;
                  if (carModel == 26) carModelAPI = 6072;
                  if (carModel == 27) carModelAPI = 6074;
                  if (carModel == 28) carModelAPI = 6076;
                  if (carModel == 29) carModelAPI = 6078;
                  if (carModel == 30) carModelAPI = 6084;
                  if (carModel == 31) carModelAPI = 6090;
                  if (carModel == 32) carModelAPI = 6052;
                  _selectedLocatioNtoyota = newValue;
                }
                // if (choice == 75) {
                //   _selectedLocatioNuaz = newValue;
                //   }
                if (choice == 73) {
                  car = 851;
                  if (carModel == 0) carModelAPI = 6046;
                  if (carModel == 1) carModelAPI = 919;
                  if (carModel == 2) carModelAPI = 6082;
                  if (carModel == 3) carModelAPI = 921;
                  if (carModel == 4) carModelAPI = 6088;
                  if (carModel == 5) carModelAPI = 6092;
                  if (carModel == 6) carModelAPI = 923;
                  if (carModel == 7) carModelAPI = 6100;
                  if (carModel == 8) carModelAPI = 6106;
                  if (carModel == 9) carModelAPI = 6108;
                  if (carModel == 10) carModelAPI = 6112;
                  if (carModel == 11) carModelAPI = 6114;
                  if (carModel == 12) carModelAPI = 6116;
                  if (carModel == 13) carModelAPI = 6118;
                  if (carModel == 14) carModelAPI = 6120;
                  if (carModel == 15) carModelAPI = 6124;
                  if (carModel == 16) carModelAPI = 6126;
                  if (carModel == 17) carModelAPI = 6128;
                  if (carModel == 18) carModelAPI = 6134;
                  if (carModel == 19) carModelAPI = 6132;
                  _selectedLocatioNvolkswagen = newValue;
                }
                if (choice == 74) {
                  car = 1093;
                  if (carModel == 0) carModelAPI = 1472;
                  if (carModel == 1) carModelAPI = 6128;
                  if (carModel == 2) carModelAPI = 6220;
                  if (carModel == 3) carModelAPI = 6224;
                  if (carModel == 4) carModelAPI = 6226;
                  if (carModel == 5) carModelAPI = 1466;
                  _selectedLocatioNvolvo = newValue;
                }
              }
              // if (choice == 78) {
              //   _selectedLocatioNwMotors = newValue;}
              //////////////////////////////////////
            });
          },
        ),
        SizedBox(
          height: 5.w,
        ),
      ],
    );
  }

  Widget _buildName(BuildContext context, double x, dynamic text,
      dynamic choice, dynamic choice2) {
    return Container(
      width: x,
      child: TextFormField(
        keyboardType: choice2 == 1 ? TextInputType.number : TextInputType.text,

        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15, padding2, 15, 0),
            isDense: true,
            errorStyle: TextStyle(fontSize: 11.0),
            labelText: text,
            labelStyle: TextStyle(fontSize: 4.w),
            enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: new BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.black, width: 1.0))),
        style: new TextStyle(color: Colors.black),
        // ignore: missing_return
        validator: (var value) {
          if (choice == 1) if (value.isEmpty)
            return translator.translate('Required');
          if (choice == 2) {
            if (value.isEmpty) return translator.translate('Required');
            if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
                    .hasMatch(value) &&
                !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
                    .hasMatch(value))
              return translator.translate('Please enter numbers');
          }
        },
        onSaved: (value) {
          if (choice == 1) title = value;
          if (choice == 2)
            price = NumberUtility.changeDigit(value, NumStrLanguage.English);
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    carsModels = [
      translator.translate('Alfa Romeo'),
      translator.translate('Aston Martin'),
      translator.translate('Audi'),
      translator.translate('BMW'),
      translator.translate('Bentley'),
      translator.translate('Borgward'),
      translator.translate('Brilliance'),
      translator.translate('Bugatti'),
      translator.translate('CMC'),
      translator.translate('Cadillac'),
      translator.translate('Changan'),
      translator.translate('Chevrolet'),
      translator.translate('Chrysler'),
      translator.translate('Citroen'),
      translator.translate('Daihatsu'),
      translator.translate('Dodge'),
      translator.translate('Ferrari'),
      translator.translate('Fiat'),
      translator.translate('Ford'),
      translator.translate('Foton'),
      translator.translate('GAC'),
      translator.translate('GMC'),
      translator.translate('Geely'),
      translator.translate('Genesis'),
      // translator.translate('Grand Tiger'),
      // translator.translate('Great Wall'),
      translator.translate('Haval'),
      translator.translate('Honda'),
      //translator.translate('Hongqi'),
      translator.translate('Hummer'),
      translator.translate('Hyundai'),
      translator.translate('Infiniti'),
      translator.translate('Isuzu'),
      translator.translate('JAC'),
      translator.translate('Jaguar'),
      translator.translate('Jeep'),
      translator.translate('Jetour'),
      translator.translate('Kia'),
      // translator.translate('King Long'),
      translator.translate('Lamborghini'),
      translator.translate('Lancia'),
      translator.translate('Land Rover'),
      translator.translate('Lexus'),
      translator.translate('Lincoln'),
      translator.translate('Lotus'),
      translator.translate('MG'),
      translator.translate('MINI'),
      translator.translate('Mahindra'),
      translator.translate('Maserati'),
      translator.translate('Maybach'),
      translator.translate('Mazda'),
      translator.translate('McLaren'),
      translator.translate('Mercedes-Benz'),
      translator.translate('Mercury'),
      translator.translate('Mitsubishi'),
      translator.translate('Morgan'),
      translator.translate('Nissan'),
      translator.translate('Opel'),
      translator.translate('Other Make'),
      translator.translate('Oullim'),
      translator.translate('Peugeot'),
      translator.translate('Pontiac'),
      translator.translate('Porsche'),
      translator.translate('Proton'),
      translator.translate('Renault'),
      translator.translate('Rolls Royce'),
      translator.translate('Rover'),
      translator.translate('Seat'),
      translator.translate('Skoda'),
      translator.translate('Smart'),
      translator.translate('Soueast'),
      translator.translate('Ssang Yong'),
      translator.translate('Subaru'),
      translator.translate('Suzuki'),
      translator.translate('TATA'),
      translator.translate('Tesla'),
      translator.translate('Toyota'),
      //  translator.translate('UAZ'),
      translator.translate('Volkswagen'),
      translator.translate('Volvo'),
      //  translator.translate('W Motors'),
    ];

    cmc = [
      translator.translate("CMC Veryca "),
    ];

    borgward = [
      translator.translate("Borgward BX5"),
      translator.translate("Borgward BX7"),
    ];

    brilliance = [
      translator.translate("Brilliance V5"),
    ];
    bugatti = [
      translator.translate("Bugatti Chiron"),
      translator.translate("Bugatti Grand Sport"),
      translator.translate("Bugatti Veyron"),
      translator.translate("Bugatti Veyron 16.4"),
    ];

    daihatsu = [
      translator.translate("Daihatsu Sirion"),
      translator.translate("Daihatsu Terios"),
      translator.translate("Daihatsu Gran Max"),
    ];
    /* fisker = [
      translator.translate("Fisker Karma"),
    ];*/
    foton = [
      translator.translate("Foton Other"),
      translator.translate("Foton TUNLAND"),
    ];
    gac = [
      translator.translate("GAC GA8"),
      translator.translate("GAC GS8"),
    ];
    genesis = [
      translator.translate("Genesis G70"),
      translator.translate("Genesis G80"),
      translator.translate("Genesis G90"),
      translator.translate("Genesis Coupe")
    ];
    grandTiger = [
      translator.translate("Grand Tiger Grandtiger Pickup"),
    ];
    greatWall = [
      translator.translate("Great Wall Wingle 5"),
      translator.translate("Great Wall Wingle 6"),
    ];
    haval = [
      translator.translate("Haval H8"),
      translator.translate("Haval H9"),
    ];
    isuzu = [
      translator.translate("Isuzu Other"),
      translator.translate("Isuzu Trooper"),
    ];
    jetour = [
      translator.translate("Jetour X70"),
      translator.translate("Jetour X90"),
    ];
    kingLong = [
      translator.translate("King Long China Mini Van"),
    ];
    lancia = [
      translator.translate("Lancia Delta"),
    ];
    lotus = [
      translator.translate("Lotus Evora"),
      translator.translate("Lotus Exige"),
    ];
    mg = [
      translator.translate("MG 360"),
      translator.translate("MG GS"),
      translator.translate("MG HS"),
      translator.translate("MG MG6"),
      translator.translate("MG MGB"),
      translator.translate("MG RX5"),
      translator.translate("MG RX8"),
      translator.translate("MG ZS"),
      translator.translate("MG MG5"),
    ];
    mahindra = [
      translator.translate("Mahindra XUV 500"),
    ];
    maybach = [
      translator.translate("Maybach 57"),
      translator.translate("Maybach 62"),
      translator.translate("Maybach s500"),
      translator.translate("Maybach Other"),
    ];
    morgan = [
      translator.translate("Morgan 3 Wheeler"),
      translator.translate("Morgan Aero Supersport"),
    ];
    oullim = [
      translator.translate("Oullim SPIRRA"),
    ];
    pontiac = [
      translator.translate("Pontiac Other"),
    ];
    proton = [
      translator.translate("Proton Other"),
    ];
    rover = [
      translator.translate("Rover Other"),
    ];
    seat = [
      translator.translate("Seat Leon"),
    ];
    smart = [
      translator.translate("Smart Other"),
    ];
    soueast = [
      translator.translate("Soueast DX7"),
    ];
    ssangYong = [
      translator.translate("Ssang Yong Other"),
    ];
    uaz = [
      translator.translate("UAZ Hunter"),
    ];
    wMotors = [
      translator.translate("W Motors Fenyr Hypersport"),
    ];
    lamborghini = [
      translator.translate("Lamborghini Aventador"),
      translator.translate("Lamborghini Gallardo"),
      translator.translate("Lamborghini Huracan"),
      translator.translate("Lamborghini Urus"),
      translator.translate("Lamborghini Murcielago"),
    ];

    othermake = [
      translator.translate("Other Make Other 4x4 "),
      translator.translate("Other Make Other Car "),
      translator.translate("Other Make Other Utility"),
      translator.translate("Other Make Heavy Vehicles"),
    ];

    volvo = [
      translator.translate("Volvo V-Class"),
      translator.translate("Volvo XC40"),
      translator.translate("Volvo XC60"),
      translator.translate("Volvo XC90"),
      translator.translate("Volvo Other"),
      translator.translate("Volvo S-Class"),
    ];

    volkswagen = [
      translator.translate("Volkswagen Arteon"),
      translator.translate("Volkswagen Beetle"),
      translator.translate("Volkswagen Bora"),
      translator.translate("Volkswagen CC"),
      translator.translate("Volkswagen Caddy"),
      translator.translate("Volkswagen Crafter"),
      translator.translate("Volkswagen Eos"),
      translator.translate("Volkswagen GTI"),
      translator.translate("Volkswagen Golf"),
      translator.translate("Volkswagen Golf R"),
      translator.translate("Volkswagen Jetta"),
      translator.translate("Volkswagen Multivan"),
      translator.translate("Volkswagen Passat"),
      translator.translate("Volkswagen Polo"),
      translator.translate("Volkswagen Scirocco"),
      translator.translate("Volkswagen Teramont"),
      translator.translate("Volkswagen Tiguan"),
      translator.translate("Volkswagen Touareg"),
      translator.translate("Volkswagen Other"),
      translator.translate("Volkswagen Transporter"),
    ];

    peugeot = [
      translator.translate("Peugeot 2008"),
      translator.translate("Peugeot 206cc"),
      translator.translate("Peugeot 207"),
      translator.translate("Peugeot 208"),
      translator.translate("Peugeot 3008"),
      translator.translate("Peugeot 301"),
      translator.translate("Peugeot 308"),
      translator.translate("Peugeot 308 GT LINE"),
      translator.translate("Peugeot 5008"),
      translator.translate("Peugeot 508"),
      translator.translate("Peugeot Boxer"),
      translator.translate("Peugeot Expert"),
      translator.translate("Peugeot Partner"),
      translator.translate("Peugeot RCZ"),
      translator.translate("Peugeot Other"),
      translator.translate("Peugeot 208 GT LINE"),
    ];

    toyota = [
      translator.translate("Toyota 4Runner"),
      translator.translate("Toyota 86"),
      translator.translate("Toyota Alphard"),
      translator.translate("Toyota Avalon"),
      translator.translate("Toyota Avanza"),
      translator.translate("Toyota C-HR"),
      translator.translate("Toyota Camry"),
      translator.translate("Toyota Corolla"),
      translator.translate("Toyota Cressida"),
      translator.translate("Toyota FJ Cruiser"),
      translator.translate("Toyota Fortuner"),
      translator.translate("Toyota Hiace"),
      translator.translate("Toyota Highlander"),
      translator.translate("Toyota Hilux"),
      translator.translate("Toyota IQ"),
      translator.translate("Toyota Innova"),
      translator.translate("Toyota Land Cruiser"),
      translator.translate("Toyota MR2"),
      translator.translate("Toyota Pickup"),
      translator.translate("Toyota Prado"),
      translator.translate("Toyota Previa"),
      translator.translate("Toyota Prius"),
      translator.translate("Toyota Rav 4"),
      translator.translate("Toyota Rush"),
      translator.translate("Toyota Sequoia"),
      translator.translate("Toyota Sienna"),
      translator.translate("Toyota Supra"),
      translator.translate("Toyota Tacoma"),
      translator.translate("Toyota Tundra"),
      translator.translate("Toyota Yaris"),
      translator.translate("Toyota Zelas"),
      translator.translate("Toyota Other"),
      translator.translate("Toyota Land Cruiser 76 series"),
    ];

    tesla = [
      translator.translate("Tesla Model 3"),
      translator.translate("Tesla Model S"),
      translator.translate("Tesla Model X"),
    ];

    tata = [
      translator.translate("TATA Other"),
      translator.translate("TATA Pickup")
    ];

    suzuki = [
      translator.translate("Suzuki Baleno"),
      translator.translate("Suzuki Celerio"),
      translator.translate("Suzuki Ciaz"),
      translator.translate("Suzuki Dzire"),
      translator.translate("Suzuki Ertiga"),
      translator.translate("Suzuki Jimny"),
      translator.translate("Suzuki Kizashi"),
      translator.translate("Suzuki Swift"),
      // translator.translate("Suzuki Vitara"),
      translator.translate("Suzuki XL7"),
      translator.translate("Suzuki Other"),
      translator.translate("Suzuki Grand Vitara"),
    ];

    subaru = [
      translator.translate("Subaru BRZ"),
      translator.translate("Subaru Legacy"),
      translator.translate("Subaru Outback"),
      translator.translate("Subaru WRX"),
      translator.translate("Subaru Forester"),
      translator.translate("Subaru XV")
    ];

    skoda = [
      translator.translate("Skoda Kodiaq"),
      translator.translate("Skoda Rapid"),
      translator.translate("Skoda Octavia"),
    ];

    rollsRoyce = [
      translator.translate("Rolls Royce Cullinan"),
      translator.translate("Rolls Royce Dawn"),
      translator.translate("Rolls Royce Ghost"),
      translator.translate("Rolls Royce Phantom"),
      translator.translate("Rolls Royce Wraith"),
      translator.translate("Rolls Royce Other"),
      translator.translate("Rolls Royce Silver Spur"),
    ];

    renault = [
      translator.translate("Renault Captur"),
      translator.translate("Renault Clio"),
      translator.translate("Renault Dokker"),
      translator.translate("Renault Duster"),
      translator.translate("Renault Fluence"),
      translator.translate("Renault Koleos"),
      translator.translate("Renault Laguna"),
      translator.translate("Renault Logan"),
      translator.translate("Renault Megane"),
      translator.translate("Renault Safrane"),
      translator.translate("Renault Symbol"),
      translator.translate("Renault Trafic"),
      translator.translate("Renault Twizy"),
      translator.translate("Renault Other"),
      translator.translate("Renault Talisman"),
    ];

    porsche = [
      translator.translate("Porsche 918 Spyder"),
      translator.translate("Porsche 928"),
      translator.translate("Porsche Boxster"),
      translator.translate("Porsche Cayenne"),
      translator.translate("Porsche Cayman"),
      translator.translate("Porsche Macan"),
      translator.translate("Porsche Panamera"),
      translator.translate("Porsche Taycan"),
      translator.translate("Porsche Carrera / 911"),
    ];

    opel = [
      translator.translate("Opel Astra"),
      translator.translate("Opel Corsa"),
      translator.translate("Opel Grandland X"),
      translator.translate("Opel Insignia"),
      translator.translate("Opel Mokka"),
      translator.translate("Opel Zafira"),
      translator.translate("Opel Crossland X"),
    ];

    nissan = [
      translator.translate("Nissan 350Z"),
      translator.translate("Nissan 370z"),
      translator.translate("Nissan Altima"),
      translator.translate("Nissan Armada"),
      translator.translate("Nissan GT-R"),
      translator.translate("Nissan Juke"),
      translator.translate("Nissan Kicks"),
      translator.translate("Nissan Maxima"),
      translator.translate("Nissan Micra"),
      translator.translate("Nissan Murano"),
      translator.translate("Nissan Navara"),
      translator.translate("Nissan Pathfinder"),
      translator.translate("Nissan Patrol"),
      translator.translate("Nissan Pickup"),
      translator.translate("Nissan Qashqai"),
      translator.translate("Nissan Rogue"),
      translator.translate("Nissan Sentra"),
      translator.translate("Nissan Sunny"),
      translator.translate("Nissan Tiida"),
      translator.translate("Nissan Titan"),
      translator.translate("Nissan Van"),
      translator.translate("Nissan Versa"),
      translator.translate("Nissan X-Trail"),
      translator.translate("Nissan Xterra"),
      translator.translate("Nissan Other"),
      translator.translate("Nissan Patrol Pickup"),
    ];

    mitsubishi = [
      translator.translate("Mitsubishi ASX "),
      translator.translate("Mitsubishi Attrage"),
      translator.translate("Mitsubishi Canter"),
      translator.translate("Mitsubishi Eclipse "),
      translator.translate("Mitsubishi EclipseCross"),
      translator.translate("Mitsubishi Evolution"),
      translator.translate("Mitsubishi Galant"),
      translator.translate("Mitsubishi L200 "),
      translator.translate("Mitsubishi Lancer"),
      translator.translate("Mitsubishi Mirage"),
      translator.translate("Mitsubishi Montero"),
      translator.translate("Mitsubishi Nativa "),
      translator.translate("Mitsubishi Outlander"),
      translator.translate("Mitsubishi Pajero "),
      translator.translate("Mitsubishi Pajero Sport"),
      translator.translate("Mitsubishi Pickup "),
      translator.translate("Mitsubishi Van"),
      translator.translate("Mitsubishi Other "),
      translator.translate("Mitsubishi Montero Sport"),
    ];

    mINI = [
      translator.translate("MINI Clubman"),
      translator.translate("MINI Cooper"),
      translator.translate("MINI Coupe"),
      translator.translate("MINI Paceman"),
      translator.translate("MINI Countryman"),
    ];

    mercury = [
      translator.translate("Mercury Mariner"),
      translator.translate("Mercury Mountaineer"),
      translator.translate("Mercury Grand Marquis"),
    ];
    mercedesBenz = [
      translator.translate("Mercedes-Benz 190"),
      translator.translate("Mercedes-Benz 240/260/280"),
      translator.translate("Mercedes-Benz 300/350/380"),
      translator.translate("Mercedes-Benz 400/420"),
      translator.translate("Mercedes-Benz 450 SEL"),
      translator.translate("Mercedes-Benz 500/560"),
      translator.translate("Mercedes-Benz A-Class"),
      translator.translate("Mercedes-Benz A200"),
      translator.translate("Mercedes-Benz AMG"),
      translator.translate("Mercedes-Benz AMG GT 4 doors"),
      translator.translate("Mercedes-Benz B-Class"),
      translator.translate("Mercedes-Benz C-Class"),
      translator.translate("Mercedes-Benz C-Class Coupe"),
      translator.translate("Mercedes-Benz C43"),
      translator.translate("Mercedes-Benz CL-Class"),
      translator.translate("Mercedes-Benz CLA"),
      translator.translate("Mercedes-Benz CLC"),
      translator.translate("Mercedes-Benz CLK-Class"),
      translator.translate("Mercedes-Benz CLS-Class"),
      translator.translate("Mercedes-Benz E-Class"),
      translator.translate("Mercedes-Benz E-Class Coupe"),
      translator.translate("Mercedes-Benz G-Class"),
      translator.translate("Mercedes-Benz GL-Class"),
      translator.translate("Mercedes-Benz GLA"),
      translator.translate("Mercedes-Benz GLB"),
      translator.translate("Mercedes-Benz GLC"),
      translator.translate("Mercedes-Benz GLC 63"),
      translator.translate("Mercedes-Benz GLE Coupe"),
      translator.translate("Mercedes-Benz GLE SUV"),
      translator.translate("Mercedes-Benz GLE-Class"),
      translator.translate("Mercedes-Benz GLK-Class"),
      translator.translate("Mercedes-Benz GLS"),
      translator.translate("Mercedes-Benz GLS 580 4Matic"),
      translator.translate("Mercedes-Benz GLS-Class"),
      translator.translate("Mercedes-Benz GT"),
      translator.translate("Mercedes-Benz M-Class"),
      translator.translate("Mercedes-Benz Other"),
//36
      translator.translate("Mercedes-Benz R-Class"),
      translator.translate("Mercedes-Benz S-Class"),
      translator.translate("Mercedes-Benz S-Class Coupe"),
      translator.translate("Mercedes-Benz SEC-Class"),
      translator.translate("Mercedes-Benz SEL-Class"),
      translator.translate("Mercedes-Benz SL-Class"),
      translator.translate("Mercedes-Benz SLC"),
      translator.translate("Mercedes-Benz SLK-Class"),
      translator.translate("Mercedes-Benz SLR"),
      translator.translate("Mercedes-Benz SLS"),
      translator.translate("Mercedes-Benz Sprinter"),
      translator.translate("Mercedes-Benz V-Class"),
      translator.translate("Mercedes-Benz Viano"),
      translator.translate("Mercedes-Benz X Class"),
    ];
    mcLaren = [
      translator.translate("McLaren 570GT"),
      translator.translate("McLaren 570S"),
      translator.translate("McLaren 650S"),
      translator.translate("McLaren 675LT"),
      translator.translate("McLaren 720S"),
      translator.translate("McLaren P1"),
      translator.translate("McLaren SLR"),
      translator.translate("McLaren Senna"),
      translator.translate("McLaren Other"),
      translator.translate("McLaren MP4-12C"),
    ];
    mazda = [
      translator.translate("Mazda 2"),
      translator.translate("Mazda 3"),
      translator.translate("Mazda 6"),
      translator.translate("Mazda CX-3"),
      translator.translate("Mazda CX-5"),
      translator.translate("Mazda CX-9"),
      translator.translate("Mazda MX-5"),
      translator.translate("Mazda RX-8"),
      translator.translate("Mazda Pickup"),
    ];
    maserati = [
      translator.translate("Maserati Ghibli"),
      translator.translate("Maserati GranCabrio"),
      translator.translate("Maserati GranTurismo"),
      translator.translate("Maserati Levante"),
      translator.translate("Maserati Other "),
      translator.translate("Maserati Quattroporte"),
    ];
    lincoln = [
      translator.translate("Lincoln Aviator"),
      translator.translate("Lincoln LS"),
      translator.translate("Lincoln MKC"),
      translator.translate("Lincoln MKS"),
      translator.translate("Lincoln MKX"),
      translator.translate("Lincoln MKZ"),
      translator.translate("Lincoln Navigator"),
      translator.translate("Lincoln Other"),
      translator.translate("Lincoln Town Car"),
      translator.translate("Lincoln Continental"),
    ];
    lexus = [
      translator.translate("Lexus CT-Series"),
      translator.translate("Lexus ES-Series"),
      translator.translate("Lexus GS-Series"),
      translator.translate("Lexus GX-Series"),
      translator.translate("Lexus IS-C"),
      translator.translate("Lexus IS-F"),
      translator.translate("Lexus IS-Series"),
      translator.translate("Lexus LC 500"),
      translator.translate("Lexus LM 300"),
      translator.translate("Lexus LS-Series"),
      translator.translate("Lexus LX-Series"),
      translator.translate("Lexus NX 200t"),
      translator.translate("Lexus NX 300"),
      translator.translate("Lexus Other"),
      translator.translate("Lexus RC"),
      translator.translate("Lexus RC F"),
      translator.translate("Lexus RX-Series"),
    ];
    landRover = [
      translator.translate("Land Rover Defender"),
      translator.translate("Land Rover Discovery"),
      translator.translate("Land Rover Discovery Sport"),
      translator.translate("Land Rover LR2"),
      translator.translate("Land Rover LR3"),
      translator.translate("Land Rover LR4"),
      translator.translate("Land Rover Range Rover"),
      translator.translate("Land Rover Range Rover Sport"),
      translator.translate("Land Rover Range Rover Velar"),
      translator.translate("Land Rover Range Rover Evoque"),
    ];
    kia = [
      translator.translate("Kia Cadenza"),
      translator.translate("Kia Carens"),
      translator.translate("Kia Carnival"),
      translator.translate("Kia Cerato"),
      translator.translate("Kia K5"),
      translator.translate("Kia Mohave"),
      translator.translate("Kia Oprius"),
      translator.translate("Kia Optima"),
      translator.translate("Kia Other"),
      translator.translate("Kia Pegas"),
      translator.translate("Kia Picanto"),
      translator.translate("Kia Quoris"),
      translator.translate("Kia Rio"),
      translator.translate("Kia Sedona"),
      translator.translate("Kia Seltos"),
      translator.translate("Kia Sorento"),
      translator.translate("Kia Soul"),
      translator.translate("Kia Sportage"),
      translator.translate("Kia Stinger"),
      translator.translate("Kia Telluride"),
    ];
    jeep = [
      translator.translate("Jeep Cherokee"),
      translator.translate("Jeep Compass "),
      translator.translate("Jeep Commander"),
      translator.translate("Jeep Gladiator"),
      translator.translate("Jeep Grand Cherokee"),
      translator.translate("Jeep Liberty"),
      translator.translate("Jeep Other"),
      translator.translate("Jeep Renegade"),
      translator.translate("Jeep Wrangler"),
      translator.translate("Jeep Wrangler Unlimited"),
    ];
    jaguar = [
      translator.translate('Jaguar E-Pace '),
      translator.translate('Jaguar F-Pace '),
      translator.translate('Jaguar F-Type '),
      translator.translate('Jaguar Other '),
      translator.translate('Jaguar S-Type '),
      translator.translate('Jaguar X-Type '),
      translator.translate('Jaguar XE '),
      translator.translate('Jaguar XF '),
      translator.translate('Jaguar XJ6 '),
      translator.translate('Jaguar XJ8 '),
      translator.translate('Jaguar XJR '),
      translator.translate('Jaguar XK '),
      translator.translate('Jaguar XKR '),
      translator.translate('Jaguar XJ-Series '),
      translator.translate('Jaguar XK8  ')
    ];

    jAC = [
      translator.translate("JAC S3 "),
      translator.translate("JAC S7 "),
    ];

    infiniti = [
      translator.translate("Infiniti EX35"),
      translator.translate("Infiniti FX50"),
      translator.translate("Infiniti FX45/FX35"),
      translator.translate("Infiniti G-Series"),
      translator.translate("Infiniti G25"),
      translator.translate("Infiniti JX-Series"),
      translator.translate("Infiniti Other"),
      translator.translate("Infiniti Q30"),
      translator.translate("Infiniti Q50"),
      translator.translate("Infiniti Q60"),
      translator.translate("Infiniti Q70"),
      translator.translate("Infiniti QX30"),
      translator.translate("Infiniti QX50"),
      translator.translate("Infiniti QX56"),
      translator.translate("Infiniti QX60"),
      translator.translate("Infiniti QX70"),
      translator.translate("Infiniti QX80"),
    ];

    hyundai = [
      translator.translate("Hyundai Accent"),
      translator.translate("Hyundai Avanti"),
      translator.translate("Hyundai Azera"),
      translator.translate("Hyundai Centennial"),
      translator.translate("Hyundai Coupe"),
      translator.translate("Hyundai Creta"),
      translator.translate("Hyundai Elantra"),
      translator.translate("Hyundai Galloper"),
      translator.translate("Hyundai Genesis"),
      translator.translate("Hyundai Grand Santa Fe"),
      translator.translate("Hyundai H1"),
      translator.translate("Hyundai i10"),
      translator.translate("Hyundai i20"),
      translator.translate("Hyundai Kona"),
      translator.translate("Hyundai Other"),
      translator.translate("Hyundai Palisade"),
      translator.translate("Hyundai Santa Fe"),
      translator.translate("Hyundai Sonata"),
      translator.translate("Hyundai Tucson"),
      translator.translate("Hyundai Veloster"),
      translator.translate("Hyundai Veracruz"),
    ];

    hummer = [
      translator.translate("Hummer H1"),
      translator.translate("Hummer H2"),
      translator.translate("Hummer H3"),
    ];

    hongqi = [];

    honda = [
      translator.translate("Honda Accord"),
      translator.translate("Honda City"),
      translator.translate("Honda Civic"),
      translator.translate("Honda CR-V"),
      translator.translate("Honda Crosstour"),
      translator.translate("Honda HR-V"),
      translator.translate("Honda Jazz"),
      translator.translate("Honda MR-V"),
      translator.translate("Honda Odyssey"),
      translator.translate("Honda Odyssey J"),
      translator.translate("Honda Other"),
      translator.translate("Honda Pilot"),
    ];

    gmc = [
      translator.translate("GMC Acadia"),
      translator.translate("GMC Envoy"),
      translator.translate("GMC Jimmy"),
      translator.translate("GMC Other"),
      translator.translate("GMC Pickup"),
      translator.translate("GMC Savana"),
      translator.translate("GMC Sierra"),
      translator.translate("GMC Terrain"),
      translator.translate("GMC Yukon"),
      translator.translate("GMC Suburban"),
    ];

    geely = [
      translator.translate("Geely Emgrand 7"),
      translator.translate("Geely Emgrand GT"),
      translator.translate("Geely Emgrand X7"),
      translator.translate("Geely GC6"),
    ];

    ford = [
      translator.translate(" Ford Bronco"),
      translator.translate(" Ford Crown Victoria"),
      translator.translate(" Ford Ecosport"),
      translator.translate(" Ford Edge"),
      translator.translate(" Ford Escape"),
      translator.translate(" Ford Excursion"),
      translator.translate(" Ford Expedition"),
      translator.translate(" Ford Explorer"),
      translator.translate(" Ford F-Series Pickup"),
      translator.translate(" Ford Fiesta"),
      translator.translate(" Ford Figo"),
      translator.translate(" Ford Flex"),
      translator.translate(" Ford Focus"),
      translator.translate(" Ford Fusion"),
      translator.translate(" Ford GT"),
      translator.translate(" Ford Mondeo"),
      translator.translate(" Ford Mustang"),
      translator.translate(" Ford Other"),
      translator.translate(" Ford Pickup"),
      translator.translate(" Ford Ranger"),
      translator.translate(" Ford Shelby Cobra"),
      translator.translate(" Ford Super Duty"),
      translator.translate(" Ford Taurus"),
      translator.translate(" Ford Thunderbird"),
      translator.translate(" Ford Van"),
    ];

    fiat = [
      translator.translate("Fiat 124 Spider"),
      translator.translate("Fiat 500X"),
      translator.translate("Fiat Barchetta"),
      translator.translate("Fiat Fiat-500"),
      translator.translate("Fiat Other"),
    ];

    ferrari = [
      translator.translate(" Ferrari 355"),
      translator.translate(" Ferrari 360"),
      translator.translate(" Ferrari 458"),
      translator.translate(" Ferrari 458 Italia"),
      translator.translate(" Ferrari 458 Speciale"),
      translator.translate(" Ferrari 458 Spider"),
      translator.translate(" Ferrari 488"),
      translator.translate(" Ferrari 488 GTB"),
      translator.translate(" Ferrari 488 Spider"),
      translator.translate(" Ferrari 512"),
      translator.translate(" Ferrari 812 GTS"),
      translator.translate(" Ferrari 812 Superfast"),
      translator.translate(" Ferrari California"),
      translator.translate(" Ferrari California T "),
      translator.translate(" Ferrari F12"),
      translator.translate(" Ferrari F430"),
      translator.translate(" Ferrari F430 Spider"),
      translator.translate(" Ferrari F8 Tributo"),
      translator.translate(" Ferrari F8 Tributo Spider"),
      translator.translate(" Ferrari Ferrari 456  "),
      translator.translate(" Ferrari FF"),
      translator.translate(" Ferrari GTC4 Lusso"),
      translator.translate(" Ferrari LaFerrari"),
      translator.translate(" Ferrari Other"),
      translator.translate(" Ferrari Portofino"),
      translator.translate(" Ferrari Scaglietti"),
      translator.translate(" Ferrari Testarossa"),
    ];

    dodge = [
      translator.translate("Dodge Avenger"),
      translator.translate("Dodge Caliber"),
      translator.translate("Dodge Caravan"),
      translator.translate("Dodge Challenger"),
      translator.translate("Dodge Charger"),
      translator.translate("Dodge Dart"),
      translator.translate("Dodge Durango"),
      translator.translate("Dodge Journey"),
      translator.translate("Dodge Neon"),
      translator.translate("Dodge Nitro"),
      translator.translate("Dodge Other"),
      translator.translate("Dodge Ram"),
      translator.translate("Dodge Viper"),
    ];

    citroen = [
      translator.translate(" Citroen C5 "),
      translator.translate(" Citroen DS 3 "),
      translator.translate(" Citroen DS 5 "),
      translator.translate(" Citroen Other "),
    ];

    chrysler = [
      translator.translate("Chrysler 200/200C EV "),
      translator.translate("Chrysler 300M/300C"),
      translator.translate("Chrysler Other"),
      translator.translate("Chrysler Pacifica"),
      translator.translate("Chrysler Prowler"),
      translator.translate("Chrysler PT Cruiser"),
      translator.translate("Chrysler Sebring"),
      translator.translate("Chrysler Voyager/Caravan"),
    ];

    chevrolet = [
      translator.translate("Chevrolet Astro"),
      translator.translate("Chevrolet Avalanch"),
      translator.translate("Chevrolet Aveo"),
      translator.translate("Chevrolet Blazer"),
      translator.translate("Chevrolet Bolt"),
      translator.translate("Chevrolet Camaro"),
      translator.translate("Chevrolet Caprice"),
      translator.translate("Chevrolet Captiva"),
      translator.translate("Chevrolet Cavalier"),
      translator.translate("Chevrolet Corvette"),
      translator.translate("Chevrolet Cruze "),
      translator.translate("Chevrolet Epica "),
      translator.translate("Chevrolet Equinox "),
      translator.translate("Chevrolet Explorer "),
      translator.translate("Chevrolet Express "),
      translator.translate("Chevrolet Impala "),
      translator.translate("Chevrolet Malibu "),
      translator.translate("Chevrolet Other "),
      translator.translate("Chevrolet Pickup "),
      translator.translate("Chevrolet Silverado"),
      translator.translate("Chevrolet Sonic "),
      translator.translate("Chevrolet Spark "),
      translator.translate("Chevrolet SSR "),
      translator.translate("Chevrolet Suburban "),
      translator.translate("Chevrolet Tahoe "),
      translator.translate("Chevrolet Trailblazer "),
      translator.translate("Chevrolet Traverse "),
      translator.translate("Chevrolet Trax "),
      translator.translate("Chevrolet Uplander "),
    ];

    changan = [
      translator.translate("Changan CS35 Plus"),
      translator.translate("Changan CS75"),
      translator.translate("Changan CS85"),
      translator.translate("Changan CS95"),
      translator.translate("Changan Eado"),
    ];

    cadillac = [
      translator.translate("Cadillac ATS"),
      translator.translate("Cadillac CT4"),
      translator.translate("Cadillac CT6"),
      translator.translate("Cadillac CTS/Catera"),
      translator.translate("Cadillac DTS/De Ville"),
      translator.translate("Cadillac Escalade"),
      translator.translate("Cadillac Fleetwood"),
      translator.translate("Cadillac Other"),
      translator.translate("Cadillac SRX"),
      translator.translate("Cadillac STS/Seville"),
      translator.translate("Cadillac XT4"),
      translator.translate("Cadillac XT5"),
      translator.translate("Cadillac XTR/Eldorado"),
      translator.translate("Cadillac XTS"),
    ];
    bmw = [
      translator.translate("BMW 1-Series"),
      translator.translate("BMW 2-Series"),
      translator.translate("BMW 3-Series"),
      translator.translate("BMW 4-Series"),
      translator.translate("BMW 5-Series"),
      translator.translate("BMW 6-Series"),
      translator.translate("BMW 7-Series"),
      translator.translate("BMW 8-Series"),
      translator.translate("BMW i3"),
      translator.translate("BMW i8"),
      translator.translate("BMW M2"),
      translator.translate("BMW M3"),
      translator.translate("BMW M4"),
      translator.translate("BMW M5"),
      translator.translate("BMW M6"),
      translator.translate("BMW M8"),
      translator.translate("BMW Other"),
      translator.translate("BMW X1"),
      translator.translate("BMW X2"),
      translator.translate("BMW X3"),
      translator.translate("BMW X4"),
      translator.translate("BMW X5"),
      translator.translate("BMW X6"),
      translator.translate("BMW X7"),
      translator.translate("BMW Z3"),
      translator.translate("BMW Z4"),
      translator.translate("BMW Z8"),
    ];
    bentley = [
      translator.translate("Bentley Arnage"),
      translator.translate("Bentley Azure"),
      translator.translate("Bentley Bentayga"),
      translator.translate("Bentley Brooklands"),
      translator.translate("Bentley Continental"),
      translator.translate("Bentley Continental Flying Spur"),
      translator.translate("Bentley Continental GT"),
      translator.translate("Bentley Mulsanne"),
      translator.translate("Bentley Other"),
    ];
    audi = [
      translator.translate("Audi A1"),
      translator.translate("Audi A3"),
      translator.translate("Audi A4"),
      translator.translate("Audi A5"),
      translator.translate("Audi A6"),
      translator.translate("Audi A7"),
      translator.translate("Audi A8"),
      translator.translate("Audi Q2"),
      translator.translate("Audi Q3"),
      translator.translate("Audi Q5"),
      translator.translate("Audi Q7"),
      translator.translate("Audi Q8"),
      translator.translate("Audi R8"),
      translator.translate("Audi S3/RS3"),
      translator.translate("Audi S4/RS4"),
      translator.translate("Audi S5/RS5"),
      translator.translate("Audi S6/RS6"),
      translator.translate("Audi S7/RS7"),
      translator.translate("Audi S8"),
      translator.translate("Audi TT")
    ];
    astonMartin = [
      translator.translate("Aston Martin DB11 "),
      translator.translate("Aston Martin DB9"),
      translator.translate("Aston Martin DBS "),
      translator.translate("Aston Martin Other"),
      translator.translate("Aston Martin Rapide"),
      translator.translate("Aston Martin Vanquish"),
      translator.translate("Aston Martin Vantage "),
      translator.translate("Aston Martin Virage"),
      translator.translate("Aston Martin Zagato"),
    ];
    alfaRomeo = [
      translator.translate("Alfa Romeo 156/159"),
      translator.translate("Alfa Romeo 4C"),
      translator.translate("Alfa Romeo Giulia"),
      translator.translate("Alfa Romeo GIULIETTA"),
      translator.translate("Alfa Romeo GTV/GT"),
      translator.translate("Alfa Romeo Mito"),
      translator.translate("Alfa Romeo Spider "),
      translator.translate("Alfa Romeo Stelvio"),
    ];

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      padding = 6.w;
      padding2 = 7.w;
      if (SizerUtil.deviceType == DeviceType.tablet) {
        padding = 5.w;
        padding2 = 6.w;
      }
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Transform.scale(
              scale: leadingSize,
              child: IconButton(
                icon: Icon(Icons.arrow_back_sharp),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
          title: Text(
            translator.translate("Add used car"),
            style: TextStyle(color: Colors.black, fontSize: 5.5.w),
          ),
          elevation: 0,
          backgroundColor: Colors.white10,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(5.w),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildName(context, MediaQuery.of(context).size.width,
                        translator.translate("Title"), 1, 2),
                    SizedBox(
                      height: 5.w,
                    ),
                    DropdownButtonFormField(
                      validator: (value) => value == null
                          ? translator.translate('Required')
                          : null,
                      isExpanded: true,
                      hint: Text("${translator.translate("Choose Type")}",
                          style: TextStyle(fontSize: 4.w)),
                      value: _selectedLocationcartype3,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          focusColor: Colors.grey,
                          hoverColor: Colors.grey,
                          contentPadding:
                              EdgeInsets.fromLTRB(15, padding, 15, 0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(5.0),
                            ),
                          )),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocationcartype3 = newValue;
                          choice = carsModels.indexOf(newValue);
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return carsModels.map<Widget>((dynamic text) {
                          return Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList();
                      },
                      items: carsModels
                          .map<DropdownMenuItem<dynamic>>((dynamic text) {
                        return DropdownMenuItem<dynamic>(
                          value: text,
                          child: Column(
                            children: [
                              Text(text,
                                  maxLines: 3, overflow: TextOverflow.ellipsis),
                              Divider(),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    if (choice == 0)
                      _buildDropDown(translator.translate("Choose Type"),
                          alfaRomeo, 0, _selectedLocatioNalfaRomeo),
                    if (choice == 1)
                      _buildDropDown(translator.translate("Choose Type"),
                          astonMartin, 1, _selectedLocatioNastonMartin),
                    if (choice == 2)
                      _buildDropDown(translator.translate("Choose Type"), audi,
                          2, _selectedLocatioNaudi),
                    if (choice == 3)
                      _buildDropDown(translator.translate("Choose Type"), bmw,
                          3, _selectedLocatioNbmw),
                    if (choice == 4)
                      _buildDropDown(translator.translate("Choose Type"),
                          bentley, 4, _selectedLocatioNbentley),
                    if (choice == 5)
                      _buildDropDown(translator.translate("Choose Type"),
                          borgward, 5, _selectedLocatioNborgward),
                    if (choice == 6)
                      _buildDropDown(translator.translate("Choose Type"),
                          brilliance, 7, _selectedLocatioNbrilliance),
                    if (choice == 7)
                      _buildDropDown(translator.translate("Choose Type"),
                          bugatti, 0, _selectedLocatioNbugatti),
                    if (choice == 8)
                      _buildDropDown(translator.translate("Choose Type"), cmc,
                          0, _selectedLocatioNcmc),
                    if (choice == 9)
                      _buildDropDown(translator.translate("Choose Type"),
                          cadillac, 0, _selectedLocatioNcadillac),
                    if (choice == 10)
                      _buildDropDown(translator.translate("Choose Type"),
                          changan, 0, _selectedLocatioNchangan),
                    if (choice == 11)
                      _buildDropDown(translator.translate("Choose Type"),
                          chevrolet, 0, _selectedLocatioNchevrolet),
                    if (choice == 12)
                      _buildDropDown(translator.translate("Choose Type"),
                          chrysler, 0, _selectedLocatioNchrysler),
                    if (choice == 13)
                      _buildDropDown(translator.translate("Choose Type"),
                          citroen, 0, _selectedLocatioNcitroen),
                    if (choice == 14)
                      _buildDropDown(translator.translate("Choose Type"),
                          daihatsu, 0, _selectedLocatioNdaihatsu),
                    if (choice == 15)
                      _buildDropDown(translator.translate("Choose Type"), dodge,
                          0, _selectedLocatioNdodge),
                    if (choice == 16)
                      _buildDropDown(translator.translate("Choose Type"),
                          ferrari, 0, _selectedLocatioNferrari),
                    if (choice == 17)
                      _buildDropDown(translator.translate("Choose Type"), fiat,
                          0, _selectedLocatioNfiat),
                    /*if (choice == 18)
                      _buildDropDown(translator.translate("Choose Type"),
                          fisker, 0, _selectedLocatioNfisker),*/
                    if (choice == 18)
                      _buildDropDown(translator.translate("Choose Type"), ford,
                          0, _selectedLocatioNford),
                    if (choice == 19)
                      _buildDropDown(translator.translate("Choose Type"), foton,
                          0, _selectedLocatioNfoton),
                    if (choice == 20)
                      _buildDropDown(translator.translate("Choose Type"), gac,
                          0, _selectedLocatioNgac),
                    if (choice == 21)
                      _buildDropDown(translator.translate("Choose Type"), gmc,
                          0, _selectedLocatioNgmc),
                    if (choice == 22)
                      _buildDropDown(translator.translate("Choose Type"), geely,
                          0, _selectedLocatioNgeely),
                    if (choice == 23)
                      _buildDropDown(translator.translate("Choose Type"),
                          genesis, 0, _selectedLocatioNgenesis),
                    /*  if (choice == 24)
                      _buildDropDown(translator.translate("Choose Type"),
                          grandTiger, 0, _selectedLocatioNgrandTiger),*/
                    /* if (choice == 24)
                      _buildDropDown(translator.translate("Choose Type"),
                          greatWall, 0, _selectedLocatioNgreatWall),*/
                    if (choice == 24)
                      _buildDropDown(translator.translate("Choose Type"), haval,
                          0, _selectedLocatioNhaval),
                    if (choice == 25)
                      _buildDropDown(translator.translate("Choose Type"), honda,
                          0, _selectedLocatioNhonda),
                    /* if (choice == 26)
                      _buildDropDown(translator.translate("Choose Type"),
                          hongqi, 0, _selectedLocatioNhongqi),*/
                    if (choice == 26)
                      _buildDropDown(translator.translate("Choose Type"),
                          hummer, 0, _selectedLocatioNhummer),
                    if (choice == 27)
                      _buildDropDown(translator.translate("Choose Type"),
                          hyundai, 0, _selectedLocatioNhyundai),
                    if (choice == 28)
                      _buildDropDown(translator.translate("Choose Type"),
                          infiniti, 0, _selectedLocatioNinfiniti),
                    if (choice == 29)
                      _buildDropDown(translator.translate("Choose Type"), isuzu,
                          0, _selectedLocatioNisuzu),
                    if (choice == 30)
                      _buildDropDown(translator.translate("Choose Type"), jAC,
                          0, _selectedLocatioNjAC),
                    if (choice == 31)
                      _buildDropDown(translator.translate("Choose Type"),
                          jaguar, 0, _selectedLocatioNjaguar),
                    if (choice == 32)
                      _buildDropDown(translator.translate("Choose Type"), jeep,
                          0, _selectedLocatioNjeep),
                    if (choice == 33)
                      _buildDropDown(translator.translate("Choose Type"),
                          jetour, 0, _selectedLocatioNjetour),
                    if (choice == 34)
                      _buildDropDown(translator.translate("Choose Type"), kia,
                          0, _selectedLocatioNkia),
                    /* if (choice == 36)
                      _buildDropDown(translator.translate("Choose Type"),
                          kingLong, 0, _selectedLocatioNkingLong),*/
                    if (choice == 35)
                      _buildDropDown(translator.translate("Choose Type"),
                          lamborghini, 0, _selectedLocatioNlamborghini),
                    if (choice == 36)
                      _buildDropDown(translator.translate("Choose Type"),
                          lancia, 0, _selectedLocatioNlancia),
                    if (choice == 37)
                      _buildDropDown(translator.translate("Choose Type"),
                          landRover, 0, _selectedLocatioNlandRover),
                    if (choice == 38)
                      _buildDropDown(translator.translate("Choose Type"), lexus,
                          0, _selectedLocatioNlexus),
                    if (choice == 39)
                      _buildDropDown(translator.translate("Choose Type"),
                          lincoln, 0, _selectedLocatioNlincoln),
                    if (choice == 40)
                      _buildDropDown(translator.translate("Choose Type"), lotus,
                          0, _selectedLocatioNlotus),
                    if (choice == 41)
                      _buildDropDown(translator.translate("Choose Type"), mg, 0,
                          _selectedLocatioNmg),
                    if (choice == 42)
                      _buildDropDown(translator.translate("Choose Type"), mINI,
                          0, _selectedLocatioNmINI),
                    if (choice == 43)
                      _buildDropDown(translator.translate("Choose Type"),
                          mahindra, 0, _selectedLocatioNmahindra),
                    if (choice == 44)
                      _buildDropDown(translator.translate("Choose Type"),
                          maserati, 0, _selectedLocatioNmaserati),
                    if (choice == 45)
                      _buildDropDown(translator.translate("Choose Type"),
                          maybach, 0, _selectedLocatioNmaybach),
                    if (choice == 46)
                      _buildDropDown(translator.translate("Choose Type"), mazda,
                          0, _selectedLocatioNmazda),
                    if (choice == 47)
                      _buildDropDown(translator.translate("Choose Type"),
                          mcLaren, 0, _selectedLocatioNmcLaren),
                    if (choice == 48)
                      _buildDropDown(translator.translate("Choose Type"),
                          mercedesBenz, 0, _selectedLocatioNmercedesBenz),
                    if (choice == 49)
                      _buildDropDown(translator.translate("Choose Type"),
                          mercury, 0, _selectedLocatioNmercury),
                    if (choice == 50)
                      _buildDropDown(translator.translate("Choose Type"),
                          mitsubishi, 0, _selectedLocatioNmitsubishi),
                    if (choice == 51)
                      _buildDropDown(translator.translate("Choose Type"),
                          morgan, 0, _selectedLocatioNmorgan),
                    if (choice == 52)
                      _buildDropDown(translator.translate("Choose Type"),
                          nissan, 0, _selectedLocatioNnissan),
                    if (choice == 53)
                      _buildDropDown(translator.translate("Choose Type"), opel,
                          0, _selectedLocatioNopel),
                    if (choice == 54)
                      _buildDropDown(translator.translate("Choose Type"),
                          othermake, 0, _selectedLocatioNothermake),
                    if (choice == 55)
                      _buildDropDown(translator.translate("Choose Type"),
                          oullim, 0, _selectedLocatioNoullim),
                    if (choice == 56)
                      _buildDropDown(translator.translate("Choose Type"),
                          peugeot, 0, _selectedLocatioNpeugeot),
                    if (choice == 57)
                      _buildDropDown(translator.translate("Choose Type"),
                          pontiac, 0, _selectedLocatioNpontiac),
                    if (choice == 58)
                      _buildDropDown(translator.translate("Choose Type"),
                          porsche, 0, _selectedLocatioNporsche),
                    if (choice == 59)
                      _buildDropDown(translator.translate("Choose Type"),
                          proton, 0, _selectedLocatioNproton),
                    if (choice == 60)
                      _buildDropDown(translator.translate("Choose Type"),
                          renault, 0, _selectedLocatioNrenault),
                    if (choice == 61)
                      _buildDropDown(translator.translate("Choose Type"),
                          rollsRoyce, 0, _selectedLocatioNrollsRoyce),
                    if (choice == 62)
                      _buildDropDown(translator.translate("Choose Type"), rover,
                          0, _selectedLocatioNrover),
                    if (choice == 63)
                      _buildDropDown(translator.translate("Choose Type"), seat,
                          0, _selectedLocatioNseat),
                    if (choice == 64)
                      _buildDropDown(translator.translate("Choose Type"), skoda,
                          0, _selectedLocatioNskoda),
                    if (choice == 65)
                      _buildDropDown(translator.translate("Choose Type"), smart,
                          0, _selectedLocatioNsmart),
                    if (choice == 66)
                      _buildDropDown(translator.translate("Choose Type"),
                          soueast, 0, _selectedLocatioNsoueast),
                    if (choice == 67)
                      _buildDropDown(translator.translate("Choose Type"),
                          ssangYong, 0, _selectedLocatioNssangYong),
                    if (choice == 68)
                      _buildDropDown(translator.translate("Choose Type"),
                          subaru, 0, _selectedLocatioNsubaru),
                    if (choice == 69)
                      _buildDropDown(translator.translate("Choose Type"),
                          suzuki, 0, _selectedLocatioNsuzuki),
                    if (choice == 70)
                      _buildDropDown(translator.translate("Choose Type"), tata,
                          0, _selectedLocatioNtata),
                    if (choice == 71)
                      _buildDropDown(translator.translate("Choose Type"), tesla,
                          0, _selectedLocatioNtesla),
                    if (choice == 72)
                      _buildDropDown(translator.translate("Choose Type"),
                          toyota, 0, _selectedLocatioNtoyota),
                    /* if (choice == 74)
                      _buildDropDown(translator.translate("Choose Type"), uaz,
                          0, _selectedLocatioNuaz),*/
                    if (choice == 73)
                      _buildDropDown(translator.translate("Choose Type"),
                          volkswagen, 0, _selectedLocatioNvolkswagen),
                    if (choice == 74)
                      _buildDropDown(translator.translate("Choose Type"), volvo,
                          0, _selectedLocatioNvolvo),
                    /*if (choice == 77)
                      _buildDropDown(translator.translate("Choose Type"),
                          wMotors, 0, _selectedLocatioNwMotors),*/
                    _buildName(context, MediaQuery.of(context).size.width,
                        translator.translate("Price"), 2, 1),
                    SizedBox(
                      height: 5.w,
                    ),
                    TextField(
                      maxLines: 8,
                      controller: myController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 4.w),
                          hintText:
                              translator.translate("Write your description"),
                          fillColor: Colors.grey,
                          focusColor: Colors.grey,
                          hoverColor: Colors.grey,
                          contentPadding:
                              EdgeInsets.fromLTRB(15, padding, 15, 0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(5.0),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Divider(thickness: 1),
                    Row(
                      children: [
                        Text(
                          translator.translate("Featured image"),
                          style: TextStyle(color: Colors.black, fontSize: 5.w),
                        ),
                        SizedBox(width: 2.w),
                        if (loadingFeatured == true)
                          SizedBox(
                            height: 4.w,
                            width: 4.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.orange[300]),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    featuredImage != null
                        ? Container(
                            height: 50.w,
                            width: 50.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: FileImage(featuredImage),
                            )),
                          )
                        : Container(),
                    Row(
                      children: [
                        Container(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.w
                              : 10.w,
                          width: SizerUtil.deviceType == DeviceType.mobile
                              ? 30.w
                              : 25.w,
                          child: OutlinedButton(
                            onPressed: () {
                              chooseImage(ImageSource.camera, 1);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.black,
                                  size: 5.w,
                                ),
                                Text(
                                  translator.translate("Camera"),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 3.5.w),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.w
                              : 10.w,
                          width: SizerUtil.deviceType == DeviceType.mobile
                              ? 30.w
                              : 25.w,
                          child: OutlinedButton(
                            onPressed: () {
                              chooseImage(ImageSource.gallery, 1);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.black,
                                  size: 5.w,
                                ),
                                Text(
                                  translator.translate("Galary"),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 3.5.w),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 1),
                    Row(
                      children: [
                        Text(
                          translator.translate("Galary image"),
                          style: TextStyle(color: Colors.black, fontSize: 5.w),
                        ),
                        SizedBox(width: 2.w),
                        if (loadingGalary == true)
                          SizedBox(
                            height: 4.w,
                            width: 4.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.orange[300]),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    imageFileList != null
                        ? SizedBox(
                            height: 40.w,
                            child: GridView.count(
                              // physics: new NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              children:
                                  List.generate(imageFileList.length, (index) {
                                return Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Container(
                                      height: 50.w,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: FileImage(
                                            File(imageFileList[index].path)),
                                      )),
                                    ));
                              }),
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        Container(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.w
                              : 10.w,
                          width: SizerUtil.deviceType == DeviceType.mobile
                              ? 30.w
                              : 25.w,
                          child: OutlinedButton(
                            onPressed: () {
                              chooseImage(ImageSource.camera, 2);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.black,
                                  size: 5.w,
                                ),
                                Text(
                                  translator.translate("Camera"),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 3.5.w),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.w
                              : 10.w,
                          width: SizerUtil.deviceType == DeviceType.mobile
                              ? 30.w
                              : 25.w,
                          child: OutlinedButton(
                            onPressed: () {
                              chooseImage(ImageSource.gallery, 2);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.black,
                                  size: 5.w,
                                ),
                                Text(
                                  translator.translate("Galary"),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 3.5.w),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.w
                              : 10.w,
                          width: SizerUtil.deviceType == DeviceType.mobile
                              ? 25.w
                              : 20.w,
                          child: ElevatedButton(
                            child: Text(
                              translator.translate("Upload Images"),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 4.w),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            onPressed: () async {
                              uploadfeaturedImage();
                            },
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.w
                              : 10.w,
                          width: SizerUtil.deviceType == DeviceType.mobile
                              ? 25.w
                              : 20.w,
                          child: ElevatedButton(
                            child: Text(
                              translator.translate("Next"),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 4.w),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            onPressed: () async { 
 
                              
                              if (doseLoadFeaturedImage &&
                                  doseLoadGalaryImage) {
                                if (!_formKey.currentState.validate()) return;
                                _formKey.currentState.save();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return PlaceUsedCarForSaleInputForm2(
                                          car: car,
                                          carModel: carModelAPI,
                                          title: title,
                                          price: price,
                                          description: myController.text,
                                          featuredImageID: featuredImageID,
                                          galaryImageIDArray: testlist);
                                    },
                                  ),
                                );
                              } else {
                                obj.snackBarImageStatus(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.w)
                  ]),
            ),
          ),
        ));
  }
}

class PlaceUsedCarForSaleInputForm2 extends StatefulWidget {
  //final dynamic title, decription;
  // final dynamic price ;
  final dynamic car, carModel, price, featuredImageID;
  final List<dynamic> galaryImageIDArray;
  final dynamic title, description;
  PlaceUsedCarForSaleInputForm2({
    @required this.car,
    @required this.carModel,
    @required this.price,
    @required this.title,
    @required this.description,
    @required this.featuredImageID,
    @required this.galaryImageIDArray,
  });
  @override
  _PlaceUsedCarForSaleInputForm2State createState() =>
      _PlaceUsedCarForSaleInputForm2State();
}

class _PlaceUsedCarForSaleInputForm2State
    extends State<PlaceUsedCarForSaleInputForm2>
    with AutomaticKeepAliveClientMixin {
  NotesServicee get notesService => GetIt.I<NotesServicee>();

  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic _selectedLocationTransmission,
      location,
      typee,
      carColor,
      model,
      fullName,
      trim;
  dynamic phoneNumber, discount, yearOfManuf, doors, km, usedCars;
  List<dynamic> type = ["ok"], transmission; // Option 2

  List<dynamic> heavyVehicles;
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  Widget _buildDropDown(dynamic text, List<dynamic> list, dynamic choice,
      dynamic _selectedLocation2) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 4.5.w),
          fillColor: Colors.grey,
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
          contentPadding: EdgeInsets.fromLTRB(15, padding, 15, 0),
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
          )),
      selectedItemBuilder: (BuildContext context) {
        return list.map<Widget>((dynamic text) {
          return Text(
            text,
            overflow: TextOverflow.ellipsis,
          );
        }).toList();
      },
      items: list.map<DropdownMenuItem<dynamic>>((dynamic location) {
        return DropdownMenuItem<dynamic>(
          value: location,
          child: Column(
            children: [
              Text(location, maxLines: 3, overflow: TextOverflow.ellipsis),
              Divider(),
              SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
      hint: Text(text),
      value: _selectedLocation2,
      onChanged: (dynamic newValue) {
        setState(() {
          if (choice == 0) {
            _selectedLocationTransmission = newValue;
          }
        });
      },
      // ignore: missing_return
      validator: (value) =>
          value == null ? translator.translate('Required') : null,
    );
  }

  Widget _buildName(BuildContext context, double x, dynamic text,
      dynamic choice2, dynamic choice3) {
    return Container(
      width: x,
      child: TextFormField(
        keyboardType: choice3 == 1 ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15, padding2, 15, 0),
            isDense: true,
            errorStyle: TextStyle(fontSize: 11.0),
            labelText: text,
            labelStyle: TextStyle(fontSize: 4.5.w),
            enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: new BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.black, width: 1.0))),
        style: new TextStyle(color: Colors.black),
        // ignore: missing_return
        validator: (dynamic value) {
          if (value.isEmpty) return translator.translate('Required');
          if (choice2 == 1 ||
              choice2 == 2 ||
              choice2 == 5 ||
              choice2 == 6 ||
              choice2 == 9) {
            if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
                    .hasMatch(value) &&
                !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
                    .hasMatch(value))
              return translator.translate('Please enter numbers');
          }
        },
        onSaved: (value) {
          if (choice2 == 1) {
            phoneNumber =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice2 == 2) {
            discount = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice2 == 3) {
            typee = value;
          }
          if (choice2 == 4) {
            model = value;
          }
          if (choice2 == 5) {
            yearOfManuf =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice2 == 6) {
            km = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice2 == 7) {
            carColor = value;
          }
          if (choice2 == 8) {
            trim = value;
          }
          if (choice2 == 9) {
            doors = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice2 == 10) {
            location = value;
          }
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    transmission = [
      translator.translate("Automatic"),
      translator.translate("Manual"),
    ];

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      padding3 = 20.h;
      padding = 6.w;
      padding2 = 7.w;
      if (SizerUtil.height < 600) padding3 = 30.h;
      if (SizerUtil.height < 735 && SizerUtil.height > 650) padding3 = 35.h;
      if (SizerUtil.height < 1290 && SizerUtil.height >= 738) padding3 = 45.h;
      padding2 = 7.w;
      if (SizerUtil.deviceType == DeviceType.tablet) {
        padding = 5.w;
        padding2 = 6.w;
        padding3 = 35.h;
        if (SizerUtil.height > 1600) padding3 = 45.h;
      }
    }
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Transform.scale(
            scale: leadingSize,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        title: Text(
          translator.translate("Add used car"),
          style: TextStyle(color: Colors.black, fontSize: 5.5.w),
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5.w),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 6.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(context, 42.w,
                          translator.translate("Your phone number"), 1, 1),
                      _buildName(
                          context, 42.w, translator.translate("Discount"), 2, 1)
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(
                          context, 42.w, translator.translate("Typee"), 3, 2),
                      _buildName(
                          context, 42.w, translator.translate("Modell"), 4, 2),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("year of manufacture"), 5, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("kilometers"), 6, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("transmission"),
                      transmission, 0, _selectedLocationTransmission),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Car Color"), 7, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Trim"), 8, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Doors"), 9, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Location"), 10, 2),
                  SizedBox(
                    height: 15.w,
                  ),
                  /* _buildDropDown(
                    translator.translate("BodyCondition"),
                    heavyVehicles,
                    1,
                  ),*/
                  Row(
                    children: [
                      Container(
                        height: SizerUtil.deviceType == DeviceType.mobile
                            ? 12.w
                            : 10.w,
                        width: SizerUtil.deviceType == DeviceType.mobile
                            ? 25.w
                            : 20.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            translator.translate("Prev"),
                            style:
                                TextStyle(color: Colors.white, fontSize: 4.w),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: SizerUtil.deviceType == DeviceType.mobile
                            ? 12.w
                            : 10.w,
                        width: SizerUtil.deviceType == DeviceType.mobile
                            ? 25.w
                            : 20.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                          ),
                          onPressed: () async {
                            if (!_formKey.currentState.validate()) return;

                            _formKey.currentState.save();

                            if (translator.currentLanguage == 'ar') {
                              usedCars = 445;
                            }
                            if (translator.currentLanguage == 'en') {
                              usedCars = 443;
                            }
                            await notesService.usedCars(
                                widget.featuredImageID,
                                widget.galaryImageIDArray,
                                widget.title,
                                widget.car,
                                widget.carModel,
                                widget.price,
                                widget.description,
                                phoneNumber,
                                discount,
                                typee,
                                model,
                                yearOfManuf,
                                km,
                                fullName,
                                trim,
                                doors,
                                location,
                                _selectedLocationTransmission,
                                carColor,
                                usedCars,
                                context);
                          },
                          child: Text(
                            translator.translate("Submit"),
                            style:
                                TextStyle(color: Colors.white, fontSize: 4.w),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
