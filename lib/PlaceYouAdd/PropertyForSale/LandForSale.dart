import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/PlaceYouAdd/Motors/notes_service.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:validators/validators.dart';
import 'notes_serviceForSale.dart';

class LandForSale extends StatefulWidget {
  @override
  _LandForSaleState createState() => _LandForSaleState();
}

class _LandForSaleState extends State<LandForSale> {
  final myController = TextEditingController();

  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price;
  dynamic title, description;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> type = ["ok"] ; // Option 2

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
            translator.translate("Land for Salee"),
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
                        translator.translate("Title"), 1,2),
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildName(context, MediaQuery.of(context).size.width,
                        translator.translate("Price"), 2,1),
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
                                    return LandForSale2(
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

class FreeHold {
  dynamic name;
  dynamic index;
  FreeHold({this.name, this.index});
}

class LandForSale2 extends StatefulWidget {
  final dynamic price;
  final dynamic title, description;
  LandForSale2({
    @required this.price,
    @required this.title,
    @required this.description,
  });
  @override
  _LandForSale2State createState() => _LandForSale2State();
}

class _LandForSale2State extends State<LandForSale2>
    with AutomaticKeepAliveClientMixin {
  List<dynamic> listedBy, zonedFor, landLord, property; // Option 2
  List<FreeHold> freeHold;
  NotesServicee get notesServicee => GetIt.I<NotesServicee>(); 
  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic phoneNumber,
      discount,
      sizeSQFT,
      totaclosing,
      buyerTransferFee,
      propertyReference,
      sellerTransferFee,
      approvedBuild,
      rera,
      landLordRERA,
      rERABrokerID,
      rERApremitnumber,
      reraTitleDeedNumber,
      reraPreRegistrationNumber,
      id = 10,
      landForSaleAPI;
  dynamic _selectedlocationlistedBy,
      _selectedlocationzonedFor,
      _selectedlocationlandLord,
      _selectedLocationProperty,
      location,
      tour360 = " ",
      youtube = " ",
      rERAlistercompany,
      landLordName,
      reraAgentName,
      radioItem = 'Sort..';

  double paddding47 = 0, paddding39 = 0;
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
              _selectedlocationlistedBy = newValue;
            }
            if (choice == 2) {
              _selectedlocationzonedFor = newValue;
            }
            if (choice == 3) {
              _selectedlocationlandLord = newValue;
              if (_selectedlocationlandLord == "Landlord") rera = 1;
              if (_selectedlocationlandLord == "Agent") rera = 2;
            }
            if (choice == 4) {
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
          translator.translate("RERA Broker ID number"), 17,1),
      SizedBox(
        height: 5.w,
      ),
      _buildName(context, double.infinity,
          translator.translate("RERA lister company name"), 18,2),
      SizedBox(
        height: 5.w,
      ),
      _buildName(context, double.infinity,
          translator.translate("RERA premit number"), 19,1),
      SizedBox(
        height: 5.w,
      ),
      _buildName(context, double.infinity,
          translator.translate("RERA agent name"), 20,2),
      SizedBox(
        height: 5.w,
      ),
    ]);
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
        validator: (dynamic value) {
          if (choice != 3 && choice != 4) {
            if (value.isEmpty) return translator.translate('Required');
          }
            if (choice == 1 ||
              choice == 2 ||
              choice == 5 ||
              choice == 6 ||
              choice == 7 ||
              choice == 8 ||
              choice == 9 ||
              choice == 10 ||
              choice == 17 ||
              choice == 19 || 
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
          if (choice == 3) tour360 = value;
          if (choice == 4) youtube = value;
          if (choice == 5) sizeSQFT = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 6) totaclosing = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 7) buyerTransferFee = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 8) propertyReference = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 9) sellerTransferFee = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 10) approvedBuild = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 11) location = value;
          if (choice == 16) landLordName = value;
          if (choice == 17) rERABrokerID = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 18) rERAlistercompany = value;
          if (choice == 19) rERApremitnumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 20) reraAgentName = value;
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
    if (SizerUtil.deviceType == DeviceType.mobile) {
      paddding39 = 4.5.w;
      paddding47 = 14.w;
    }
    if (SizerUtil.deviceType == DeviceType.tablet) {
      paddding39 = 3.8.w;
      paddding47 = 12.w;
    }
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
          translator.translate("Land for Salee"),
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
                          translator.translate("Your phone number"), 1,1),
                      _buildName(
                          context, 42.w, translator.translate("Discount"), 2,1),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(context, 42.w,
                          translator.translate("360 Tour URL"), 3,2),
                      _buildName(context, 42.w,
                          translator.translate("Youtube URL"), 4,2),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(context, 42.w,
                          translator.translate("Size( sqft)2"), 5,1),
                      _buildName(context, 42.w,
                          translator.translate("Total Closing fee"), 6,1),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Buyer transfer fee"), 7,1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Property Ref"), 8,1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Seller transfer fee"), 9,1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Listed by"), listedBy, 1,
                      _selectedlocationlistedBy, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Zoned for"), zonedFor, 2,
                      _selectedlocationzonedFor, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Approved build up area size"), 10,1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Are you a landlord"),
                      landLord, 3, _selectedlocationlandLord, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  if (rera == 2) _reraAgent(),
                  if (rera == 1)
                    _buildName(context, double.infinity,
                        translator.translate("Land lord name"), 16,2),
                  if (rera == 1)
                    SizedBox(
                      height: 5.w,
                    ),
                  if (rera == 1)
                    _buildDropDown(translator.translate("Property"), property,
                        4, _selectedLocationProperty, double.infinity),
                  if (landLordRERA == 1)
                    _buildName(context, double.infinity,
                        translator.translate("RERA Title deed number"), 25,1),
                  if (landLordRERA == 2)
                    _buildName(context, double.infinity,
                        translator.translate("RERA Pre register number"), 26,1),
                  if (landLordRERA == 2)
                    SizedBox(
                      height: 5.w,
                    ),
                  if (landLordRERA == 1)
                    SizedBox(
                      height: 5.w,
                    ),
                  if (rera == 1)
                    SizedBox(
                      height: 5.w,
                    ),
                  Divider(thickness: 1),
                  Row(
                    children: [
                      Text(
                        translator.translate("Free Hold"),
                        style: TextStyle(color: Colors.black, fontSize: 4.5.w),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: freeHold
                            .map((data) => SizedBox(
                                  height: paddding47,
                                  child: RadioListTile(
                                    activeColor: Colors.orange,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    title: Text("${data.name}",
                                        style: TextStyle(fontSize: paddding39)),
                                    groupValue: id,
                                    value: data.index,
                                    onChanged: (val) {
                                      setState(() {
                                        radioItem = data.name;
                                        id = data.index;
                                      });
                                    },
                                  ),
                                ))
                            .toList(),
                      )),
                    ],
                  ),
                  Divider(thickness: 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Location"), 11,2),
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
                              landForSaleAPI = 1586;
                            }
                            if (translator.currentLanguage == 'en') {
                              landForSaleAPI = 1584;
                            }
                            if (!_formKey.currentState.validate()) return;

                            _formKey.currentState.save();

                            await notesServicee.landForSale(
                                widget.price,
                                widget.title,
                                widget.description,
                                phoneNumber,
                                discount,
                                sizeSQFT,
                                tour360,
                                youtube,
                                totaclosing,
                                buyerTransferFee,
                                propertyReference,
                                sellerTransferFee,
                                _selectedlocationlistedBy,
                                _selectedlocationzonedFor,
                                approvedBuild,
                                _selectedlocationlandLord,
                                radioItem,
                                location,
                                landForSaleAPI,
                                landLordName,
                                _selectedLocationProperty,
                                rERABrokerID,
                                reraAgentName,
                                rERApremitnumber,
                                reraAgentName,
                                reraTitleDeedNumber,
                                reraPreRegistrationNumber,context);
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
