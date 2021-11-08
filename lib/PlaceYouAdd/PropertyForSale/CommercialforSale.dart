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

class CommercialforSale extends StatefulWidget {
  @override
  _CommercialforSaleState createState() => _CommercialforSaleState();
}

class _CommercialforSaleState extends State<CommercialforSale> {
  final myController = TextEditingController();
  dynamic _index = 10, commercialforSaleApi;

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
          _index = list.indexOf(newValue);
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) commercialforSaleApi = 7303;
            if (_index == 1) commercialforSaleApi = 7305;
            if (_index == 2) commercialforSaleApi = 7301;
            if (_index == 3) commercialforSaleApi = 7309;
            if (_index == 4) commercialforSaleApi = 9092;
            if (_index == 5) commercialforSaleApi = 7311;
            if (_index == 6) commercialforSaleApi = 7315;
            if (_index == 7) commercialforSaleApi = 7317;
            if (_index == 8) commercialforSaleApi = 7299;
            if (_index == 9) commercialforSaleApi = 7319;
            if (_index == 10) commercialforSaleApi = 7313;
            if (_index == 11) commercialforSaleApi = 7321;
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) commercialforSaleApi = 7277;
            if (_index == 1) commercialforSaleApi = 7279;
            if (_index == 2) commercialforSaleApi = 7275;
            if (_index == 3) commercialforSaleApi = 7281;
            if (_index == 4) commercialforSaleApi = 8387;
            if (_index == 5) commercialforSaleApi = 7285;
            if (_index == 6) commercialforSaleApi = 7289;
            if (_index == 7) commercialforSaleApi = 7291;
            if (_index == 8) commercialforSaleApi = 7297;
            if (_index == 9) commercialforSaleApi = 7293;
            if (_index == 10) commercialforSaleApi = 7287;
            if (_index == 11) commercialforSaleApi = 7295;
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
    commercialforRent = [
      /*translator.translate(
        "Bulk Unit",
      ),*/
      translator.translate(
        "Commercial Floor",
      ),
      /*translator.translate(
        "Commercial Plot",
      ),*/
      translator.translate(
        "Commercial Vila",
      ),
      translator.translate("Commercial Building"),
      translator.translate(
        "Factory",
      ),
      translator.translate("Industrial for Sale"),
      /* translator.translate(
        "Industrial Land",
      ),
      translator.translate(
        "Mixed Use Land",
      ),*/
      translator.translate(
        "Office for Sale",
      ),
      translator.translate(
        "Retial for Sale",
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
      translator.translate("other5"),
      translator.translate("Staff Accomm for Rent"),
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
            translator.translate("Add commercial for Sale"),
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
                                    return CommercialforSale2(
                                      commercialforSaleAPI:
                                          commercialforSaleApi,
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

class CommercialforSale2 extends StatefulWidget {
  final dynamic price, commercialforSaleAPI;
  final dynamic title, description;
  CommercialforSale2({
    @required this.commercialforSaleAPI,
    @required this.price,
    @required this.title,
    @required this.description,
  });
  @override
  _CommercialforSale2State createState() => _CommercialforSale2State();
}

class _CommercialforSale2State extends State<CommercialforSale2>
    with AutomaticKeepAliveClientMixin {
  NotesServiceeForSale get notesService => GetIt.I<NotesServiceeForSale>();
  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic phoneNumber,
      discount,
      size,
      sizeSQFT,
      maintenanceFee,
      totalClosingFee,
      buyerTransfer,
      sellerTransfer,
      propertyReferencyID,
      rera,
      landLordRERA,
      rERABrokerID,
      rERApremitnumber,
      reraTitleDeedNumber,
      commercialAPI,
      reraPreRegistrationNumber,
      annualCommunityFee;
  List<dynamic> listedBy,
      zonedFor,
      landLord,
      occupancyStatus,
      property; // Option 2
  dynamic building,
      neighborhood,
      location,
      url360 =" ",
      youtubeURL = " ",
      developer,
      rERAlistercompany,
      landLordName,
      reraAgentName,
      readbyDate;
  Map<dynamic, bool> numbers;
  dynamic _selectedLocationlistedBy,
      _selectedLocationzonedFor,
      _selectedLocationlandLord,
      _selectedLocationoccupancyStatus,
      _selectedLocationProperty;

  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;

    numbers = {
      translator.translate("Available Furnished"): false,
      translator.translate("Available Networked"): false,
      translator.translate("Conference room"): false,
      translator.translate("Covered parking"): false,
      translator.translate("Dining in building"): false,
      translator.translate("Retail in building"): false,
      translator.translate("Shared gym"): false,
      translator.translate("Shared spa"): false,
      translator.translate("View of landmark"): false,
      translator.translate("View of water"): false,
    };
  }

  Widget _reraAgent() {
    return Column(children: [
      _buildName(context, double.infinity,
          translator.translate("RERA Broker ID number"), 18, 1),
      SizedBox(
        height: 5.w,
      ),
      _buildName(context, double.infinity,
          translator.translate("RERA lister company name"), 19, 2),
      SizedBox(
        height: 5.w,
      ),
      _buildName(context, double.infinity,
          translator.translate("RERA premit number"), 20, 1),
      SizedBox(
        height: 5.w,
      ),
      _buildName(context, double.infinity,
          translator.translate("RERA agent name"), 21, 2),
      SizedBox(
        height: 5.w,
      ),
    ]);
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
              _selectedLocationoccupancyStatus = newValue;
            }
            if (choice == 2) {
              _selectedLocationlistedBy = newValue;
            }
            if (choice == 3) {
              _selectedLocationzonedFor = newValue;
            }
            if (choice == 4) {
              _selectedLocationlandLord = newValue;
              if (_selectedLocationlandLord == "Landlord") rera = 1;
              if (_selectedLocationlandLord == "Agent") rera = 2;
            }
            if (choice == 5) {
              _selectedLocationProperty = newValue;
              if (_selectedLocationProperty == "Complete") landLordRERA = 1;
              if (_selectedLocationProperty == "InComplete") landLordRERA = 2;
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
          if (choice != 3 && choice != 4) {
            if (value.isEmpty) return translator.translate('Required');
          }
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
          if (choice == 1)
            phoneNumber =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 2)
            discount = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 3) url360 = value;
          if (choice == 4) youtubeURL = value;
          if (choice == 5) developer = value;
          if (choice == 6) readbyDate = value;
          if (choice == 7)
            sizeSQFT = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 8)
            maintenanceFee =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 9)
            totalClosingFee =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 10)
            buyerTransfer =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 11)
            sellerTransfer =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 12)
            propertyReferencyID =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 13)
            annualCommunityFee =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 14) neighborhood = value;
          if (choice == 15) building = value;
          if (choice == 16) location = value;
          if (choice == 17) landLordName = value;
          if (choice == 18)
            rERABrokerID =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 19) rERAlistercompany = value;
          if (choice == 20)
            rERApremitnumber =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 21) reraAgentName = value;
          if (choice == 25)
            reraTitleDeedNumber =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 26)
            reraPreRegistrationNumber =
                NumberUtility.changeDigit(value, NumStrLanguage.English);
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
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
          translator.translate("Add commercial for Sale"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(context, 42.w,
                          translator.translate("360 Tour URL"), 3, 2),
                      _buildName(context, 42.w,
                          translator.translate("Youtube URL"), 4, 2),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(context, 42.w,
                          translator.translate("Developer"), 5, 2),
                      _buildName(context, 42.w,
                          translator.translate("Read by (Date)"), 6, 2),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Size( sqft)2"), 7, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Maintenance"), 8, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Total Closing fee"), 9, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Buyer transfer fee"), 10, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Seller transfer fee"), 11, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Property Ref"), 12, 1),
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
                  _buildName(context, double.infinity,
                      translator.translate("Annual community fee"), 13, 1),
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
                      _buildName(context, 42.w,
                          translator.translate("Neighborhood"), 14, 2),
                      _buildName(context, 42.w,
                          translator.translate("Building"), 15, 2),
                    ],
                  ),
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
                      landLord, 4, _selectedLocationlandLord, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  if (rera == 2) _reraAgent(),
                  if (rera == 1)
                    _buildName(context, double.infinity,
                        translator.translate("Land lord name"), 17, 2),
                  if (rera == 1)
                    SizedBox(
                      height: 5.w,
                    ),
                  if (rera == 1)
                    _buildDropDown(translator.translate("Property"), property,
                        5, _selectedLocationProperty, double.infinity),
                  if (rera == 1)
                    SizedBox(
                      height: 5.w,
                    ),
                  if (landLordRERA == 1)
                    _buildName(context, double.infinity,
                        translator.translate("RERA Title deed number"), 25, 1),
                  if (landLordRERA == 2)
                    _buildName(
                        context,
                        double.infinity,
                        translator.translate("RERA Pre register number"),
                        26,
                        1),
                  if (landLordRERA == 2)
                    SizedBox(
                      height: 5.w,
                    ),
                  if (landLordRERA == 1)
                    SizedBox(
                      height: 5.w,
                    ),
                  _buildName(context, double.infinity,
                      translator.translate("Location"), 16, 2),
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
                              commercialAPI = 1576;
                            if (translator.currentLanguage == 'en')
                              commercialAPI = 1574;
                            await notesService.commercialForSale(
                                widget.title,
                                commercialAPI,
                                widget.commercialforSaleAPI,
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
