import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import 'notes_serviceJobs.dart';

class IamHiringInput extends StatefulWidget {
  final dynamic choiceAPI;
  IamHiringInput({@required this.choiceAPI});
  @override
  _IamHiringInputState createState() => _IamHiringInputState();
}

class _IamHiringInputState extends State<IamHiringInput> {
  final myController = TextEditingController();

  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic residentialBuildingAPI, _index, iamHiringAPI, tradeLicense, phoneNumber;
  dynamic _selectedLocationIndustry,
      companyName,
      contactName,
      address,
      companyWebsite,
      _selectedLocationCompanySize;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> type = ["ok"], industry, companySize; // Option 2

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
            _selectedLocation2 = newValue;
            if (choice == 1) _selectedLocationIndustry = newValue;
            if (choice == 2) _selectedLocationCompanySize = newValue;
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
          if (choice == 2 ||choice == 4) {
            if (value.isEmpty) return translator.translate('Required');
            if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
                    .hasMatch(value) &&
                !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
                    .hasMatch(value))
              return translator.translate('Please enter numbers');
          }
        },
        onSaved: (value) {
          if (choice == 1) companyName = value;
          if (choice == 2)
            tradeLicense = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 3) contactName = value;
          if (choice == 4)
            phoneNumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 5) address = value;
          if (choice == 6) companyWebsite = value;
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    /*
translator.translate("Accounting"),
      translator.translate("Architecture & Interior Design"),
      translator.translate("Automotive"),
      translator.translate("Beauty"),
      translator.translate("Business Development"),
      translator.translate("Construction2"),
      translator.translate("Customer Service"),
      translator.translate("Education2"),
      translator.translate("Engineering"),
      translator.translate("Fashion"),
      translator.translate("Food & Beverages"),
      translator.translate("Graphic Design"),
      translator.translate("Hospitality & Restaurants"),
      translator.translate("HR & Recruitment"),
      translator.translate("Legal Services"),
      translator.translate("Logistics & Distribution"),
      translator.translate("Marketing & Advertising"),
      translator.translate("Media"),
      translator.translate("Medical & Healthcare"),
      translator.translate("Online Media"),
      translator.translate("Real Estate"),
      translator.translate("Retail & Consumer Goods"),
      translator.translate("Safety & Security"),
      translator.translate("Sales"),
      translator.translate("Secretarial"),
      translator.translate("Sports & Fitness"),
      translator.translate("Transportation"),
      translator.translate("Travel & Tourism"),
    */

    industry = [
      translator.translate("Accounting"),
      translator.translate("Airlines and Aviation"),
      translator.translate("Architecture and Interior Design"),
      translator.translate("Art and Entertainment"),
      translator.translate("Automative"),
      translator.translate("Banking and Finance"),
      translator.translate("Beauty"),
      translator.translate("Business Development"),
      translator.translate("Business Supplies and Equipment"),
      translator.translate("Construction"),
      translator.translate("Customer Service"),
      translator.translate("Education"),
      translator.translate("Engineering"),
      translator.translate("Environmental Services"),
      translator.translate("Event Management"),
      translator.translate("Executive"),
      translator.translate("Fashion"),
      translator.translate("Food and Beverages"),
      translator.translate("Government / Administration"),
      translator.translate("Graphic Design"),
      translator.translate("HR and Recruitment"),
      translator.translate("Hospitality and Restaurants"),
      translator.translate("Import and Export"),
      translator.translate("Industrial and Manufacturing"),
      translator.translate("Information Technology"),
      translator.translate("Insurance"),
      translator.translate("Internet"),
      translator.translate("Legal Services"),
      translator.translate("Logistics and Distribution"),
      translator.translate("Marketing and Advertising"),
      translator.translate("Media"),
      translator.translate("Medical and Healthcare"),
      translator.translate("Oil, Gas and Energy"),
      translator.translate("Online Media"),
      translator.translate("Pharmaceuticals"),
      translator.translate("Public Relations"),
      translator.translate("Real Estate"),
      translator.translate("Research and Development"),
      translator.translate("Retail and Consumer Goods"),
      translator.translate("Safety and Security"),
      translator.translate("Sales"),
      translator.translate("Secretarial"),
      translator.translate("Sports and Fitness"),
      translator.translate("Telecommunications"),
      translator.translate("Transportation"),
      translator.translate("Travel and Tourism"),
      translator.translate("Veterinary and Animals"),
      translator.translate("Warehousing"),
      translator.translate("Wholesale"),
    ];

    companySize = [
      translator.translate("unknown"),
      "1-10",
      "11-50",
      "51-200",
      "201-500",
      "501-1000",
      "1001-5000",
      "5000-10000",
      "+10000",
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
            translator.translate("I'm hiring"),
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
                        translator.translate("Company name"), 1, 2),
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildName(context, MediaQuery.of(context).size.width,
                        translator.translate("Trade license"), 2, 1),
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildDropDown(
                        translator.translate("Choose Industry"),
                        industry,
                        1,
                        _selectedLocationIndustry,
                        double.infinity),
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildDropDown(
                        translator.translate("Choose Company Size"),
                        companySize,
                        2,
                        _selectedLocationCompanySize,
                        double.infinity),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildName(context, 42.w,
                            translator.translate("Contract Name"), 3, 2),
                        _buildName(context, 42.w,
                            translator.translate("Your phone number"), 4, 1),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildName(context, double.infinity,
                        translator.translate("Address"), 5, 2),
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildName(context, double.infinity,
                        translator.translate("Company website"), 6, 2),
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
                                    return _IamHiringInputState2(
                                        phoneNumber: phoneNumber,
                                        api: widget.choiceAPI,
                                        companySize:
                                            _selectedLocationCompanySize,
                                        contractName: contactName,
                                        address: address,
                                        tradeLicense: tradeLicense,
                                        companyName: companyName,
                                        description: myController.text,
                                        industry: _selectedLocationIndustry,
                                        companyWebSite: companyWebsite);
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

