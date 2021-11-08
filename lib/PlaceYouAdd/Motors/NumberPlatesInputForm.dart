import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'notes_service.dart';

class NumberPlateInputForm extends StatefulWidget {
  @override
  _NumberPlateInputFormState createState() => _NumberPlateInputFormState();
}

class _NumberPlateInputFormState extends State<NumberPlateInputForm> {
  final myController = TextEditingController();
  dynamic _index = 10, _index2 = 10, numberPlatesAPI, numberPlatesAPIChild;
  dynamic _selectedLocationFirstList,
      _selectedLocationSecondList,
      _selectedLocationcartype3;
  /////////////////////////////////////

  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price;
  dynamic title, description;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> type = ["ok"], numberPlate, firstList, secondList; // Option 2

  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  chooseImage(ImageSource source, dynamic x) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (x == 1) imageFile = File(pickedFile.path);
      if (x == 2) imageFile2 = File(pickedFile.path);
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
            setState(() {
              _index2 = list.indexOf(newValue);
              if (choice == 0 || choice == 5) {
                _selectedLocationSecondList = newValue;
              }
              if (choice != 5 && choice != 0) {
                _selectedLocationFirstList = newValue;
              }
              if (translator.currentLanguage == 'en') {
                if (_index == 0) {
                  if (_index2 == 0) numberPlatesAPIChild = 8019;
                  if (_index2 == 1) numberPlatesAPIChild = 8005;
                  if (_index2 == 2) numberPlatesAPIChild = 8009;
                }
                if (_index == 1) {
                  if (_index2 == 0) numberPlatesAPIChild = 8031;
                  if (_index2 == 1) numberPlatesAPIChild = 8025;
                }
                if (_index == 2) {
                  if (_index2 == 0) numberPlatesAPIChild = 8075;
                  if (_index2 == 1) numberPlatesAPIChild = 8067;
                }
                if (_index == 3) {
                  if (_index2 == 0) numberPlatesAPIChild = 8087;
                  if (_index2 == 1) numberPlatesAPIChild = 8083;
                }
                if (_index == 4) {
                  if (_index2 == 0) numberPlatesAPIChild = 8123;
                  if (_index2 == 1) numberPlatesAPIChild = 8117;
                }
                if (_index == 5) {
                  if (_index2 == 0) numberPlatesAPIChild = 8055;
                  if (_index2 == 1) numberPlatesAPIChild = 8037;
                  if (_index2 == 2) numberPlatesAPIChild = 8047;
                }
                if (_index == 6) {
                  if (_index2 == 0) numberPlatesAPIChild = 8111;
                  if (_index2 == 1) numberPlatesAPIChild = 8103;
                }
              }

              if (translator.currentLanguage == 'ar') {
                if (_index == 0) {
                  if (_index2 == 0) numberPlatesAPIChild = 8021;
                  if (_index2 == 1) numberPlatesAPIChild = 8007;
                  if (_index2 == 2) numberPlatesAPIChild = 8015;
                }
                if (_index == 1) {
                  if (_index2 == 0) numberPlatesAPIChild = 8035;
                  if (_index2 == 1) numberPlatesAPIChild = 8029;
                }
                if (_index == 2) {
                  if (_index2 == 0) numberPlatesAPIChild = 8077;
                  if (_index2 == 1) numberPlatesAPIChild = 8069;
                }
                if (_index == 3) {
                  if (_index2 == 0) numberPlatesAPIChild = 8093;
                  if (_index2 == 1) numberPlatesAPIChild = 8085;
                }
                if (_index == 4) {
                  if (_index2 == 0) numberPlatesAPIChild = 8125;
                  if (_index2 == 1) numberPlatesAPIChild = 8119;
                }
                if (_index == 5) {
                  if (_index2 == 0) numberPlatesAPIChild = 8063;
                  if (_index2 == 1) numberPlatesAPIChild = 8039;
                  if (_index2 == 2) numberPlatesAPIChild = 8049;
                }
                if (_index == 6) {
                  if (_index2 == 0) numberPlatesAPIChild = 8115;
                  if (_index2 == 1) numberPlatesAPIChild = 8107;
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
    numberPlate = [
      translator.translate("Dubai Plate"),
      translator.translate("Abu Dhabi Plate"),
      translator.translate("Ajman Plate"),
      translator.translate("Fujairah Plate"),
      translator.translate("Ras al Khaimah Plate"),
      translator.translate("Sharjah Plate"),
      translator.translate("Umm al Quwain Plate"),
    ];
    firstList = [
      translator.translate("Motorcycle"),
      translator.translate("Private car"),
    ];
    secondList = [
      translator.translate("Motorcycle"),
      translator.translate("Private car"),
      translator.translate("Classic car"),
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
            translator.translate("Add Number Plate"),
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
                          _index = numberPlate.indexOf(newValue);
                          if (translator.currentLanguage == 'ar') {
                            if (_index == 0) numberPlatesAPI = 1787;
                            if (_index == 1) numberPlatesAPI = 1785;
                            if (_index == 2) numberPlatesAPI = 6426;
                            if (_index == 3) numberPlatesAPI = 1789;
                            if (_index == 4) numberPlatesAPI = 6428;
                            if (_index == 5) numberPlatesAPI = 6424;
                            if (_index == 6) numberPlatesAPI = 1783;
                          }
                          if (translator.currentLanguage == 'en') {
                            if (_index == 0) numberPlatesAPI = 1775;
                            if (_index == 1) numberPlatesAPI = 1777;
                            if (_index == 2) numberPlatesAPI = 6420;
                            if (_index == 3) numberPlatesAPI = 1779;
                            if (_index == 4) numberPlatesAPI = 6422;
                            if (_index == 5) numberPlatesAPI = 6418;
                            if (_index == 6) numberPlatesAPI = 1781;
                          }
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return numberPlate.map<Widget>((dynamic text) {
                          return Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList();
                      },
                      items: numberPlate
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
                    if (_index == 0 || _index == 6)
                      _buildDropDown(translator.translate("Choose Type"),
                          secondList, 0, _selectedLocationSecondList),
                    if (_index == 1 ||
                        _index == 2 ||
                        _index == 3 ||
                        _index == 4 ||
                        _index == 5 ||
                        _index == 7)
                      _buildDropDown(translator.translate("Choose Type"),
                          firstList, 1, _selectedLocationFirstList),
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
                    /*imageFile2 != null
                        ? Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: FileImage(imageFile2),
                            )),
                          )
                        : Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(color: Colors.grey)),
                    Row(
                      children: [
                        Container(
                          height: 12.w,
                          width: 25.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[300],
                            ),
                            onPressed: () {
                              chooseImage(ImageSource.camera, 2);
                            },
                            child: Text(
                              translator.translate("Camera"),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          height: 12.w,
                          width: 25.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[300],
                            ),
                            onPressed: () {
                              chooseImage(ImageSource.gallery, 2);
                            },
                            child: Text(
                              translator.translate("Galary"),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),*/
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
                                    return _NumberPlateInputForm2(
                                      numberPlateAPI: numberPlatesAPI,
                                      numberPlateAPIChild: numberPlatesAPIChild,
                                      price: price,
                                      title: title,
                                      description: description,
                                    );
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

class _NumberPlateInputForm2 extends StatefulWidget {
  final dynamic price, numberPlateAPI, numberPlateAPIChild;
  final dynamic title, description;
  _NumberPlateInputForm2({
    @required this.numberPlateAPI,
    @required this.numberPlateAPIChild,
    @required this.price,
    @required this.title,
    @required this.description,
  });
  @override
  __NumberPlateInputForm2State createState() => __NumberPlateInputForm2State();
}

class __NumberPlateInputForm2State extends State<_NumberPlateInputForm2>
    with AutomaticKeepAliveClientMixin {
  NotesServicee get notesService => GetIt.I<NotesServicee>();
  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic phoneNumber, discount, numberPlate;
  dynamic location, lang;

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
        validator: (dynamic value) {
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
            phoneNumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
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
          translator.translate("Add Number Plate"),
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
                  SizedBox(
                    height: 30.w,
                  ),
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
                            if (translator.currentLanguage == 'ar') {
                              numberPlate = 465;
                            }
                            if (translator.currentLanguage == 'en') {
                              numberPlate = 459;
                            }
                            if (!_formKey.currentState.validate()) return;

                            _formKey.currentState.save();

                            await notesService.numberPlate(
                                numberPlate,
                                widget.title,
                                widget.price,
                                widget.description,
                                phoneNumber,
                                discount,
                                location,
                                widget.numberPlateAPI,
                                widget.numberPlateAPIChild,context);
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
