import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:validators/validators.dart';
import 'notes_serviceForSale.dart';

class ResidentialBuildingInput extends StatefulWidget {
  @override
  _ResidentialBuildingInputState createState() =>
      _ResidentialBuildingInputState();
}

class _ResidentialBuildingInputState extends State<ResidentialBuildingInput> {
  final myController = TextEditingController();

  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price, residentialBuildingAPI, _index;
  dynamic title, description, _selectedLocationresidentialBuilding;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> type = ["ok"], residentialBuilding; // Option 2

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
            _index = list.indexOf(newValue);
            _selectedLocationresidentialBuilding = newValue;
            if (translator.currentLanguage == 'en') {
              if (_index == 0) residentialBuildingAPI = 7247;
              if (_index == 1) residentialBuildingAPI = 7249;
              if (_index == 2) residentialBuildingAPI = 7271;
              if (_index == 3) residentialBuildingAPI = 7251;
              if (_index == 4) residentialBuildingAPI = 7253;
              if (_index == 5) residentialBuildingAPI = 7257;
              if (_index == 6) residentialBuildingAPI = 7255;
            }
            if (translator.currentLanguage == 'ar') {
              if (_index == 0) residentialBuildingAPI = 7269;
              if (_index == 1) residentialBuildingAPI = 7267;
              if (_index == 2) residentialBuildingAPI = 7273;
              if (_index == 3) residentialBuildingAPI = 7265;
              if (_index == 4) residentialBuildingAPI = 7263;
              if (_index == 5) residentialBuildingAPI = 7259;
              if (_index == 6) residentialBuildingAPI = 7261;
            }
          });
        },
      ),
    );
  }

  Widget _buildName(BuildContext context, double x, dynamic text, dynamic choice) {
    return Container(
      width: x,
      child: TextFormField(
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
          if (value.isEmpty)
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
          if (choice == 2) price = NumberUtility.changeDigit(value, NumStrLanguage.English);
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    residentialBuilding = [
      translator.translate("Apartment for Sale"),
      translator.translate("Penthouse"),
      translator.translate("Residential Building3"),
      translator.translate("Residential Floor2"),
      translator.translate("Townhouse"),
      translator.translate("Villa/House for Sale"),
      translator.translate("Villa Compound3"),
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
            translator.translate("Add Residential Building"),
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
                        translator.translate("Title"), 1),
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildDropDown(
                        translator.translate("Choose Type"),
                        residentialBuilding,
                        1,
                        _selectedLocationresidentialBuilding,
                        double.infinity),
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildName(context, MediaQuery.of(context).size.width,
                        translator.translate("Price"), 2),
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
                                    return ResidentialBuildingInput2(
                                        price: price,
                                        title: title,
                                        description: myController.text,
                                        residentialBuildingAPI:
                                            residentialBuildingAPI);
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

class FreeHold {
  dynamic name;
  dynamic index;
  FreeHold({this.name, this.index});
}

class ResidentialBuildingInput2 extends StatefulWidget {
  final dynamic price, residentialBuildingAPI;
  final dynamic title, description;
  ResidentialBuildingInput2({
    @required this.price,
    @required this.title,
    @required this.description,
    @required this.residentialBuildingAPI,
  });
  @override
  _ResidentialBuildingInput2State createState() =>
      _ResidentialBuildingInput2State();
}

class _ResidentialBuildingInput2State extends State<ResidentialBuildingInput2>
    with AutomaticKeepAliveClientMixin {
  NotesServiceeForSale get notesService => GetIt.I<NotesServiceeForSale>();
  double padding = 0,
      padding2 = 0,
      padding3 = 0,
      leadingSize = 0,
      paddding47 = 0,
      paddding39 = 0;
  dynamic phoneNumber,
      residentialBuildingAPIRoot,
      discount,
      size,
      rera,
      sizeSQFT,
      maintenanceFee,
      totalClosingFee,
      buyerTransfer,
      sellerTransfer,
      propertyReferencyID,
      rERApremitnumber,
      annualCommunityFee,
      rERABrokerID,
      reraTitleDeedNumber,
      reraPreRegistrationNumber,
      landLordRERA,
      id = 10,
      approvedbuilduparea;
  List<dynamic> listedBy,
      property,
      zonedFor,
      landLord,
      occupancyStatus,
      room; // Option 2
  dynamic building,
      neighborhood,
      location,
      url360 = " ",
      youtubeURL = " ",
      developer,
      readbyDate,
      rERAlistercompany,
      landLordName,
      reraAgentName,
      radioItem;
  Map<dynamic, bool> numbers;
  List<FreeHold> freeHold;
  dynamic _selectedLocationlistedBy,
      _selectedLocationzonedFor,
      _selectedLocationlandLord,
      _selectedLocationBathroom,
      _selectedLocationBedroom,
      _selectedLocationoccupancyStatus,
      _selectedLocationProperty;

  void initState() {
    super.initState();
    numbers = {
      translator.translate("Balcony"): false,
      translator.translate("Built in wardrobes"): false,
      translator.translate("Built in kitchen appliances"): false,
      translator.translate("Central A/C & Heating"): false,
      translator.translate("Concierge service"): false,
      translator.translate("Covered parking"): false,
      translator.translate("Maid service"): false,
      translator.translate("Maids room"): false,
      translator.translate("Pets allowed"): false,
      translator.translate("Private garden"): false,
      translator.translate("Private Gym"): false,
      translator.translate("Private Jacuzzi"): false,
      translator.translate("Private pool"): false,
      translator.translate("Security"): false,
      translator.translate("Shared Gym"): false,
      translator.translate("Shared pool"): false,
      translator.translate("Shared spa"): false,
      translator.translate("Study"): false,
      translator.translate("View of landmark"): false,
      translator.translate("View of water"): false,
      translator.translate("Walk-in closet"): false,
    };

    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  Widget _buildDropDown(dynamic text, List<dynamic> list, dynamic choice,
      dynamic _selectedLocation2, double x) {
    return Container(
      width: x,
      child: DropdownButtonFormField(
      validator: (value) => value == null
                          ? translator.translate('Required')
                          : null,
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
              _selectedLocationoccupancyStatus = newValue;
            }
            if (choice == 2) {
              _selectedLocationlistedBy = newValue;
            }
            if (choice == 3) {
              _selectedLocationzonedFor = newValue;
            }
            if (choice == 4) {
              _selectedLocationBathroom = newValue;
            }
            if (choice == 5) {
              _selectedLocationBedroom = newValue;
            }
            if (choice == 6) {
              _selectedLocationlandLord = newValue;
              if (_selectedLocationlandLord == "Landlord") rera = 1;
              if (_selectedLocationlandLord == "Agent") rera = 2;
            }
            if (choice == 7) {
              _selectedLocationProperty = newValue;
              if (_selectedLocationProperty == "Complete") landLordRERA = 1;
              if (_selectedLocationProperty == "InComplete") landLordRERA = 2;
            }
          });
        },
      ),
    );
  }

  Widget _reraAgent() {
    return Column(children: [
      _buildName(context, double.infinity,
          translator.translate("RERA Broker ID number"), 18),
      SizedBox(
        height: 5.w,
      ),
      _buildName(context, double.infinity,
          translator.translate("RERA lister company name"), 19),
      SizedBox(
        height: 5.w,
      ),
      _buildName(context, double.infinity,
          translator.translate("RERA premit number"), 20),
      SizedBox(
        height: 5.w,
      ),
      _buildName(context, double.infinity,
          translator.translate("RERA agent name"), 21),
      SizedBox(
        height: 5.w,
      ),
    ]);
  }

  Widget _buildName(BuildContext context, double x, dynamic text, dynamic choice) {
    return Container(
      width: x,
      child: TextFormField(
        // keyboardType:TextInputType.number,
        // inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]"))],
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
          if (choice != 3 && choice != 4)
          {if (value.isEmpty)
            return translator.translate('Required');}
            if (choice == 1 ||
              choice == 2 ||
              choice == 7 ||
              choice == 8 ||
              choice == 9 ||
              choice == 10 ||
              choice == 11 ||
              choice == 12 ||
              choice == 13 ||
              choice == 18 ||
              choice == 20 ||
              choice == 25 ||
              choice == 26) {
            if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
                    .hasMatch(value) &&
                !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
                    .hasMatch(value)) {
              return translator.translate('Please enter numbers');
            }
            if (choice == 3 || choice == 4) if (value.isNotEmpty) {
            if (!isURL(value))
              return translator.translate('Please enter a valid URL');
          }
          }
        }, 
        onSaved: (value) {
          if (choice == 1) phoneNumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 2) discount = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 3) url360 = value;
          if (choice == 4) youtubeURL = value;
          if (choice == 5) developer = value;
          if (choice == 6) readbyDate = value;
          if (choice == 7) sizeSQFT = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 8) maintenanceFee = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 9) totalClosingFee = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 10) buyerTransfer = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 11) sellerTransfer = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 12) propertyReferencyID = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 13) annualCommunityFee = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 14) building = value;
          if (choice == 15) location = value;
          if (choice == 16) neighborhood = value;
          if (choice == 17) landLordName = value;
          if (choice == 18) rERABrokerID = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 19) rERAlistercompany = value;
          if (choice == 20) rERApremitnumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 21) reraAgentName = value;
          if (choice == 25) reraTitleDeedNumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 26) reraPreRegistrationNumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    room = [
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
      "+12",
    ];
    freeHold = [
      FreeHold(
        index: 1,
        name: translator.translate("True"),
      ),
      FreeHold(
        index: 2,
        name: translator.translate("False"),
      ),
    ];
    property = [
      translator.translate("Complete"),
      translator.translate("InComplete")
    ];
    listedBy = [
      translator.translate('Agent'),
      translator.translate('Landlord'),
      translator.translate('Developer')
    ];
    zonedFor = [
      translator.translate('Residential'),
      translator.translate('Commercial'),
      translator.translate('Retial'),
      translator.translate('Industrial'),
      translator.translate('Mixed use'),
    ];
    occupancyStatus = [
      translator.translate("Vacant"),
      translator.translate("Occupied"),
    ];
    landLord = [
      translator.translate('Landlord'),
      translator.translate('Agent')
    ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      padding3 = 20.h;
      padding = 6.w;
      padding2 = 7.w;
      if (SizerUtil.height < 600) padding3 = 30.h;
      if (SizerUtil.height < 735 && SizerUtil.height > 650) padding3 = 35.h;
      if (SizerUtil.height < 1290 && SizerUtil.height >= 738) padding3 = 45.h;
      padding2 = 7.w;
      if (SizerUtil.deviceType == DeviceType.tablet) {}
    }
    if (SizerUtil.deviceType == DeviceType.mobile) {
      paddding39 = 4.5.w;
      paddding47 = 14.w;
    }
    if (SizerUtil.deviceType == DeviceType.tablet) {
      paddding39 = 3.8.w;
      paddding47 = 12.w;
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
          translator.translate("Add Residential Building"),
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
                          translator.translate("Your phone number"), 1),
                      _buildName(
                          context, 42.w, translator.translate("Discount"), 2),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(context, 42.w,
                          translator.translate("360 Tour URL"), 3),
                      _buildName(context, 42.w,
                          translator.translate("Youtube URL"), 4),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(
                          context, 42.w, translator.translate("Developer"), 5),
                      _buildName(context, 42.w,
                          translator.translate("Read by (Date)"), 6),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Size( sqft)2"), 7),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Maintenance"), 8),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Total Closing fee"), 9),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Buyer transfer fee"), 10),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Seller transfer fee"), 11),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Property Ref"), 12),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Annual community fee"), 13),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Occupancy Status"),
                      occupancyStatus,
                      1,
                      _selectedLocationoccupancyStatus,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropDown(translator.translate("Listed by"),
                          listedBy, 2, _selectedLocationlistedBy, 42.w),
                      _buildDropDown(translator.translate("Zoned for"),
                          zonedFor, 3, _selectedLocationzonedFor, 42.w),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropDown(translator.translate("Bathrooms"), room, 4,
                          _selectedLocationBathroom, 42.w),
                      _buildDropDown(translator.translate("Bedrooms"), room, 5,
                          _selectedLocationBedroom, 42.w),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Building"), 14),
                  SizedBox(
                    height: 5.w,
                  ),
                  Divider(thickness: 1),
                  SizedBox(
                    height: 70.w,
                    child: ListView(
                      children: numbers.keys.map((dynamic key) {
                        return new CheckboxListTile(
                          title: new Text(key),
                          value: numbers[key],
                          activeColor: Colors.orange,
                          onChanged: (value) {
                            setState(() {
                              numbers[key] = value;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Divider(thickness: 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Are you a landlord"),
                      landLord, 6, _selectedLocationlandLord, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  if (rera == 2) _reraAgent(),
                  if (rera == 1)
                    _buildName(context, double.infinity,
                        translator.translate("Land lord name"), 17),
                  if (rera == 1)
                    SizedBox(
                      height: 5.w,
                    ),
                  if (rera == 1)
                    _buildDropDown(translator.translate("Property"), property,
                        7, _selectedLocationProperty, double.infinity),
                  if (rera == 1)
                    SizedBox(
                      height: 5.w,
                    ),
                  if (landLordRERA == 1)
                    _buildName(context, double.infinity,
                        translator.translate("RERA Title deed number"), 25),
                  if (landLordRERA == 2)
                    _buildName(context, double.infinity,
                        translator.translate("RERA Pre register number"), 26),
                  if (landLordRERA == 2)
                    SizedBox(
                      height: 5.w,
                    ),
                  if (landLordRERA == 1)
                    SizedBox(
                      height: 5.w,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(
                          context, 42.w, translator.translate("Location"), 15),
                      _buildName(context, 42.w,
                          translator.translate("Neighborhood"), 16),
                    ],
                  ),
                  SizedBox(
                    height: 15.w,
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
                            if (!_formKey.currentState.validate()) return;
                            _formKey.currentState.save();
                            if (translator.currentLanguage == 'ar')
                              residentialBuildingAPIRoot = 7273;
                            if (translator.currentLanguage == 'en')
                              residentialBuildingAPIRoot = 7271;
                            await notesService.residentialBuilding(
                                widget.title,
                                residentialBuildingAPIRoot,
                                widget.residentialBuildingAPI,
                                widget.price,
                                widget.description,
                                phoneNumber,
                                discount,
                                url360,
                                youtubeURL,
                                developer,
                                readbyDate,
                                sizeSQFT,
                                maintenanceFee,
                                totalClosingFee,
                                buyerTransfer,
                                sellerTransfer,
                                propertyReferencyID,
                                annualCommunityFee,
                                _selectedLocationoccupancyStatus,
                                _selectedLocationlistedBy,
                                _selectedLocationzonedFor,
                                _selectedLocationBathroom,
                                _selectedLocationBedroom,
                                building,
                                _selectedLocationlandLord,
                                location,
                                neighborhood,
                                landLordName,
                                _selectedLocationProperty,
                                reraTitleDeedNumber,
                                reraPreRegistrationNumber,
                                rERABrokerID,
                                rERAlistercompany,
                                rERApremitnumber,
                                reraAgentName);
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
