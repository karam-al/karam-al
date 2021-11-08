import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:file_picker/file_picker.dart';
import 'notes_serviceJobs.dart';

class JbosWantedInput extends StatefulWidget {
  final dynamic choiceAPI;
  JbosWantedInput({@required this.choiceAPI});
  @override
  _JbosWantedInputState createState() => _JbosWantedInputState();
}

class _JbosWantedInputState extends State<JbosWantedInput> {
  final myController = TextEditingController();
  NotesServiceJobs get notesService => GetIt.I<NotesServiceJobs>();
  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price, phoneNumber, _index;
  dynamic title,
      basename,
      description,
      currentCompany,
      currentPosition,
      careerLevell,
      _selectedLocationspecialties,
      _selectedLocationgender,
      _selectedLocationnationality,
      _selectedLocationCurrentLocation,
      _selectedLocationperiod,
      _selectedLocationvisaStatus,
      _selectedLocationcareerLevel,
      _selectedLocationsalary,
      _selectedLocationworkExperience,
      _selectedLocationedulevel,
      _selectedLocationcommitment,
      whereWouldYouLikeTOWork;
  File file;
  final picker = ImagePicker();
  List<dynamic> specialties,
      gender,
      nationality,
      period,
      visaStatus,
      careerLevel,
      salary,
      workExperience,
      edulevel,
      commitment; // Option 2

  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
            nationality = [
      "Afghanistan",
      "Aland Islands",
      "Albania",
      "Algeria",
      "American Samoa",
      "Andorra",
      "Angola",
      "Anguilla",
      "Antarctica",
      "Antigua and Barbuda",
      "Argentina",
      "Armenia",
      "Aruba",
      "Australia",
      "Austria",
      "Azerbaijan",
      "Bahamas",
      "Bahrain",
      "Bangladesh",
      "Barbados",
      "Belarus",
      "Belgium",
      "Belize",
      "Benin",
      "Bermuda",
      "Bhutan",
      "Bolivia (Plurinational State of)",
      "Bonaire, Sint Eustatius and Saba",
      "Bosnia and Herzegovina",
      "Botswana",
      "Bouvet Island",
      "Brazil",
      "British Indian Ocean Territory",
      "Brunei Darussalam",
      "Bulgaria",
      "Burkina Faso",
      "Burundi",
      "Cabo Verde",
      "Cambodia",
      "Cameroon",
      "Canada",
      "Cayman Islands",
      "Central African Republic",
      "Chad",
      "Chile",
      "China",
      "Christmas Island",
      "Cocos (Keeling) Islands",
      "Colombia",
      "Comoros",
      "Congo",
      "Congo, Democratic Republic of the",
      "Cook Islands",
      "Costa Rica",
      "Côte d'Ivoire",
      "Croatia",
      "Cuba",
      "Curaçao",
      "Cyprus",
      "Czechia",
      "Denmark",
      "Djibouti",
      "Dominica",
      "Dominican Republic",
      "Ecuador",
      "Egypt",
      "El Salvador",
      "Equatorial Guinea",
      "Eritrea",
      "Estonia",
      "Eswatini",
      "Ethiopia",
      "Falkland Islands (Malvinas)",
      "Faroe Islands",
      "Fiji",
      "Finland",
      "France",
      "French Guiana",
      "French Polynesia",
      "French Southern Territories",
      "Gabon",
      "Gambia",
      "Georgia",
      "Germany",
      "Ghana",
      "Gibraltar",
      "Greece",
      "Greenland",
      "Grenada",
      "Guadeloupe",
      "Guam",
      "Guatemala",
      "Guernsey",
      "Guinea",
      "Guinea-Bissau",
      "Guyana",
      "Haiti",
      "Heard Island and McDonald Islands",
      "Holy See",
      "Honduras",
      "Hong Kong",
      "Hungary",
      "Iceland",
      "India",
      "Indonesia",
      "Iran (Islamic Republic of)",
      "Iraq",
      "Ireland",
      "Isle of Man",
      "Israel",
      "Italy",
      "Jamaica",
      "Japan",
      "Jersey",
      "Jordan",
      "Kazakhstan",
      "Kenya",
      "Kiribati",
      "Korea (Democratic People's Republic of)",
      "Korea, Republic of",
      "Kuwait",
      "Kyrgyzstan",
      "Lao People's Democratic Republic",
      "Latvia",
      "Lebanon",
      "Lesotho",
      "Liberia",
      "Libya",
      "Liechtenstein",
      "Lithuania",
      "Luxembourg",
      "Macao",
      "Madagascar",
      "Malawi",
      "Malaysia",
      "Maldives",
      "Mali",
      "Malta",
      "Marshall Islands",
      "Martinique",
      "Mauritania",
      "Mauritius",
      "Mayotte",
      "Mexico",
      "Micronesia (Federated States of)",
      "Moldova, Republic of",
      "Monaco",
      "Mongolia",
      "Montenegro",
      "Montserrat",
      "Morocco",
      "Mozambique",
      "Myanmar",
      "Namibia",
      "Nauru",
      "Nepal",
      "Netherlands",
      "New Caledonia",
      "New Zealand",
      "Nicaragua",
      "Niger",
      "Nigeria",
      "Niue",
      "Norfolk Island",
      "North Macedonia",
      "Northern Mariana Islands",
      "Norway",
      "Oman",
      "Pakistan",
      "Palau",
      "Palestine, State of",
      "Panama",
      "Papua New Guinea",
      "Paraguay",
      "Peru",
      "Philippines",
      "Pitcairn",
      "Poland",
      "Portugal",
      "Puerto Rico",
      "Qatar",
      "Réunion",
      "Romania",
      "Russian Federation",
      "Rwanda",
      "Saint Barthélemy",
      "Saint Helena, Ascension and Tristan da Cunha",
      "Saint Kitts and Nevis",
      "Saint Lucia",
      "Saint Martin (French part)",
      "Saint Pierre and Miquelon",
      "Saint Vincent and the Grenadines",
      "Samoa",
      "San Marino",
      "Sao Tome and Principe",
      "Saudi Arabia",
      "Senegal",
      "Serbia",
      "Seychelles",
      "Sierra Leone",
      "Singapore",
      "Sint Maarten (Dutch part)",
      "Slovakia",
      "Slovenia",
      "Solomon Islands",
      "Somalia",
      "South Africa",
      "South Georgia and the South Sandwich Islands",
      "South Sudan",
      "Spain",
      "Sri Lanka",
      "Sudan",
      "Suriname",
      "Svalbard and Jan Mayen",
      "Sweden",
      "Switzerland",
      "Syrian Arab Republic",
      "Taiwan, Province of China",
      "Tajikistan",
      "Tanzania, United Republic of",
      "Thailand",
      "Timor-Leste",
      "Togo",
      "Tokelau",
      "Tonga",
      "Trinidad and Tobago",
      "Tunisia",
      "Turkey",
      "Turkmenistan",
      "Turks and Caicos Islands",
      "Tuvalu",
      "Uganda",
      "Ukraine",
      "United Arab Emirates",
      "United Kingdom of Great Britain and Northern Ireland",
      "United States of America",
      "United States Minor Outlying Islands",
      "Uruguay",
      "Uzbekistan",
      "Vanuatu",
      "Venezuela (Bolivarian Republic of)",
      "Viet Nam",
      "Virgin Islands (British)",
      "Virgin Islands (U.S.)",
      "Wallis and Futuna",
      "Western Sahara",
      "Yemen",
      "Zambia",
      "Zimbabwe",
    ];
  }

  chooseFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path);
    }
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
          });
        },
      ),
    );
  }

  Widget fileName(File file) {
    basename = file.path.split('/').last;
    return Text(
      "$basename",
      style: TextStyle(color: Colors.black, fontSize: 5.w),
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
            phoneNumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
          if (choice == 3) currentCompany = value;
          if (choice == 4) currentPosition = value;
          if (choice == 5) whereWouldYouLikeTOWork = value;
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
    gender = [translator.translate("Male"), translator.translate("Female")];

    period = [
      translator.translate("None"),
      translator.translate("1 week"),
      translator.translate("2 weeks"),
      translator.translate("3 weeks"),
      translator.translate("1 month"),
      translator.translate("2 months"),
      translator.translate("More than 2 months"),
    ];
    visaStatus = [
      translator.translate("Not Applicable"),
      translator.translate("Business2"),
      translator.translate("Employment"),
      translator.translate("Residence"),
      translator.translate("Spouse"),
      translator.translate("Student"),
      translator.translate("Tourist"),
      translator.translate("Visit"),
    ];

    careerLevel = [
      translator.translate("Student/Intern"),
      translator.translate("Junior"),
      translator.translate("Mid-level"),
      translator.translate("Senior"),
      translator.translate("Manager"),
      translator.translate("Executive/Director"),
    ];
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
    workExperience = [
      translator.translate("0-1 Years"),
      translator.translate("1-2 Years"),
      translator.translate("2-5 Years"),
      translator.translate("5-10 Years"),
      translator.translate("10-15 Years"),
      translator.translate("+15 Years"),
    ];
    edulevel = [
      translator.translate("N/A"),
      translator.translate("High-School / Secondary"),
      translator.translate("Bachelors Degree"),
      translator.translate("Masters Degree"),
      translator.translate("phD"),
    ];
    commitment = [
      translator.translate("Full Time"),
      translator.translate("Part Time"),
      translator.translate("Contract"),
      translator.translate("Temporary"),
      translator.translate("Other0"),
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
            translator.translate("I want a job"),
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
                  _buildDropDown(
                      translator.translate("Specialties"),
                      specialties,
                      1,
                      _selectedLocationspecialties,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Your phone number"), 2, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  TextField(
                    maxLines: 8,
                    controller: myController,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 4.w),
                        hintText: translator
                            .translate("Descripe the job you're looking for"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropDown(translator.translate("Gender"), gender, 2,
                          _selectedLocationgender, 42.w),
                      _buildDropDown(translator.translate("Nationality"),
                          nationality, 3, _selectedLocationnationality, 42.w)
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Current location"),
                      nationality,
                      4,
                      _selectedLocationCurrentLocation,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Current Company"), 3, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropDown(translator.translate("Period"), period, 5,
                          _selectedLocationperiod, 42.w),
                      _buildName(context, 42.w,
                          translator.translate("Current Position"), 4, 2)
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropDown(translator.translate("Visa status"),
                          visaStatus, 5, _selectedLocationvisaStatus, 42.w),
                      _buildDropDown(translator.translate("Career level"),
                          careerLevel, 5, _selectedLocationcareerLevel, 42.w),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Salary"), salary, 6,
                      _selectedLocationsalary, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Work experience"),
                      workExperience,
                      7,
                      _selectedLocationworkExperience,
                      double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Education Level"),
                      edulevel, 8, _selectedLocationedulevel, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Commitment"), commitment,
                      9, _selectedLocationcommitment, double.infinity),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(
                      context,
                      double.infinity,
                      translator.translate("Where Would You Like TO Work"),
                      5,
                      2),
                  SizedBox(
                    height: 5.w,
                  ),
                  Divider(),
                  Text(
                    translator.translate("CV"),
                    style: TextStyle(color: Colors.black, fontSize: 5.w),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  file != null ? fileName(file) : Container(),
                  Row(children: [
                    Container(
                      height: SizerUtil.deviceType == DeviceType.mobile
                          ? 12.w
                          : 10.w,
                      width: SizerUtil.deviceType == DeviceType.mobile
                          ? 40.w
                          : 35.w,
                      child: OutlinedButton(
                        onPressed: () {
                          chooseFile();
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
                              translator.translate("Add File"),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 4.w),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]), 
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
                              translator.translate("Submit"),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 4.w),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            onPressed: () {
                              if (!_formKey.currentState.validate()) return;
                              _formKey.currentState.save();
                              notesService.jobsWanted(
                                widget.choiceAPI, 
                                title, _selectedLocationspecialties, description, _selectedLocationgender, 
                                _selectedLocationnationality, _selectedLocationCurrentLocation, currentCompany, 
                                currentPosition, _selectedLocationperiod, _selectedLocationvisaStatus, _selectedLocationcareerLevel,
                                 _selectedLocationsalary, _selectedLocationworkExperience, _selectedLocationedulevel,
                                  _selectedLocationcommitment, whereWouldYouLikeTOWork, "location");
 
                              /*if (translator.currentLanguage == 'ar') {
                              root = 8652;
                              child = 8726;
                            }
                            if (translator.currentLanguage == 'en') {
                              root = 8644;
                              child = 8724;
                            }
                              notesService.jobsWanted(
                                api, title, 
                              specialties, phoneNumber, description,
                               gender, natinality, currentLocation, 
                               period, currentPosition, visaStatus,
                                careerLevel, salary, workExperience,
                                 eduLevel, commitment, whereWouldYouLikeTOWork);*/
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.w)
                  ]),
                
          ),
        )));
  }
}
