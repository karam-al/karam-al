import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:sizer/sizer.dart';

import 'notes_service.dart';

class MotorcycleInputForm extends StatefulWidget {
  @override
  _MotorcycleInputFormState createState() => _MotorcycleInputFormState();
}

class _MotorcycleInputFormState extends State<MotorcycleInputForm> {
  final myController = TextEditingController();
  dynamic _index = 10, _index2 = 10;
  dynamic motorcylceType, sportBikeType;
  dynamic _selectedLocationmotorcycle, _selectedLocationSportbike;
  /////////////////////////////////////

  double padding = 0, padding2 = 0, leadingSize = 0;

  dynamic price;
  dynamic title, description;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> type = ["ok"], motorcycle, sportBike; // Option 2

  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  chooseImage(ImageSource source, dynamic x) async {
    //  final List<> images = await picker.pickMultiImage();
    // final pickedFile = await picker.getImage(source: source);
    setState(() {
      //   if (x == 1 && pickedFile != null) imageFile = File(pickedFile.path);

      //    if (x == 2 && pickedFile != null) imageFile2 = File(pickedFile.path);
    });
  }

  /* bool _phoneNumberValidator(dynamic value) {
    Pattern pattern = r'\d';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return true;
    else
      return false;
  }*/

  Widget _buildDropDown(dynamic text, List<dynamic> list, dynamic choice,
      dynamic _selectedLocation2) {
    return Column(
      children: [
        DropdownButtonFormField(
          validator: (value) =>
              value == null ? translator.translate('Required') : null,
          isExpanded: true,
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
            _index2 = list.indexOf(newValue);
            setState(() {
              if (choice == 2) {
                _selectedLocationSportbike = newValue;
                if (translator.currentLanguage == 'ar') {
                  if (_index == 2) {
                    if (_index2 == 0) {
                      sportBikeType = 1536;
                    }
                    if (_index2 == 1) {
                      sportBikeType = 1538;
                    }
                    if (_index2 == 2) {
                      sportBikeType = 1544;
                    }
                  }
                }
                if (translator.currentLanguage == 'en') {
                  if (_index == 2) {
                    if (_index2 == 0) {
                      sportBikeType = 1534;
                    }
                    if (_index2 == 1) {
                      sportBikeType = 1540;
                    }
                    if (_index2 == 2) {
                      sportBikeType = 1542;
                    }
                  }
                }
              }
            });
          },
        ),
        SizedBox(
          height: 5.w,
        )
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
        validator: (dynamic value) {
          if (value.isEmpty) return translator.translate('Required');
          if (choice == 2) {
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
    motorcycle = [
      translator.translate("Trailer"),
      translator.translate("Standard"),
      translator.translate("Sport Bike"),
      translator.translate("Scooter"),
      translator.translate("Off-Road"),
      translator.translate("Karting"),
      translator.translate("Cruiser"),
      translator.translate("Café racer"),
      translator.translate("Adventure"),
      translator.translate("Trike"),
      translator.translate("Otheer"),
    ];
    sportBike = [
      translator.translate("Hyper_sports"),
      translator.translate("Super_bike"),
      translator.translate("Super_sports"),
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
            translator.translate("Add Motorcycle"),
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
                      value: _selectedLocationmotorcycle,
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
                          _selectedLocationmotorcycle = newValue;
                          _index = motorcycle.indexOf(newValue);
                          if (translator.currentLanguage == 'en') {
                            if (_index == 0) motorcylceType = 1508;
                            if (_index == 1) motorcylceType = 1504;
                            if (_index == 2) motorcylceType = 1494;
                            if (_index == 3) motorcylceType = 1502;
                            if (_index == 4) motorcylceType = 1500;
                            if (_index == 5) motorcylceType = 1510;
                            if (_index == 6) motorcylceType = 1498;
                            if (_index == 7) motorcylceType = 1506;
                            if (_index == 8) motorcylceType = 1496;
                            if (_index == 9) motorcylceType = 7621;
                            if (_index == 10) motorcylceType = 1512;
                          }
                          if (translator.currentLanguage == 'ar') {
                            if (_index == 0) motorcylceType = 1532;
                            if (_index == 1) motorcylceType = 1530;
                            if (_index == 2) motorcylceType = 1528;
                            if (_index == 3) motorcylceType = 1526;
                            if (_index == 4) motorcylceType = 1524;
                            if (_index == 5) motorcylceType = 1522;
                            if (_index == 6) motorcylceType = 1520;
                            if (_index == 7) motorcylceType = 1518;
                            if (_index == 8) motorcylceType = 1516;
                            if (_index == 9) motorcylceType = 7623;
                            if (_index == 10) motorcylceType = 1514;
                          }
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return motorcycle.map<Widget>((dynamic text) {
                          return Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList();
                      },
                      items: motorcycle
                          .map<DropdownMenuItem<dynamic>>((dynamic text) {
                        return DropdownMenuItem<dynamic>(
                          value: text,
                          child: Column(
                            children: [
                              Text(text,
                                  maxLines: 3, overflow: TextOverflow.ellipsis),
                              SizedBox(
                                height: 10,
                              ),
                              Divider()
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    /* _buildDropDown(
                        translator.translate("Select price per"), per, 1),*/
                    SizedBox(
                      height: 5.w,
                    ),
                    if (_index == 2)
                      _buildDropDown(translator.translate("Choose Type"),
                          sportBike, 2, _selectedLocationSportbike),
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
                    Text(
                      translator.translate("Image"),
                      style: TextStyle(color: Colors.black, fontSize: 5.w),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    imageFile != null
                        ? Container(
                            height: 50.w,
                            width: 50.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: FileImage(imageFile),
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
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    SizedBox(
                      height: 5.w,
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
                              translator.translate("Next"),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 4.w),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            onPressed: () {
                              if (!_formKey.currentState.validate()) return;

                              _formKey.currentState.save();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MotorcycleInputForm2(
                                        description: myController.text,
                                        title: title,
                                        indexOfMotor: _index,
                                        price: price,
                                        motorCycleType: motorcylceType,
                                        sportBikeType: sportBikeType);
                                  },
                                ),
                              );
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

class MotorcycleInputForm2 extends StatefulWidget {
  final dynamic motorCycleType, price, sportBikeType, indexOfMotor;
  final dynamic title, description;
  MotorcycleInputForm2({
    @required this.motorCycleType,
    @required this.indexOfMotor,
    this.sportBikeType,
    @required this.price,
    @required this.title,
    @required this.description,
  });
  @override
  _MotorcycleInputForm2State createState() => _MotorcycleInputForm2State();
}

class _MotorcycleInputForm2State extends State<MotorcycleInputForm2>
    with AutomaticKeepAliveClientMixin {
  NotesServicee get notesService => GetIt.I<NotesServicee>();
  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic phoneNumber, discount, motorcycle;
  dynamic location;
  List<dynamic> type = ["ok"],
      age,
      sellerType,
      warranty,
      length,
      condition,
      usage;

  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
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
        validator: (value) {
          if (value.isEmpty) return translator.translate('Required');
          if (choice == 1 || choice == 2) {
            if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
                    .hasMatch(value) &&
                !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
                    .hasMatch(value))
              return translator.translate('Please enter numbers');
          }
        },
        onSaved: (value) {
          if (choice == 1) {
            phoneNumber =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 2) {
            discount = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 3) {
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
          translator.translate("Add Motorcycle"),
          style: TextStyle(color: Colors.black, fontSize: 5.5.w),
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.all(5.w),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 6.w,
                ),
                _buildName(context, double.infinity,
                    translator.translate("Your phone number"), 1, 1),
                SizedBox(
                  height: 5.w,
                ),
                _buildName(context, double.infinity,
                    translator.translate("Discount"), 2, 1),
                SizedBox(
                  height: 5.w,
                ),
                _buildName(context, double.infinity,
                    translator.translate("Location"), 3, 2),
                Spacer(),
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
                          style: TextStyle(color: Colors.white, fontSize: 4.w),
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
                          if (translator.currentLanguage == 'ar')
                            motorcycle = 449;
                          if (translator.currentLanguage == 'en')
                            motorcycle = 447;
                          await notesService.motorcycleMotors(
                              widget.indexOfMotor,
                              widget.title,
                              widget.motorCycleType,
                              widget.price,
                              widget.description,
                              phoneNumber,
                              discount,
                              location,
                              widget.sportBikeType,
                              motorcycle,
                              context);
                        },
                        child: Text(
                          translator.translate("Submit"),
                          style: TextStyle(color: Colors.white, fontSize: 4.w),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
