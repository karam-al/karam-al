import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart'; 
class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  double padding2, padding;
  int _index;
  String nameText, passwordText, emailText, phoneNumber;
  dynamic _selctedlocationNationality = "Syrian Arab Republic",
      _selctedlocationGender = "Male";
  List<String> gender, nationality;

  void initState() {
    super.initState();
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

  Widget _buildName(BuildContext context, double x, dynamic text,
      dynamic choice, dynamic choice2) {
    return Container(
      width: x,
      child: TextFormField(
        initialValue: text,
        keyboardType: choice2 == 1 ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15, padding2, 15, 0),
            isDense: true,
            errorStyle: TextStyle(fontSize: 11.0),
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
        // validator: (dynamic value) {
        //   if (value.isEmpty) return translator.translate('Required');
        //   if (choice == 2) {
        //     if (value.isEmpty) return translator.translate('Required');
        //     if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
        //             .hasMatch(value) &&
        //         !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
        //             .hasMatch(value))
        //       return translator.translate('Please enter numbers');
        //   }
        // },
        // onSaved: (value) {
        // },
      ),
    );
  }

  Widget _buildDropDown(dynamic text, List<dynamic> list, dynamic choice,
      dynamic _selectedLocation2) {
    return DropdownButtonFormField(
      // validator: (value) =>
      //     value == null ? translator.translate('Required') : null,
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
          if (choice == 1) _selctedlocationNationality = newValue;
          if (choice == 2) _selctedlocationGender = newValue;
        });
      },
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    nameText = "Obai";
    passwordText = "235544";
    emailText = "oj@gmail.com";
    phoneNumber = "00963938172558";

    gender = [translator.translate('Male'), translator.translate('Female')];
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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(5.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [ 
                      Text(translator.translate("Name"),
                          style: TextStyle(fontSize: 4.5.w)),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, MediaQuery.of(context).size.width,
                      nameText, 1, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [ 
                      Text(translator.translate("Password"),
                          style: TextStyle(fontSize: 4.5.w)),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, MediaQuery.of(context).size.width,
                      passwordText, 2, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(translator.translate("Email"),
                          style: TextStyle(fontSize: 4.5.w)),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, MediaQuery.of(context).size.width,
                      emailText, 3, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(translator.translate("Phone number"),
                          style: TextStyle(fontSize: 4.5.w)),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, MediaQuery.of(context).size.width,
                      phoneNumber, 4, 2),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(translator.translate("Nationality"),
                          style: TextStyle(fontSize: 4.5.w)),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Select"), nationality, 1,
                      _selctedlocationNationality),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(translator.translate("Gender"),
                          style: TextStyle(fontSize: 4.5.w)),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Select"), gender, 2,
                      _selctedlocationGender),
                ],
              ),
            ),
          ),
        ));
  }
}
