import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'notes_service.dart';

class BoatsInputForm extends StatefulWidget {
  @override
  _BoatsInputFormInputFormState createState() =>
      _BoatsInputFormInputFormState();
}

class _BoatsInputFormInputFormState extends State<BoatsInputForm> {
  final myController = TextEditingController();
  dynamic _index = 10, _index2 = 10;
  dynamic newValuee;
  dynamic _selectedLocationcartype3,
      _selectedLocationMotorboats,
      _selectedLocationSailboats,
      _selectedLocationrowPaddleBoats;
  /////////////////////////////////////

  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price, boatsAPI, boatsAPIChild;
  dynamic title, description;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> type = ["ok"],
      boats,
      motorboats,
      sailboats,
      rowPaddleBoats; // Option 2

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
    return DropdownButtonFormField(
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
          if (translator.currentLanguage == 'ar') {
            if (choice == 0) {
              if (_index == 0) {
                //MotorBoats
                if (_index2 == 0) {
                  boatsAPIChild = 1750;
                }
                if (_index2 == 1) {
                  boatsAPIChild = 1752;
                }
                if (_index2 == 2) {
                  boatsAPIChild = 7941;
                }
                if (_index2 == 3) {
                  boatsAPIChild = 1754;
                }
                if (_index2 == 4) {
                  boatsAPIChild = 1756;
                }
                if (_index2 == 5) {
                  boatsAPIChild = 1758;
                }
                if (_index2 == 6) {
                  boatsAPIChild = 1760;
                }
                if (_index2 == 7) {
                  boatsAPIChild = 1748;
                }
              }
              _selectedLocationMotorboats = newValue;
            }
            if (choice == 1) {
              if (_index == 1) {
                if (_index2 == 0) {
                  boatsAPIChild = 1768;
                }
                if (_index2 == 1) {
                  boatsAPIChild = 7953;
                }
                if (_index2 == 2) {
                  boatsAPIChild = 7959;
                }
                if (_index2 == 3) {
                  boatsAPIChild = 7963;
                }
                if (_index2 == 4) {
                  boatsAPIChild = 7969;
                }
                if (_index2 == 5) {
                  boatsAPIChild = 1766;
                }
                if (_index2 == 6) {
                  boatsAPIChild = 7997;
                }
              }
              _selectedLocationSailboats = newValue;
            }
            if (choice == 2) {
              if (_index == 2) {
                if (_index2 == 0) {
                  boatsAPIChild = 7989;
                }
                if (_index2 == 1) {
                  boatsAPIChild = 1773;
                }
                if (_index2 == 2) {
                  boatsAPIChild = 7997;
                }
                _selectedLocationrowPaddleBoats = newValue;
              }
            }
          }
          if (translator.currentLanguage == 'en') {
            if (choice == 0) {
              if (_index == 0) {
                if (_index2 == 0) {
                  boatsAPIChild = 1734;
                }
                if (_index2 == 1) {
                  boatsAPIChild = 1736;
                }
                if (_index2 == 2) {
                  boatsAPIChild = 7937;
                }
                if (_index2 == 3) {
                  boatsAPIChild = 1738;
                }
                if (_index2 == 4) {
                  boatsAPIChild = 1740;
                }
                if (_index2 == 5) {
                  boatsAPIChild = 1742;
                }
                if (_index2 == 6) {
                  boatsAPIChild = 1744;
                }
                if (_index2 == 7) {
                  boatsAPIChild = 1746;
                }
              }
              _selectedLocationMotorboats = newValue;
            }
            if (choice == 1) {
              if (_index == 1) {
                if (_index2 == 0) {
                  boatsAPIChild = 1762;
                }
                if (_index2 == 1) {
                  boatsAPIChild = 7949;
                }
                if (_index2 == 2) {
                  boatsAPIChild = 7957;
                }
                if (_index2 == 3) {
                  boatsAPIChild = 7961;
                }
                if (_index2 == 4) {
                  boatsAPIChild = 7965;
                }
                if (_index2 == 5) {
                  boatsAPIChild = 1764;
                }
                if (_index2 == 6) {
                  boatsAPIChild = 7973;
                }
              }
              _selectedLocationSailboats = newValue;
            }
            if (choice == 2) {
              if (_index == 2) {
                if (_index2 == 0) {
                  boatsAPIChild = 7985;
                }
                if (_index2 == 1) {
                  boatsAPIChild = 1771;
                }
                if (_index2 == 2) {
                  boatsAPIChild = 7993;
                }
                _selectedLocationrowPaddleBoats = newValue;
              }
            }
          }
        });
      },
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
    boats = [
      translator.translate("Motorboats"),
      translator.translate("Sailboats"),
      translator.translate("Row/Paddle Boats"),
    ];

    motorboats = [
      translator.translate("Fishing Boat"),
      translator.translate("Outboard Dayboat"),
      translator.translate("Pontoon/House Boat"),
      translator.translate("Racing Boat"),
      translator.translate("Sleeper/Mini Yacht"),
      translator.translate("Wakeboarding/Ski Boat"),
      translator.translate("Yacht"),
      translator.translate("Other"),
    ];

    sailboats = [
      translator.translate("Catamaran"),
      translator.translate("Cruiser/Day Sailor"),
      translator.translate("DhowVoilier"),
      translator.translate("Dinghy"),
      translator.translate("Racer"),
      translator.translate("Sailing Yacht"),
      translator.translate("Other"),
    ];

    rowPaddleBoats = [
      translator.translate("Canoe/Row Boat"),
      translator.translate("Paddle Boat"),
      translator.translate("Other"),
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
            translator.translate("Add Boats"),
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
                          _index = boats.indexOf(newValue);
                          if (translator.currentLanguage == 'ar') {
                            if (_index == 0) {
                              boatsAPI = 1732;
                            }
                            if (_index == 1) {
                              boatsAPI = 1730;
                            }
                            if (_index == 2) {
                              boatsAPI = 1728;
                            }
                          }
                          if (translator.currentLanguage == 'en') {
                            if (_index == 0) {
                              boatsAPI = 1722;
                            }
                            if (_index == 1) {
                              boatsAPI = 1724;
                            }
                            if (_index == 2) {
                              boatsAPI = 1726;
                            }
                          }
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return boats.map<Widget>((dynamic text) {
                          return Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList();
                      },
                      items:
                          boats.map<DropdownMenuItem<dynamic>>((dynamic text) {
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
                    if (_index == 0)
                      _buildDropDown(translator.translate("Choose Type"),
                          motorboats, 0, _selectedLocationMotorboats),
                    if (_index == 1)
                      _buildDropDown(translator.translate("Choose Type"),
                          sailboats, 1, _selectedLocationSailboats),
                    if (_index == 2)
                      _buildDropDown(translator.translate("Choose Type"),
                          rowPaddleBoats, 2, _selectedLocationrowPaddleBoats),
                    if (_index == 0 || _index == 1 || _index == 2)
                      SizedBox(
                        height: 5.w,
                      ),
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
                                    return BoatsInputForm2(
                                      boatsAPI: boatsAPI,
                                      boatsAPIChild: boatsAPIChild,
                                      price: price,
                                      title: title,
                                      description: myController.text,
                                      selectedLocation: _index,
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

class BoatsInputForm2 extends StatefulWidget {
  final dynamic price, boatsAPI, boatsAPIChild, selectedLocation;
  final dynamic title, description;
  BoatsInputForm2({
    @required this.boatsAPI,
    @required this.boatsAPIChild,
    @required this.price,
    @required this.title,
    @required this.description,
    @required this.selectedLocation,
  });

  @override
  _BoatsInputForm2State createState() => _BoatsInputForm2State();
}

class _BoatsInputForm2State extends State<BoatsInputForm2>
    with AutomaticKeepAliveClientMixin {
  NotesServicee get notesService => GetIt.I<NotesServicee>();
  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic phoneNumber, discount, boats;
  dynamic location;
  dynamic _selectedLocationAge,
      _selectedLocationSellerType,
      _selectedLocationlength,
      _selectedLocationcondition2,
      _selectedLocationUsage,
      _selectedLocationWarranty;

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

  Widget _buildDropDown(dynamic text, List<dynamic> list, dynamic choice,
      dynamic _selectedLocation2, double x) {
    return Container(
      width: x,
      child: DropdownButtonFormField(
        validator: (value) =>
            value == null ? translator.translate('Required') : null,
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
            if (choice == 0) {
              _selectedLocationAge = newValue;
            }
            if (choice == 1) {
              _selectedLocationSellerType = newValue;
            }
            if (choice == 2) {
              _selectedLocationWarranty = newValue;
            }
            if (choice == 3) {
              _selectedLocationlength = newValue;
            }
            if (choice == 4) {
              _selectedLocationcondition2 = newValue;
            }
            if (choice == 5) {
              _selectedLocationUsage = newValue;
            }
          });
        },
      ),
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
    age = [
      translator.translate("Brand New"),
      translator.translate("0-1 month"),
      translator.translate("1-6 month"),
      translator.translate("6-12 month"),
      translator.translate("1-2 years"),
      translator.translate("2-5 years"),
      translator.translate("5-10 years"),
      translator.translate("10+ years"),
    ];
    sellerType = [
      translator.translate("Owner"),
      translator.translate("Dealer"),
      translator.translate("Dealership-Certified Pre-Owned"),
    ];
    warranty = [
      translator.translate("Yes2"),
      translator.translate("No"),
      translator.translate("Does not Apply"),
    ];
    length = [
      translator.translate("Under 10 ft"),
      translator.translate("10-14 ft"),
      translator.translate("15-19 ft"),
      translator.translate("20-24 ft"),
      translator.translate("25-29 ft"),
    ];
    condition = [
      translator.translate("perfectInside"),
      translator.translate("AlmostNo"),
      translator.translate("A bit of wear and tear"),
      translator.translate("Normal wear and tear"),
      translator.translate("Above avearge wear and tear")
    ];
    usage = [
      translator.translate("still with the dealer"),
      translator.translate("only used once since it"),
      translator.translate("Used only a few"),
      translator.translate("Used an average"),
      translator.translate("Used numerous times per week"),
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
          translator.translate("Add Boats"),
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
                      _buildName(context, 42.w,
                          translator.translate("Discount"), 2, 1),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Age"), age, 0,
                      _selectedLocationAge, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Seller Type"),
                      sellerType,
                      1,
                      _selectedLocationSellerType,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Warranty"), warranty, 2,
                      _selectedLocationWarranty, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("length"), length, 3,
                      _selectedLocationlength, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("condition2"), condition,
                      4, _selectedLocationcondition2, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Usage"), usage, 5,
                      _selectedLocationUsage, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Location"), 3, 2),
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
                            if (translator.currentLanguage == 'ar') {
                              boats = 463;
                            }
                            if (translator.currentLanguage == 'en') {
                              boats = 457;
                            }
                            if (!_formKey.currentState.validate()) return;

                            _formKey.currentState.save();

                            await notesService.boats(
                                boats,
                                widget.title,
                                widget.price,
                                widget.description,
                                phoneNumber,
                                discount,
                                location,
                                widget.boatsAPI,
                                widget.boatsAPIChild,
                                _selectedLocationSellerType,
                                _selectedLocationcondition2,
                                _selectedLocationUsage,
                                _selectedLocationlength,
                                _selectedLocationWarranty,
                                _selectedLocationAge,context);
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
