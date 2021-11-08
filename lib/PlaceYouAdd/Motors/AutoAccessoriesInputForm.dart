import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'notes_service.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class AutoAccessoriesInputForm extends StatefulWidget {
  @override
  _AutoAccessoriesInputFormState createState() =>
      _AutoAccessoriesInputFormState();
}

class _AutoAccessoriesInputFormState extends State<AutoAccessoriesInputForm> {
  final myController = TextEditingController();
  dynamic _index = 10,
      _index2 = 10,
      autoAccessoriesApi,
      autoAccessoriesApiChild;
  dynamic _selectedLocationcartype3,
      _selectedLocationAutomotiveTool,
      _selectedLocationApparelMerchandise,
      _selectedLocationboatParts,
      _selectedLocationcar4x4Parts,
      _selectedLocationmotorcycleParts;
  /////////////////////////////////////

  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price;
  dynamic description, title;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> type = ["ok"],
      autoAccessories,
      automotiveTools,
      apparelMerchandise,
      boatParts,
      car4x4Parts,
      motorcycleParts;

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
        _index2 = list.indexOf(newValue);
        setState(() {
          if (translator.currentLanguage == 'en') {
            if (choice == 0) {
              if (_index == 0) {
                if (_index2 == 0) autoAccessoriesApiChild = 6376;
                if (_index2 == 1) autoAccessoriesApiChild = 6378;
              }
              _selectedLocationAutomotiveTool = newValue;
            }
            if (choice == 1) {
              if (_index == 1) {
                if (_index2 == 0) autoAccessoriesApiChild = 6312;
                if (_index2 == 1) autoAccessoriesApiChild = 7649;
                if (_index2 == 2) autoAccessoriesApiChild = 6314;
                if (_index2 == 3) autoAccessoriesApiChild = 6316;
                if (_index2 == 4) autoAccessoriesApiChild = 6318;
                if (_index2 == 5) autoAccessoriesApiChild = 6320;
              }
              _selectedLocationApparelMerchandise = newValue;
            }
            if (choice == 2) {
              if (_index == 2) {
                if (_index2 == 0) autoAccessoriesApiChild = 6386;
                if (_index2 == 1) autoAccessoriesApiChild = 6388;
              }
              _selectedLocationboatParts = newValue;
            }
            if (choice == 3) {
              if (_index == 3) {
                if (_index2 == 0) autoAccessoriesApiChild = 1582;
                if (_index2 == 1) autoAccessoriesApiChild = 1592;
                if (_index2 == 2) autoAccessoriesApiChild = 1594;
                if (_index2 == 3) autoAccessoriesApiChild = 6278;
                if (_index2 == 4) autoAccessoriesApiChild = 6280;
                if (_index2 == 5) autoAccessoriesApiChild = 6282;
                if (_index2 == 6) autoAccessoriesApiChild = 6284;
                if (_index2 == 7) autoAccessoriesApiChild = 6286;
                if (_index2 == 8) autoAccessoriesApiChild = 6288;
                if (_index2 == 9) autoAccessoriesApiChild = 6290;
                if (_index2 == 10) autoAccessoriesApiChild = 6292;
              }
              _selectedLocationcar4x4Parts = newValue;
            }
            if (choice == 4) {
              if (_index == 4) {
                if (_index2 == 0) autoAccessoriesApiChild = 6346;
                if (_index2 == 1) autoAccessoriesApiChild = 6348;
                if (_index2 == 2) autoAccessoriesApiChild = 7679;
                if (_index2 == 3) autoAccessoriesApiChild = 6350;
                if (_index2 == 4) autoAccessoriesApiChild = 6350;
                if (_index2 == 5) autoAccessoriesApiChild = 7689;
                if (_index2 == 6) autoAccessoriesApiChild = 6356;
              }
              _selectedLocationmotorcycleParts = newValue;
            }
          }

          if (translator.currentLanguage == 'ar') {
            if (choice == 0) {
              if (_index == 0) {
                if (_index2 == 0) autoAccessoriesApiChild = 6382;
                if (_index2 == 1) autoAccessoriesApiChild = 6380;
              }
              _selectedLocationAutomotiveTool = newValue;
            }
            if (choice == 1) {
              if (_index == 1) {
                if (_index2 == 0) autoAccessoriesApiChild = 6322;
                if (_index2 == 1) autoAccessoriesApiChild = 7653;
                if (_index2 == 2) autoAccessoriesApiChild = 6324;
                if (_index2 == 3) autoAccessoriesApiChild = 6326;
                if (_index2 == 4) autoAccessoriesApiChild = 6328;
                if (_index2 == 5) autoAccessoriesApiChild = 6336;
              }
              _selectedLocationApparelMerchandise = newValue;
            }
            if (choice == 2) {
              if (_index == 2) {
                if (_index2 == 0) autoAccessoriesApiChild = 6392;
                if (_index2 == 1) autoAccessoriesApiChild = 6394;
              }
              _selectedLocationboatParts = newValue;
            }
            if (choice == 3) {
              if (_index == 3) {
                if (_index2 == 0) autoAccessoriesApiChild = 1588;
                if (_index2 == 1) autoAccessoriesApiChild = 1590;
                if (_index2 == 2) autoAccessoriesApiChild = 1596;
                if (_index2 == 3) autoAccessoriesApiChild = 6294;
                if (_index2 == 4) autoAccessoriesApiChild = 6296;
                if (_index2 == 5) autoAccessoriesApiChild = 6298;
                if (_index2 == 6) autoAccessoriesApiChild = 6300;
                if (_index2 == 7) autoAccessoriesApiChild = 6302;
                if (_index2 == 8) autoAccessoriesApiChild = 6304;
                if (_index2 == 9) autoAccessoriesApiChild = 6306;
                if (_index2 == 10) autoAccessoriesApiChild = 6308;
              }
              _selectedLocationcar4x4Parts = newValue;
            }
            if (choice == 4) {
              if (_index == 4) {
                if (_index2 == 0) autoAccessoriesApiChild = 6370;
                if (_index2 == 1) autoAccessoriesApiChild = 6364;
                if (_index2 == 2) autoAccessoriesApiChild = 7683;
                if (_index2 == 3) autoAccessoriesApiChild = 6362;
                if (_index2 == 4) autoAccessoriesApiChild = 6360;
                if (_index2 == 5) autoAccessoriesApiChild = 7695;
                if (_index2 == 6) autoAccessoriesApiChild = 6358;
              }
              _selectedLocationmotorcycleParts = newValue;
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
    autoAccessories = [
      translator.translate("Automotive Tools"),
      translator.translate("Apparel, Merchandise & Accessories"),
      translator.translate("Boat Parts"),
      translator.translate("Car/4x4 Parts"),
      translator.translate("Motorcycle Parts"),
      translator.translate("Other Vehicle Parts"),
    ];
    automotiveTools = [
      translator.translate("Tool Accessories"),
      //translator.translate("Tool Sets"),
      translator.translate("Tools"),
    ];
    apparelMerchandise = [
      translator.translate("Apparel"),
      translator.translate("Boat Accessories"),
      translator.translate("Car/4x4 Accessories"),
      translator.translate("Merchandise"),
      translator.translate("Motorcycle Accessories"),
      translator.translate("other"),
    ];
    boatParts = [
      // translator.translate("Body Parts & Accessories"),
      translator.translate("Electronic Parts"),
      translator.translate("Engine Parts"),
      // translator.translate("plumbing & Ventilation"),
      // translator.translate("Sailing Gear"),
      //translator.translate("other"),
    ];
    car4x4Parts = [
      translator.translate("A/C & Heating Parts"),
      translator.translate("Batteries"),
      translator.translate("Brakes"),
      translator.translate("Engine & Computer Parts"),
      translator.translate("Exhaust/Air lntake"),
      translator.translate("Exterior Parts"),
      translator.translate("Interior Parts"),
      translator.translate("Lighting"),
      translator.translate("Suspension"),
      translator.translate("Wheels/Tries"),
      translator.translate("Other"),
    ];
    motorcycleParts = [
      translator.translate("Accessories"),
      translator.translate("Body & Frame"),
      translator.translate("Brakes & Suspension"),
      translator.translate("Engines & Components"),
      translator.translate("Wheels Tires"),
      translator.translate("Lighting"),
      translator.translate("Other")
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
            translator.translate("Add Auto Accessories Parts"),
            style: TextStyle(color: Colors.black, fontSize: 4.5.w),
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
                          _index = autoAccessories.indexOf(newValue);
                          if (translator.currentLanguage == 'en') {
                            if (_index == 0) {
                              autoAccessoriesApi = 1552;
                            }
                            if (_index == 1) {
                              autoAccessoriesApi = 1548;
                            }
                            if (_index == 2) {
                              autoAccessoriesApi = 1554;
                            }
                            if (_index == 3) {
                              autoAccessoriesApi = 1546;
                            }
                            if (_index == 4) {
                              autoAccessoriesApi = 1550;
                            }
                            if (_index == 5) {
                              autoAccessoriesApi = 1556;
                            }
                          }
                          if (translator.currentLanguage == 'ar') {
                            if (_index == 0) {
                              autoAccessoriesApi = 1560;
                            }
                            if (_index == 1) {
                              autoAccessoriesApi = 1558;
                            }
                            if (_index == 2) {
                              autoAccessoriesApi = 1562;
                            }
                            if (_index == 3) {
                              autoAccessoriesApi = 1564;
                            }
                            if (_index == 4) {
                              autoAccessoriesApi = 1566;
                            }
                            if (_index == 5) {
                              autoAccessoriesApi = 1568;
                            }
                          }
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return autoAccessories.map<Widget>((dynamic text) {
                          return Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList();
                      },
                      items: autoAccessories
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
                    if (_index == 0)
                      _buildDropDown(translator.translate("Choose Type"),
                          automotiveTools, 0, _selectedLocationAutomotiveTool),
                    if (_index == 1)
                      _buildDropDown(
                          translator.translate("Choose Type"),
                          apparelMerchandise,
                          1,
                          _selectedLocationApparelMerchandise),
                    if (_index == 2)
                      _buildDropDown(translator.translate("Choose Type"),
                          boatParts, 2, _selectedLocationboatParts),
                    if (_index == 3)
                      _buildDropDown(translator.translate("Choose Type"),
                          boatParts, 3, _selectedLocationcar4x4Parts),
                    if (_index == 4)
                      _buildDropDown(translator.translate("Choose Type"),
                          boatParts, 4, _selectedLocationmotorcycleParts),
                    if (_index == 0 ||
                        _index == 1 ||
                        _index == 2 ||
                        _index == 3 ||
                        _index == 4)
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
                                    return AutoAccessoriesInputForm2(
                                      autoAccessoriesAPI: autoAccessoriesApi,
                                      autoAccessoriesAPIChild:
                                          autoAccessoriesApiChild,
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

class AutoAccessoriesInputForm2 extends StatefulWidget {
  final dynamic price,
      autoAccessoriesAPI,
      autoAccessoriesAPIChild,
      selectedLocation;
  final dynamic title, description;
  AutoAccessoriesInputForm2({
    @required this.autoAccessoriesAPI,
    @required this.autoAccessoriesAPIChild,
    @required this.price,
    @required this.title,
    @required this.description,
    @required this.selectedLocation,
  });
  @override
  _AutoAccessoriesInputForm2State createState() =>
      _AutoAccessoriesInputForm2State();
}

class _AutoAccessoriesInputForm2State extends State<AutoAccessoriesInputForm2>
    with AutomaticKeepAliveClientMixin {
  NotesServicee get notesService => GetIt.I<NotesServicee>();

  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic phoneNumber, discount, autoAccessories;

  dynamic _selectedLocationSellerType,
      _selectedLocationcondition2,
      _selectedLocationUsage,
      location;

  List<dynamic> sellerType, condition, usage;

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
            if (choice == 1) {
              _selectedLocationSellerType = newValue;
            }
            if (choice == 2) {
              _selectedLocationcondition2 = newValue;
            }
            if (choice == 3) {
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
    sellerType = [
      translator.translate("Owner"),
      translator.translate("Dealer"),
      translator.translate("Dealership/Certified Pre-Owned"),
    ];
    condition = [
      translator.translate("perfectInside"),
      translator.translate("AlmostNo"),
      translator.translate("A bit of wear and tear"),
      translator.translate("Normal wear and tear"),
      translator.translate("Above avearge wear and tear")
    ];
    usage = [
      translator.translate("still in orginal"),
      translator.translate("Out of orginal packaging"),
      translator.translate("Used only a few "),
      translator.translate("Used an average "),
      translator.translate("Used an above average")
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
          translator.translate("Add Auto Accessories Parts"),
          style: TextStyle(color: Colors.black, fontSize: 4.5.w),
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
                  _buildDropDown(
                      translator.translate("Seller Type"),
                      sellerType,
                      1,
                      _selectedLocationSellerType,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("condition2"), condition,
                      2, _selectedLocationcondition2, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Usagee"), usage, 3,
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
                            if (!_formKey.currentState.validate()) return;

                            _formKey.currentState.save();
                            if (translator.currentLanguage == 'ar') {
                              autoAccessories = 453;
                            }
                            if (translator.currentLanguage == 'en') {
                              autoAccessories = 451;
                            }
                            await notesService.autoAccessories(
                                autoAccessories,
                                widget.title,
                                widget.price,
                                widget.description,
                                phoneNumber,
                                discount,
                                location,
                                widget.selectedLocation,
                                widget.autoAccessoriesAPI,
                                widget.autoAccessoriesAPIChild,
                                _selectedLocationSellerType,
                                _selectedLocationcondition2,
                                _selectedLocationUsage,context);
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