class _IamHiringInputState2 extends StatefulWidget {
  final dynamic tradeLicense, api, phoneNumber;
  final dynamic companyName,
      description,
      industry,
      companySize,
      contractName,
      address,
      companyWebSite;
  _IamHiringInputState2({
    @required this.description,
    @required this.companyName,
    @required this.tradeLicense,
    @required this.industry,
    @required this.companySize,
    @required this.api,
    @required this.contractName,
    @required this.phoneNumber,
    @required this.address,
    @required this.companyWebSite,
  });
  @override
  __IamHiringInputState2State createState() => __IamHiringInputState2State();
}

class __IamHiringInputState2State extends State<_IamHiringInputState2>
    with AutomaticKeepAliveClientMixin {
  final myController = TextEditingController();
  double padding = 0,
      padding2 = 0,
      padding3 = 0,
      leadingSize = 0,
      paddding47 = 0,
      paddding39 = 0;

  List<dynamic> employmentType,
      minimumWorkExperience,
      minimumEducation,
      careerlevel; // Option 2

  List<FreeHold> freeHold;
  dynamic _selectedLocationCareerlevel,
      _selectedLocationMinimumEducation,
      _selectedLocationMinimumWorkExperience,
      _selectedLocationEmploymentType,
      jobTitle;
  File imageFile, imageFile2;
  final picker = ImagePicker();
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
              _selectedLocationCareerlevel = newValue;
            }
            if (choice == 2) {
              _selectedLocationEmploymentType = newValue;
            }
            if (choice == 3) {
              _selectedLocationMinimumWorkExperience = newValue;
            }
            if (choice == 4) {
              _selectedLocationMinimumEducation = newValue;
            }
          });
        },
      ),
    );
  }

  chooseImage(ImageSource source, dynamic x) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (x == 1) imageFile = File(pickedFile.path);
      if (x == 2) imageFile2 = File(pickedFile.path);
    });
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
          if (value.isEmpty) return translator.translate('Required');
        },
        onSaved: (value) {
          if (choice == 1) jobTitle = value;
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    careerlevel = [
      translator.translate("Student/Intern"),
      translator.translate("Junior"),
      translator.translate("Mid-level"),
      translator.translate("Senior"),
      translator.translate("Manager"),
      translator.translate("Executive/Director"),
    ];
    employmentType = [
      translator.translate("Full Time"),
      translator.translate("Part Time"),
      translator.translate("Contract"),
      translator.translate("Temporary"),
    ];
    minimumWorkExperience = [
      translator.translate("0-1 Years"),
      translator.translate("1-2 Years"),
      translator.translate("2-5 Years"),
      translator.translate("5-10 Years"),
      translator.translate("10-15 Years"),
      translator.translate("+15 Years"),
    ];
    minimumEducation = [
      translator.translate("N/A"),
      translator.translate("High-School / Secondary"),
      translator.translate("Bachelors Degree"),
      translator.translate("Masters Degree"),
      translator.translate("phD"),
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
          translator.translate("I'm hiring"),
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
                      translator.translate("Job Title"), 1, 2),
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
                        contentPadding: EdgeInsets.fromLTRB(15, padding, 15, 0),
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
                  _buildDropDown(
                      translator.translate("Career level"),
                      careerlevel,
                      1,
                      _selectedLocationCareerlevel,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Employment type"),
                      employmentType,
                      2,
                      _selectedLocationEmploymentType,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Work experience"),
                      minimumWorkExperience,
                      3,
                      _selectedLocationMinimumWorkExperience,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Education"),
                      minimumEducation,
                      4,
                      _selectedLocationMinimumEducation,
                      double.infinity),
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
                          onPressed: () {
                            /*if (!_formKey.currentState.validate()) return;
                            _formKey.currentState.save();*/
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return IamHiringInput3(
                                    companyWebSite: widget.companyWebSite,
                                    minimumEdu:
                                        _selectedLocationMinimumEducation,
                                    address: widget.address,
                                    contractName: widget.contractName,
                                    tradeLicense: widget.tradeLicense,
                                    employmentType:
                                        _selectedLocationEmploymentType,
                                    phoneNumber: widget.phoneNumber,
                                    api: widget.api,
                                    minimumWorkExperience:
                                        _selectedLocationMinimumWorkExperience,
                                    description: widget.description,
                                    industry: widget.industry,
                                    careerLevel: _selectedLocationCareerlevel,
                                    jobTitle: jobTitle,
                                    companySize: widget.companySize,
                                    jobDescription: myController.text,
                                    companyName: widget.companyName,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            translator.translate("Next"),
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

class IamHiringInput3 extends StatefulWidget {
  final dynamic tradeLicense, api, phoneNumber;
  final dynamic companyName,
      description,
      industry,
      companySize,
      contractName,
      address,
      companyWebSite,
      jobTitle,
      jobDescription,
      careerLevel,
      employmentType,
      minimumWorkExperience,
      minimumEdu;
  IamHiringInput3(
      {@required this.description,
      @required this.companyName,
      @required this.tradeLicense,
      @required this.industry,
      @required this.companySize,
      @required this.api,
      @required this.contractName,
      @required this.phoneNumber,
      @required this.address,
      @required this.companyWebSite,
      @required this.jobTitle,
      @required this.jobDescription,
      @required this.careerLevel,
      @required this.employmentType,
      @required this.minimumWorkExperience,
      @required this.minimumEdu});
  @override
  __IamHiringInput3State createState() => __IamHiringInput3State();
}

class __IamHiringInput3State extends State<IamHiringInput3>
    with AutomaticKeepAliveClientMixin {
  final myController = TextEditingController();
  double padding = 0,
      padding2 = 0,
      padding3 = 0,
      leadingSize = 0,
      paddding47 = 0,
      paddding39 = 0;
  List<dynamic> salary, year, month, day, specialties; // Option 2
  dynamic skill1 = "",
      skill2 = "",
      skill3 = "",
      skill4 = "",
      skill5 = "",
      benefits = "",
      _selectedLocationYear,
      _selectedLocationMonth,
      _selectedLocationDay;

  List<FreeHold> freeHold;
  dynamic _selectedLocationsalary, _selectedLocationSpecialties;

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
            if (choice == 1) _selectedLocationsalary = newValue;
            if (choice == 2) _selectedLocationYear = newValue;
            if (choice == 3) _selectedLocationMonth = newValue;
            if (choice == 4) _selectedLocationDay = newValue;
            if (choice == 5) _selectedLocationSpecialties = newValue;
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
        validator: (dynamic value) {
          if (value.isEmpty) return translator.translate('Required');
        },
        onSaved: (value) {
          if (choice == 1) skill1 = value;
          if (choice == 2) skill2 = value;
          if (choice == 3) skill3 = value;
          if (choice == 4) skill4 = value;
          if (choice == 5) skill5 = value;
          if (choice == 6) benefits = value;
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    salary = [
      translator.translate("Unspecified"),
      "0 - 1,999",
      "2,000 - 3,999",
      "4,000 - 5,999",
      "6,000 - 7,999",
      "8,000 - 11,999",
      "12,000 - 19,999",
      "20,000 - 29,999",
      "30,000 - 49,999",
      "50,000 - 99,999",
      "100,000+",
    ];

    specialties = [
      translator.translate("Accounting"),
      translator.translate("Architecture/Eng2"),
      translator.translate("Art/Design2"),
      translator.translate("Bank/Finance2"),
      translator.translate("Business Development"),
      translator.translate("Construction"),
      translator.translate("Consulting2"),
      translator.translate("Education"),
      translator.translate("Executive"),
      translator.translate("Hospitality2"),
      translator.translate("HR/Recruiting2"),
      translator.translate("IT/Telecom2"),
      translator.translate("Marketing/PR2"),
      translator.translate("Media"),
      translator.translate("Medical/Health2"),
      translator.translate("Oil/Gas2"),
      "Other",
      translator.translate("Retail2"),
      translator.translate("Sales"),
      translator.translate("Secretaria")
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
          translator.translate("I'm hiring"),
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
                  _buildDropDown(
                      translator.translate("Specialties"),
                      specialties,
                      5,
                      _selectedLocationSpecialties,
                      double.infinity),
                  SizedBox(
                    height: 6.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Skill 1"), 1, 2),
                  SizedBox(
                    height: 6.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Skill 2"), 2, 2),
                  SizedBox(
                    height: 6.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Skill 3"), 3, 2),
                  SizedBox(
                    height: 6.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Skill 4"), 4, 2),
                  SizedBox(
                    height: 6.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Skill 5"), 5, 2),
                  SizedBox(
                    height: 6.w,
                  ),
                  _buildDropDown(translator.translate("Salary"), salary, 1,
                      _selectedLocationsalary, double.infinity),
                  SizedBox(
                    height: 6.w,
                  ),
                  _buildName(
                      context,
                      double.infinity,
                      translator
                          .translate("Benefits(bonus, health insurance , etc"),
                      6,
                      2),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(
                        translator.translate("Expires on"),
                        style: TextStyle(color: Colors.black, fontSize: 5.w),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      _buildDropDown(translator.translate("Year2"), year, 2,
                          _selectedLocationYear, 28.w),
                      SizedBox(
                        width: 2.w,
                      ),
                      _buildDropDown(translator.translate("Month"), month, 3,
                          _selectedLocationMonth, 28.w),
                      SizedBox(
                        width: 2.w,
                      ),
                      _buildDropDown(translator.translate("Day"), day, 4,
                          _selectedLocationDay, 28.w)
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
                          onPressed: () {
                            /*if (!_formKey.currentState.validate()) return;
                            _formKey.currentState.save();*/
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return IamHiringInput4(
                                    specilites:_selectedLocationSpecialties,
                                    benefits: benefits,
                                    skill5: skill5,
                                    skill3: skill3,
                                    monthlySalary: _selectedLocationsalary,
                                    skill4: skill4,
                                    skill2: skill2,
                                    skill1: skill1,
                                    year: _selectedLocationYear,
                                    day: _selectedLocationDay,
                                    month: _selectedLocationMonth,
                                    companyWebSite: widget.companyWebSite,
                                    minimumEdu: widget.minimumEdu,
                                    address: widget.address,
                                    contractName: widget.contractName,
                                    tradeLicense: widget.tradeLicense,
                                    employmentType: widget.employmentType,
                                    phoneNumber: widget.phoneNumber,
                                    api: widget.api,
                                    minimumWorkExperience:
                                        widget.minimumWorkExperience,
                                    description: widget.description,
                                    industry: widget.industry,
                                    careerLevel: widget.careerLevel,
                                    jobTitle: widget.jobTitle,
                                    companySize: widget.companySize,
                                    jobDescription: widget.jobDescription,
                                    companyName: widget.companyName,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            translator.translate("Next"),
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

class IamHiringInput4 extends StatefulWidget {
  final dynamic tradeLicense, api, phoneNumber;
  final dynamic companyName,specilites,
      year,
      month,
      day,
      monthlySalary,
      description,
      industry,
      companySize,
      contractName,
      address,
      companyWebSite,
      jobTitle,
      jobDescription,
      careerLevel,
      employmentType,
      minimumWorkExperience,
      minimumEdu,
      skill1,
      skill2,
      skill3,
      skill4,
      skill5,
      benefits;
  IamHiringInput4({
    @required this.description,
    @required this.companyName,
    @required this.tradeLicense,
    @required this.industry,
    @required this.companySize,
    @required this.api,
    @required this.contractName,
    @required this.phoneNumber,
    @required this.address,
    @required this.companyWebSite,
    @required this.jobTitle,
    @required this.jobDescription,
    @required this.careerLevel,
    @required this.employmentType,
    @required this.minimumWorkExperience,
    @required this.minimumEdu,
    @required this.skill1,
    @required this.skill2,
    @required this.skill3,
    @required this.skill4,
    @required this.skill5,
    @required this.monthlySalary,
    @required this.benefits,
    @required this.year,
    @required this.month,
    @required this.day,
    @required this.specilites,
  });
  @override
  __IamHiringInput4State createState() => __IamHiringInput4State();
}

class __IamHiringInput4State extends State<IamHiringInput4>
    with AutomaticKeepAliveClientMixin {
  NotesServiceJobs get notesService => GetIt.I<NotesServiceJobs>();
  final myController = TextEditingController();
  double padding = 0,
      padding2 = 0,
      padding3 = 0,
      leadingSize = 0,
      paddding47 = 0,
      paddding39 = 0;

  bool subvalue = false;
  List<dynamic> listedBy; // Option 2
  dynamic location = "",
      foodManEat = "",
      theCorrectAnswer = "",
      listAwrongAnswer = "",
      listAnotherwrongAnswer = "",
      jobsBased = "";
  dynamic _selectedLocationListedBy;

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
            if (choice == 1) _selectedLocationListedBy = newValue;
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
        validator: (dynamic value) {
           if (value.isEmpty)
            return translator.translate('Required');
        },
        onSaved: (value) {
          if (choice == 1) location = value;
          if (choice == 2) foodManEat = value;
          if (choice == 3) theCorrectAnswer = value;
          if (choice == 4) listAwrongAnswer = value;
          if (choice == 5) listAnotherwrongAnswer = value;
          if (choice == 6) jobsBased = value;
        },
      ),
    );
  }

  Widget _askAQuestion() {
    return Column(
      children: [
        _buildName(context, double.infinity,
            translator.translate("What food dose Banana Man eat?"), 2, 2),
        SizedBox(
          height: 5.w,
        ),
        _buildName(context, double.infinity,
            translator.translate("What's the correct answer :"), 3, 2),
        SizedBox(
          height: 5.w,
        ),
        _buildName(context, double.infinity,
            translator.translate("List a wrong answer:"), 4, 2),
        SizedBox(
          height: 5.w,
        ),
        _buildName(context, double.infinity,
            translator.translate("List another wrong answer:"), 5, 2),
        SizedBox(
          height: 5.w,
        ),
        _buildName(context, double.infinity,
            translator.translate("Where's the job based?"), 6, 2),
        SizedBox(
          height: 5.w,
        ),
      ],
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    listedBy = [
      translator.translate('Employer'),
      translator.translate('Recruiter')
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
          translator.translate("I'm hiring"),
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
                  _buildDropDown(translator.translate("Listed by"), listedBy, 1,
                      _selectedLocationListedBy, double.infinity),
                  SizedBox(
                    height: 3.w,
                  ),
                  CheckboxListTile(
                    activeColor: Colors.orange,
                    title: Text(
                      translator.translate('Ask a Question'),
                      style: TextStyle(fontSize: 5.w),
                    ),
                    value: this.subvalue,
                    onChanged: (bool value) {
                      setState(() {
                        this.subvalue = value;
                      });
                    },
                  ),
                  if (subvalue == true) _askAQuestion(),
                  _buildName(context, double.infinity,
                      translator.translate("Location"), 1, 2),
                  SizedBox(
                    height: 35.w,
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
                          onPressed: () {
                            if (!_formKey.currentState.validate()) return;
                            _formKey.currentState.save();
                            notesService.iAmHiring(
                                widget.api,
                                widget.companyName,
                                widget.tradeLicense,
                                widget.industry,
                                widget.companySize,
                                widget.description,
                                widget.jobDescription,
                                widget.contractName,
                                widget.phoneNumber,
                                widget.address,
                                widget.companyWebSite,
                                widget.jobTitle,
                                widget.careerLevel,
                                widget.employmentType,
                                widget.minimumWorkExperience,
                                widget.minimumEdu,
                                widget.skill1,
                                widget.skill2,
                                widget.skill3,
                                widget.skill4,
                                widget.skill5,
                                widget.monthlySalary,
                                widget.benefits,
                                widget.year,
                                widget.month,
                                widget.day,
                                _selectedLocationListedBy,
                                foodManEat,
                                theCorrectAnswer,
                                listAwrongAnswer,
                                listAnotherwrongAnswer,
                                jobsBased,
                                location,
                                widget.specilites 
                                );

                            /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return IamHiringInput3(
                                         );
                                  },
                                ),
                              );*/
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
