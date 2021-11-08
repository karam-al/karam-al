import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:get_it/get_it.dart';
import 'note_serviceForRent2.dart';

class CommercialforRent extends StatefulWidget {
  @override
  _CommercialforRentState createState() => _CommercialforRentState();
}

class _CommercialforRentState extends State<CommercialforRent> {
  final myController = TextEditingController();
  dynamic _index = 10, commercialforRentApi;
  dynamic newValuee;
  dynamic _selectedLocationcartype3,
      _selectedLocationMotorboats,
      _selectedLocationSailboats,
      _selectedLocationrowPaddleBoats;
  /////////////////////////////////////

  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price;
  dynamic title, description;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> type = ["ok"], commercialforRent; // Option 2

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

  Widget _buildDropDown(
      dynamic text, List<dynamic> list, dynamic choice, dynamic _selectedLocation2) {
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
          _index = list.indexOf(newValue);
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) commercialforRentApi = 6927;
            if (_index == 1) commercialforRentApi = 6929;
            if (_index == 2) commercialforRentApi = 6931;
            if (_index == 3) commercialforRentApi = 6933;
            if (_index == 4) commercialforRentApi = 6935;
            if (_index == 5) commercialforRentApi = 6937;
            if (_index == 6) commercialforRentApi = 6941;
            if (_index == 7) commercialforRentApi = 6939;
            if (_index == 8) commercialforRentApi = 6943;
            if (_index == 9) commercialforRentApi = 6945;
            if (_index == 10) commercialforRentApi = 6947;
            if (_index == 11) commercialforRentApi = 6949;
            if (_index == 12) commercialforRentApi = 6955;
            if (_index == 13) commercialforRentApi = 6951;
            if (_index == 14) commercialforRentApi = 6957;
            if (_index == 15) commercialforRentApi = 6953;
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) commercialforRentApi = 6895;
            if (_index == 1) commercialforRentApi = 6897;
            if (_index == 2) commercialforRentApi = 6899;
            if (_index == 3) commercialforRentApi = 6901;
            if (_index == 4) commercialforRentApi = 6903;
            if (_index == 5) commercialforRentApi = 6905;
            if (_index == 6) commercialforRentApi = 6909;
            if (_index == 7) commercialforRentApi = 6907;
            if (_index == 8) commercialforRentApi = 6911;
            if (_index == 9) commercialforRentApi = 6913;
            if (_index == 10) commercialforRentApi = 6915;
            if (_index == 11) commercialforRentApi = 6917;
            if (_index == 12) commercialforRentApi = 6923;
            if (_index == 13) commercialforRentApi = 6919;
            if (_index == 14) commercialforRentApi = 6925;
            if (_index == 15) commercialforRentApi = 6921;
          }
        });
      },
    );
  }

  Widget _buildName(
      BuildContext context, double x, dynamic text, dynamic choice, dynamic choice2) {
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
    commercialforRent = [
      translator.translate(
        "Bulk Unit",
      ),
      translator.translate("Commercial Building"),
      translator.translate(
        "Commercial Floor",
      ),
      translator.translate(
        "Commercial Plot",
      ),
      translator.translate(
        "Commercial Vila",
      ),
      translator.translate(
        "Factory",
      ),
      translator.translate("Industrial for Rent"),
      translator.translate(
        "Industrial Land",
      ),
      translator.translate(
        "Mixed Use Land",
      ),
      translator.translate(
        "Office for Rent",
      ),
      translator.translate("other5"),
      translator.translate(
        "Retial for Rent2",
      ),
      translator.translate(
        "Staff",
      ),
      translator.translate(
        "Shop2",
      ),
      translator.translate(
        "Warehouse2",
      ),
      translator.translate(
        "Showroom",
      ),
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
            translator.translate("Add commercial for rent"),
            style: TextStyle(color: Colors.black, fontSize: 5.w),
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
                    _buildDropDown(translator.translate("Choose Type"),
                        commercialforRent, 2, _selectedLocationrowPaddleBoats),
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
                                    return CommercialforRent2(
                                      childAPI: commercialforRentApi,
                                      price: price,
                                      title: title,
                                      description: myController.text,
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

class CommercialforRent2 extends StatefulWidget {
  final dynamic price, childAPI;
  final dynamic title, description;
  CommercialforRent2({
    @required this.childAPI,
    @required this.price,
    @required this.title,
    @required this.description,
  });
  @override
  _CommercialforRent2State createState() => _CommercialforRent2State();
}

class _CommercialforRent2State extends State<CommercialforRent2>
    with AutomaticKeepAliveClientMixin {
  NotesServiceeForRent get notesService => GetIt.I<NotesServiceeForRent>();
  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic rootAPI;
  dynamic phoneNumber,
      discount,
      location,
      size,
      propertyReference,
      rERALandlord,
      rERAtitledeed,
      preRegistration,
      minimumcontract,
      noticePeriod,
      maintenanceFee,
      building,
      neighborhood;
  dynamic _selectedLocationfurnished,
      _selectedLocationrent,
      _selectedLocationrERAproperty,
      _selectedLocationoccupancyStatus,
      _selectedLocationYear,
      _selectedLocationMonth,
      _selectedLocationDay;

  List<dynamic> type = ["ok"],
      furnished,
      rent,
      rERAproperty,
      occupancyStatus,
      year,
      month,
      day;
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
    year = [
      "2010",
      "2011",
      "2012",
      "2013",
      "2014",
      "2015",
      "2016",
      "2017",
      "2018",
      "2019",
      "2020",
      "2021"
    ];
    month = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
    day = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      "20",
      "21",
      "22",
      "23",
      "24",
      "25",
      "26",
      "27",
      "28",
      "29",
      "30",
      "31"
    ];
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
              _selectedLocationfurnished = newValue;
            }
            if (choice == 1) {
              _selectedLocationrent = newValue;
            }
            if (choice == 2) {
              _selectedLocationrERAproperty = newValue;
            }
            if (choice == 3) {
              _selectedLocationoccupancyStatus = newValue;
            }
            if (choice == 4) {
              _selectedLocationYear = newValue;
            }
            if (choice == 5) {
              _selectedLocationMonth = newValue;
            }
            if (choice == 6) {
              _selectedLocationDay = newValue;
            }
          });
        },
      ),
    );
  }

  Widget _buildName(
      BuildContext context, double x, dynamic text, dynamic choice, dynamic choice2) {
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
          if (choice == 1 ||
              choice == 2 ||
              choice == 3 ||
              choice == 4 ||
              choice == 6 ||
              choice == 7 ||
              choice == 8 ||
              choice == 9||
              choice == 10 ) {
            if (value.isEmpty) return translator.translate('Required');
            if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
                    .hasMatch(value) &&
                !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
                    .hasMatch(value)) {
              return translator.translate('Please enter numbers');
            }
          }
        },
        onSaved: (dynamic value) {
          if (choice == 1) {
            phoneNumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 2) {
            discount = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 3) {
            size = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 4) {
            propertyReference = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 5) {
            rERALandlord = value;
          }
          if (choice == 6) {
            rERAtitledeed = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 7) {
            preRegistration = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 8) {
            minimumcontract = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 9) {
            noticePeriod = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 10) {
            maintenanceFee = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 11) {
            neighborhood = value;
          }
          if (choice == 12) {
            building = value;
          }
          if (choice == 13) {
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
    furnished = [
      translator.translate("furnished"),
      translator.translate("Unfurnished"),
    ];
    rent = [
      translator.translate("yearly"),
      translator.translate("bi-Yearly"),
      translator.translate("quarterly"),
      translator.translate("monthly"),
    ];
    rERAproperty = [
      translator.translate("Complete"),
      translator.translate("InComplete"),
    ];
    occupancyStatus = [
      translator.translate("Vacant"),
      translator.translate("Occupied"),
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
          translator.translate("Add commercial for rent"),
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
                  _buildName(context, double.infinity,
                      translator.translate("Size( sqft)2"), 3, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Is it furnished"),
                      furnished,
                      0,
                      _selectedLocationfurnished,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Property Ref"), 4, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Rent is paid"), rent, 1,
                      _selectedLocationrent, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("RERA Landlord Name"), 5, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("RERA property status"),
                      rERAproperty,
                      2,
                      _selectedLocationrERAproperty,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("RERA title"), 6, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("RERA PRE"), 7, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Minimum contract"), 8, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Notice period"), 9, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Maintenance"), 10, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Occupancy Status"),
                      occupancyStatus,
                      3,
                      _selectedLocationoccupancyStatus,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(context, 42.w,
                          translator.translate("Neighborhood"), 11, 2),
                      _buildName(context, 42.w,
                          translator.translate("Building"), 12, 2),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Location"), 13, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Amenities"), 14, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      _buildDropDown(translator.translate("Year2"), year, 4,
                          _selectedLocationYear, 28.w),
                      SizedBox(
                        width: 2.w,
                      ),
                      _buildDropDown(translator.translate("Month"), month, 5,
                          _selectedLocationMonth, 28.w),
                      SizedBox(
                        width: 2.w,
                      ),
                      _buildDropDown(translator.translate("Day"), day, 6,
                          _selectedLocationDay, 28.w)
                    ],
                  ),
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
                            if (translator.currentLanguage == 'ar')
                              rootAPI = 2022;
                            if (translator.currentLanguage == 'en')
                              rootAPI = 2014;
                              print("cleeee");
                            await notesService.commercialforRent(
                                rootAPI,
                                widget.childAPI,
                                widget.title,
                                widget.price,
                                _selectedLocationrent,
                                widget.description,
                                location,
                                phoneNumber,
                                _selectedLocationrent,
                                maintenanceFee,
                                discount,
                                size,
                                _selectedLocationfurnished,
                                building,
                                neighborhood,
                                propertyReference,
                                rERALandlord,
                                _selectedLocationoccupancyStatus,
                                rERAtitledeed,
                                preRegistration,
                                noticePeriod,
                                minimumcontract,
                                _selectedLocationoccupancyStatus
                                , context
                                // amenities
                                ); 
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
