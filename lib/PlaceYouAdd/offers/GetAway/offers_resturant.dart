import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:get_it/get_it.dart';
import '../notes_serviceOffers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OffersGetaAwayResturnInput extends StatefulWidget {
  @override
  _OffersGetaAwayResturnInputState createState() =>
      _OffersGetaAwayResturnInputState();
}

class _OffersGetaAwayResturnInputState
    extends State<OffersGetaAwayResturnInput> {
  final myController = TextEditingController();
  dynamic basename;
  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price, residentialBuildingAPI, _index;
  dynamic title, description, _selectedLocationresidentialBuilding;
  File imageFile, imageFile2, imageFile3, imageFile4;
  final picker = ImagePicker();
  List<dynamic> type = ["ok"], residentialBuilding; // Option 2

  dynamic isItFree = "IsIt";
  dynamic rating = 0;
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

  chooseVideo(ImageSource source, dynamic x) async {
    final pickedFile = await picker.getVideo(source: source);
    setState(() {
      if (x == 1) imageFile3 = File(pickedFile.path);
      if (x == 2) imageFile4 = File(pickedFile.path);
    });
  }

  Widget videoName(File file) {
    basename = file.path.split('/').last;
    return Text(
      "$basename",
      style: TextStyle(color: Colors.black, fontSize: 5.w),
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
            translator.translate("Add Restaurant"),
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
                    Divider(thickness: 1),
                    Text(
                      translator.translate("Video"),
                      style: TextStyle(color: Colors.black, fontSize: 5.w),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    imageFile3 != null ? videoName(imageFile3) : Container(),
                    SizedBox(
                      height: 5.w,
                    ),
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
                              chooseVideo(ImageSource.camera, 1);
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
                              chooseVideo(ImageSource.gallery, 1);
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

                    ////////////////// upload video ////////////////
                    ///
                    ///

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
                                    return OffersGetaAwayResturnInput2(
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

class OffersGetaAwayResturnInput2 extends StatefulWidget {
  final dynamic price;
  final dynamic title, description;
  OffersGetaAwayResturnInput2({
    @required this.price,
    @required this.title,
    @required this.description,
    // @required this.residentialBuildingAPI,
  });
  @override
  _OffersGetaAwayResturnInput2State createState() =>
      _OffersGetaAwayResturnInput2State();
}

class _OffersGetaAwayResturnInput2State
    extends State<OffersGetaAwayResturnInput2>
    with AutomaticKeepAliveClientMixin {
  NotesServiceeOffers get notesService => GetIt.I<NotesServiceeOffers>();
  bool subvalue = false;
  double padding = 0,
      padding2 = 0,
      padding3 = 0,
      leadingSize = 0,
      paddding47 = 0,
      paddding39 = 0;
  dynamic phoneNumber, discount, quentity, root, child;
  List<dynamic> listedBy, year, month, day, menu;
  dynamic location,
      _selectedLocationYearFrom,
      _selectedLocationMonthFrom,
      _selectedLocationDayFrom,
      _selectedLocationYearTo,
      _selectedLocationMonthTo,
      _selectedLocationDayTo,
      website,
      email;
  List<FreeHold> freeHold;
  dynamic _selectedLocationoMenu;

  dynamic isItFree = "IsIt";
  dynamic rating = 0;
  void initState() {
    super.initState();
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
      "2021",
      "2022",
      "2023",
      "2024",
      "2025",
      "2026",
      "2027",
      "2028",
      "2029",
      "2030",
      "2031",
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
              _selectedLocationYearFrom = newValue;
            }
            if (choice == 2) {
              _selectedLocationMonthFrom = newValue;
            }
            if (choice == 3) {
              _selectedLocationDayFrom = newValue;
            }
            if (choice == 4) {
              _selectedLocationYearTo = newValue;
            }
            if (choice == 5) {
              _selectedLocationMonthTo = newValue;
            }
            if (choice == 6) {
              _selectedLocationDayTo = newValue;
            }
            if (choice == 7) {
              _selectedLocationoMenu = newValue;
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
          if (choice == 1 || choice == 2 || choice == 3) {
            if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
                    .hasMatch(value) &&
                !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
                    .hasMatch(value))
              return translator.translate('Please enter numbers');
          }
        },
        onSaved: (value) {
          if (choice == 1)
            phoneNumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 2)
            discount = NumberUtility.changeDigit(value, NumStrLanguage.English); 
          if (choice == 3)
            quentity = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 4) website = value;
          if (choice == 5) email = value;
          if (choice == 6) location = value;
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    menu = [
      translator.translate("Meals"),
      translator.translate("Drinks"),
      translator.translate("Snack"),
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
          translator.translate("Add Restaurant"),
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
                      subvalue == false
                          ? _buildName(context, 42.w,
                              translator.translate("Discount"), 2, 1)
                          : Container(),
                    ],
                  ),
                  CheckboxListTile(
                    activeColor: Colors.orange,
                    title: Text(
                      translator.translate('Is This Offer Free'),
                      style: TextStyle(fontSize: 5.w),
                    ),
                    value: this.subvalue,
                    onChanged: (bool value) {
                      setState(() {
                        this.subvalue = value;
                        if (value == true) isItFree = "Is This Offer Free";
                      });
                    },
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Menuu"), menu, 7,
                      _selectedLocationoMenu, double.infinity),

                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(translator.translate("From Date"),
                          style: TextStyle(fontSize: 4.w)),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      _buildDropDown(translator.translate("Year2"), year, 1,
                          _selectedLocationYearFrom, 28.w),
                      SizedBox(
                        width: 2.w,
                      ),
                      _buildDropDown(translator.translate("Month"), month, 2,
                          _selectedLocationMonthFrom, 28.w),
                      SizedBox(
                        width: 2.w,
                      ),
                      _buildDropDown(translator.translate("Day"), day, 3,
                          _selectedLocationDayFrom, 28.w)
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(translator.translate("To Date"),
                          style: TextStyle(fontSize: 4.w)),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      _buildDropDown(translator.translate("Year2"), year, 4,
                          _selectedLocationYearTo, 28.w),
                      SizedBox(
                        width: 2.w,
                      ),
                      _buildDropDown(translator.translate("Month"), month, 5,
                          _selectedLocationMonthTo, 28.w),
                      SizedBox(
                        width: 2.w,
                      ),
                      _buildDropDown(translator.translate("Day"), day, 6,
                          _selectedLocationDayTo, 28.w)
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),

                  _buildName(context, MediaQuery.of(context).size.width,
                      translator.translate("Quentity"), 3, 1),

                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, MediaQuery.of(context).size.width,
                      translator.translate("WebSite"), 4, 2),

                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Email"), 5, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  //////////// here is check box Is This Offer Free/////////////////

                  /////////////////////////////////
                  ///
                  ///
                  ///
                  _buildName(context, MediaQuery.of(context).size.width,
                      translator.translate("Location"), 6, 2),
                  SizedBox(
                    height: 10.w,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (ratingValue) {
                          setState(() {
                            rating = ratingValue.toInt();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  ///////////////// here is rating ///////////////
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
                              root = 8650;
                              child = 8674;
                            }
                            if (translator.currentLanguage == 'en') {
                              root = 8642;
                              child = 8658;
                            }
                            notesService.resturant(
                                widget.title,
                                root,
                                child,
                                widget.price,
                                widget.description,
                                phoneNumber,
                                discount,
                                isItFree,
                                _selectedLocationoMenu,
                                quentity,
                                _selectedLocationYearFrom,
                                _selectedLocationMonthFrom,
                                _selectedLocationDayFrom,
                                _selectedLocationYearTo,
                                _selectedLocationMonthTo,
                                _selectedLocationDayTo,
                                website,
                                email,
                                location,
                                rating);
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
