import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'CarFRInputForm.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
class CarsForRent extends StatefulWidget {
  @override
  _CarsForRentState createState() => _CarsForRentState();
}

class _CarsForRentState extends State<CarsForRent> {
  //  bool get isEditing => widget.noteID != null;
  final myController = TextEditingController();
  dynamic _selectedLocationcartype2, _selectedLocationPriceper;
  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price, carForRentType, carForRentTypeSend;
  dynamic title, description;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> type, per; // Option 2

  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  chooseImage(ImageSource source, dynamic x) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (x == 1 && pickedFile != null) imageFile = File(pickedFile.path);

      if (x == 2 && pickedFile != null) imageFile2 = File(pickedFile.path);
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
        validator: (var value) {
           if (value.isEmpty)
            return translator.translate('Required');
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
          if (choice == 2) price = NumberUtility.changeDigit(value, NumStrLanguage.English);
        },
      ),
    ); 
  } 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    type = [
      translator.translate('4x4'),
      translator.translate('Luxury Coupe'),
      translator.translate('Sedan'),
      translator.translate('Sport Car')
    ];
    per = [
      translator.translate("Year3"),
      translator.translate("Month"),
      translator.translate("Day")
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
            translator.translate("Add Car For Rent"),
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
                      value: _selectedLocationcartype2,
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
                        carForRentType = type.indexOf(newValue);
                        setState(() {
                          _selectedLocationcartype2 = newValue;
                          if (translator.currentLanguage == 'ar') {
                          if (carForRentType == 0) carForRentTypeSend = 6471;
                          if (carForRentType == 1) carForRentTypeSend = 6473;
                          if (carForRentType == 2) carForRentTypeSend = 6469;
                          if (carForRentType == 3) carForRentTypeSend = 6467;
                          }
                          if (translator.currentLanguage == 'en') {
                          if (carForRentType == 0) carForRentTypeSend = 6463;
                          if (carForRentType == 1) carForRentTypeSend = 6465;
                          if (carForRentType == 2) carForRentTypeSend = 6461;
                          if (carForRentType == 3) carForRentTypeSend = 6459;
                          }
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return type.map<Widget>((dynamic text) {
                          return Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList();
                      },
                      items: type.map<DropdownMenuItem<dynamic>>((dynamic text) {
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
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildName(context, MediaQuery.of(context).size.width,
                        translator.translate("Price"), 2, 1),
                    SizedBox(
                      height: 5.w,
                    ),
                    /* _buildDropDown(
                        translator.translate("Select price per"), per, 1),*/
                    DropdownButtonFormField(
                      validator: (value) => value == null
                          ? translator.translate('Required')
                          : null,
                      isExpanded: true,
                      hint: Text("${translator.translate("Select price per")}",
                          style: TextStyle(fontSize: 4.w)),
                      value: _selectedLocationPriceper,
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
                          _selectedLocationPriceper = newValue;
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return per.map<Widget>((dynamic text) {
                          return Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList();
                      },
                      items: per.map<DropdownMenuItem<dynamic>>((dynamic text) {
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
                                    return CFRInputform(
                                        forRentType: carForRentTypeSend,
                                        pricePer: _selectedLocationPriceper,
                                        price: price,
                                        title: title,
                                        description: myController.text);
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
