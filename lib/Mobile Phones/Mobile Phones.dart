import 'dart:ui';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/MotorsMain/AllinMotorsTest.dart';
import 'package:oxydu/Pages/Specialization_company.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:oxydu/Data/Post_mobile.dart';
import '../WaterMark.dart';
import 'package:http/http.dart' as http;

TextEditingController controller = new TextEditingController();
String filter = "";
List<Post2> countries, result;

bool loading;

RangeValues _currentRangeValuesPriceTest = RangeValues(0, 450000);

RangeValues range;
RangeValues values1;
bool flag = false;
bool flag2 = false;
bool flag3 = false;
bool checkedValue = false;
bool checkedValueColorBlack = false,
    checkedValueColorBlue = false,
    checkedValueColorGold = false;
bool checkedValueColor8 = false,
    checkedValueColor16 = false,
    checkedValueColor32 = false;
int grid = 0;
int onChangeColor, onChangeMemory;
String incrementPriceStart = "";
String incrementPriceEnd = "";
String incrementYearStart = "";
String incrementYearEnd = "";
String incrementKMStart = "";
String incrementKMEnd = "";
String _searchText = "";
// ignore: deprecated_member_use
List<Post2> _searchList = List();
// ignore: deprecated_member_use
List<Post2> _searchList2 = List();
// ignore: deprecated_member_use
List<Post2> everythink = List();
RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
List<String> model = ['Any', 'IPHONE TEW', 'IPHONE TTY']; // Option 2.
int choice, choice2;
String _selectedLocation, _selectedLocation2; // Option 2
bool _IsSearching;
List<String> condition = ['Any', 'NEW', 'USED']; // Option 2
Map map = model.asMap();
Icrement c;
double ss = 0,
    paddding = 0,
    paddding2 = 0,
    paddding3 = 0,
    paddding4 = 0,
    paddding5 = 0,
    paddding6 = 0,
    paddding7 = 0,
    paddding8 = 0,
    paddding9 = 0,
    paddding10 = 0,
    paddding11 = 0,
    paddding12 = 0,
    paddding13 = 0,
    paddding14 = 0,
    paddding15 = 0,
    paddding16 = 0,
    paddding17 = 0,
    paddding18 = 0,
    paddding19 = 0,
    paddding20 = 0,
    paddding21 = 0,
    paddding22 = 0,
    paddding23 = 0,
    paddding24 = 0,
    paddding25 = 0,
    paddding26 = 0,
    paddding27 = 0,
    paddding28 = 0,
    landscape = 0;
List<String> colors = [];
List<String> memory = [];

final TextEditingController _searchQuery = TextEditingController();
var redrawObject;

class MobilePhones extends StatefulWidget {
  @override
  State createState() => MobilePhonesState();
}

class SortList {
  String name;
  int index;
  SortList({this.name, this.index});
}

class MobilePhonesState extends State<MobilePhones> {
  // Default Radio Button Item
  String radioItem = 'Sort..';

  // Group Value for Radio Button.
  int id = 10;

  List<SortList> sort = [
    SortList(
      index: 1,
      name: "By Price From Lowest To Highest",
    ),
    SortList(
      index: 2,
      name: "By Price From Highest To Lowest",
    ),
    SortList(
      index: 3,
      name: "By Date From Lowest To Highest",
    ),
    SortList(
      index: 4,
      name: "By Date From Highest To Lowest",
    ),
  ];

  List<RangeSliderData> rangeSliders;
  double padding = 0.0;

  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  Widget appBarTitle = new Text(
    " ",
    style: new TextStyle(color: Colors.white, fontSize: 17),
  );

  // ignore: missing_return
  List<Post2> test() {
    if (memory.length < colors.length) {
      memory.length = colors.length;

      memory[memory.indexWhere((element) => element == null)] = "empty";
    }

    if (memory.length > colors.length) {
      colors.length = memory.length;
      colors[colors.indexWhere((element) => element == null)] = "empty";
    }

    if ((checkedValueColor8 || checkedValueColor16 || checkedValueColor32) &&
        (!checkedValueColorBlack &&
            !checkedValueColorBlue &&
            !checkedValueColorGold) &&
        (choice == 10 && choice2 == 10)) {
      _searchList2.clear();
      for (int i = 0; i < countries.length; i++) {
        for (int j = 0; j < memory.length; j++) {
          if (countries[i].memory.toLowerCase() == memory[j].toLowerCase() &&
              (countries[i].price >= _currentRangeValuesPriceTest.start)) {
            _searchList2.add(countries[i]);
            print(_searchList2.length);
          }
        }
      }
      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((checkedValueColor8 || checkedValueColor16 || checkedValueColor32) &&
        (!checkedValueColorBlack &&
            !checkedValueColorBlue &&
            !checkedValueColorGold) &&
        (choice != 10) &&
        (choice2 == 10)) {
      print("i am here");
      _searchList2.clear();

      for (int i = 0; i < countries.length; i++) {
        for (int j = 0; j < memory.length; j++) {
          if (countries[i].memory.toLowerCase() == memory[j].toLowerCase() &&
              (countries[i].price >= _currentRangeValuesPriceTest.start) &&
              (countries[i].model.toLowerCase() ==
                  _selectedLocation.toLowerCase())) {
            _searchList2.add(countries[i]);
            print(_searchList2.length);
          }
        }
      }

      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((checkedValueColor8 || checkedValueColor16 || checkedValueColor32) &&
        (!checkedValueColorBlack &&
            !checkedValueColorBlue &&
            !checkedValueColorGold) &&
        (choice == 10) &&
        (choice2 != 10)) {
      _searchList2.clear();

      for (int i = 0; i < countries.length; i++) {
        for (int j = 0; j < memory.length; j++) {
          if (countries[i].memory.toLowerCase() == memory[j].toLowerCase() &&
              (countries[i].price >= _currentRangeValuesPriceTest.start) &&
              (countries[i].condition.toLowerCase() ==
                  _selectedLocation2.toLowerCase())) {
            _searchList2.add(countries[i]);
            print(_searchList2.length);
          }
        }
      }

      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((checkedValueColor8 || checkedValueColor16 || checkedValueColor32) &&
        (!checkedValueColorBlack &&
            !checkedValueColorBlue &&
            !checkedValueColorGold) &&
        (choice != 10) &&
        (choice2 != 10)) {
      _searchList2.clear();

      for (int i = 0; i < countries.length; i++) {
        for (int j = 0; j < memory.length; j++) {
          if (countries[i].memory.toLowerCase() == memory[j].toLowerCase() &&
              (countries[i].price >= _currentRangeValuesPriceTest.start) &&
              (countries[i].model.toLowerCase() ==
                  _selectedLocation.toLowerCase()) &&
              (countries[i].condition.toLowerCase() ==
                  _selectedLocation2.toLowerCase())) {
            _searchList2.add(countries[i]);
            print(_searchList2.length);
          }
        }
      }

      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((checkedValueColorBlack ||
            checkedValueColorBlue ||
            checkedValueColorGold) &&
        (!checkedValueColor8 && !checkedValueColor16 && !checkedValueColor32) &&
        (choice == 10) &&
        (choice2 == 10)) {
      _searchList2.clear();
      print("color");
      for (int i = 0; i < countries.length; i++) {
        for (int k = 0; k < colors.length; k++) {
          if (countries[i].color.toLowerCase() == colors[k].toLowerCase() &&
              countries[i].price >= _currentRangeValuesPriceTest.start) {
            _searchList2.add(countries[i]);
            print(_searchList2.length);
            print(countries.length);
          }
        }
      }
      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((checkedValueColorBlack ||
            checkedValueColorBlue ||
            checkedValueColorGold) &&
        (!checkedValueColor8 && !checkedValueColor16 && !checkedValueColor32) &&
        (choice != 10) &&
        (choice2 == 10)) {
      _searchList2.clear();
      print("color");
      for (int i = 0; i < countries.length; i++) {
        for (int k = 0; k < colors.length; k++) {
          if (countries[i].color.toLowerCase() == colors[k].toLowerCase() &&
              (countries[i].price >= _currentRangeValuesPriceTest.start) &&
              (countries[i].price >= _currentRangeValuesPriceTest.start) &&
              (countries[i].model.toLowerCase() ==
                  _selectedLocation.toLowerCase())) {
            _searchList2.add(countries[i]);
            print(_searchList2.length);
            print(countries.length);
          }
        }
      }
      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((checkedValueColorBlack ||
            checkedValueColorBlue ||
            checkedValueColorGold) &&
        (!checkedValueColor8 && !checkedValueColor16 && !checkedValueColor32) &&
        (choice == 10) &&
        (choice2 != 10)) {
      _searchList2.clear();
      print("color");
      for (int i = 0; i < countries.length; i++) {
        for (int k = 0; k < colors.length; k++) {
          if (countries[i].color.toLowerCase() == colors[k].toLowerCase() &&
              (countries[i].price >= _currentRangeValuesPriceTest.start) &&
              (countries[i].price >= _currentRangeValuesPriceTest.start) &&
              (countries[i].condition.toLowerCase() ==
                  _selectedLocation2.toLowerCase())) {
            _searchList2.add(countries[i]);
            print(_searchList2.length);
            print(countries.length);
          }
        }
      }
      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((checkedValueColorBlack ||
            checkedValueColorBlue ||
            checkedValueColorGold) &&
        (!checkedValueColor8 && !checkedValueColor16 && !checkedValueColor32) &&
        (choice != 10) &&
        (choice2 != 10)) {
      _searchList2.clear();
      print("color");
      for (int i = 0; i < countries.length; i++) {
        for (int k = 0; k < colors.length; k++) {
          if (countries[i].color.toLowerCase() == colors[k].toLowerCase() &&
              (countries[i].price >= _currentRangeValuesPriceTest.start) &&
              (countries[i].price >= _currentRangeValuesPriceTest.start) &&
              (countries[i].model.toLowerCase() ==
                  _selectedLocation.toLowerCase()) &&
              (countries[i].condition.toLowerCase() ==
                  _selectedLocation2.toLowerCase())) {
            _searchList2.add(countries[i]);
            print(_searchList2.length);
            print(countries.length);
          }
        }
      }
      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((checkedValueColor8 || checkedValueColor16 || checkedValueColor32) &&
        (checkedValueColorBlack ||
            checkedValueColorBlue ||
            checkedValueColorGold) &&
        (choice == 10 && choice2 == 10)) {
      _searchList2.clear();
      print("memory and color");

      for (int i = 0; i < countries.length; i++) {
        for (int j = 0; j < memory.length; j++) {
          for (int k = 0; k < colors.length; k++) {
            if (countries[i].color.toLowerCase() == colors[k].toLowerCase() &&
                countries[i].memory.toLowerCase() == memory[j].toLowerCase() &&
                countries[i].price >= _currentRangeValuesPriceTest.start) {
              print("accepted");
              _searchList2.add(countries[i]);
              print(_searchList2.length);
              print(countries.length);
            }
          }
        }
      }

      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((checkedValueColor8 || checkedValueColor16 || checkedValueColor32) &&
        (checkedValueColorBlack ||
            checkedValueColorBlue ||
            checkedValueColorGold) &&
        (choice != 10 && choice2 == 10)) {
      _searchList2.clear();
      print("memory and color");

      for (int i = 0; i < countries.length; i++) {
        for (int j = 0; j < memory.length; j++) {
          for (int k = 0; k < colors.length; k++) {
            if (countries[i].color.toLowerCase() == colors[k].toLowerCase() &&
                countries[i].memory.toLowerCase() == memory[j].toLowerCase() &&
                (countries[i].price >= _currentRangeValuesPriceTest.start) &&
                (countries[i].price >= _currentRangeValuesPriceTest.start) &&
                (countries[i].model.toLowerCase() ==
                    _selectedLocation.toLowerCase())) {
              print("accepted");
              _searchList2.add(countries[i]);
              print(_searchList2.length);
              print(countries.length);
            }
          }
        }
      }

      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }
    if ((checkedValueColor8 || checkedValueColor16 || checkedValueColor32) &&
        (checkedValueColorBlack ||
            checkedValueColorBlue ||
            checkedValueColorGold) &&
        (choice != 10 && choice2 != 10)) {
      _searchList2.clear();
      print("memory and color");

      for (int i = 0; i < countries.length; i++) {
        for (int j = 0; j < memory.length; j++) {
          for (int k = 0; k < colors.length; k++) {
            if (countries[i].color.toLowerCase() == colors[k].toLowerCase() &&
                countries[i].memory.toLowerCase() == memory[j].toLowerCase() &&
                (countries[i].price >= _currentRangeValuesPriceTest.start) &&
                (countries[i].model.toLowerCase() ==
                    _selectedLocation.toLowerCase()) &&
                (countries[i].condition.toLowerCase() ==
                    _selectedLocation2.toLowerCase())) {
              print("accepted");
              _searchList2.add(countries[i]);
              print(_searchList2.length);
              print(countries.length);
            }
          }
        }
      }

      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }
    if ((checkedValueColor8 || checkedValueColor16 || checkedValueColor32) &&
        (checkedValueColorBlack ||
            checkedValueColorBlue ||
            checkedValueColorGold) &&
        (choice == 10 && choice2 != 10)) {
      _searchList2.clear();
      print("memory and color");

      for (int i = 0; i < countries.length; i++) {
        for (int j = 0; j < memory.length; j++) {
          for (int k = 0; k < colors.length; k++) {
            if (countries[i].color.toLowerCase() == colors[k].toLowerCase() &&
                countries[i].memory.toLowerCase() == memory[j].toLowerCase() &&
                (countries[i].price >= _currentRangeValuesPriceTest.start) &&
                (countries[i].price >= _currentRangeValuesPriceTest.start) &&
                (countries[i].condition.toLowerCase() ==
                    _selectedLocation2.toLowerCase())) {
              print("accepted");
              _searchList2.add(countries[i]);
              print(_searchList2.length);
              print(countries.length);
            }
          }
        }
      }

      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((!checkedValueColor8 && !checkedValueColor16 && !checkedValueColor32) &&
        (!checkedValueColorBlack &&
            !checkedValueColorBlue &&
            !checkedValueColorGold) &&
        (choice == 10 && choice2 == 10)) {
      _searchList = everythink;
      return _searchList;
    }

    if ((!checkedValueColor8 && !checkedValueColor16 && !checkedValueColor32) &&
        (!checkedValueColorBlack &&
            !checkedValueColorBlue &&
            !checkedValueColorGold) &&
        (choice != 10 && choice2 == 10)) {
      _searchList2.clear();
      for (int i = 0; i < countries.length; i++) {
        if (countries[i].model.toLowerCase() == _selectedLocation.toLowerCase())
          _searchList2.add(countries[i]);
      }
      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((!checkedValueColor8 && !checkedValueColor16 && !checkedValueColor32) &&
        (!checkedValueColorBlack &&
            !checkedValueColorBlue &&
            !checkedValueColorGold) &&
        (choice == 10 && choice2 != 10)) {
      _searchList2.clear();
      for (int i = 0; i < countries.length; i++) {
        if ((countries[i].condition.toLowerCase() ==
            _selectedLocation2.toLowerCase())) _searchList2.add(countries[i]);
      }

      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }

    if ((!checkedValueColor8 && !checkedValueColor16 && !checkedValueColor32) &&
        (!checkedValueColorBlack &&
            !checkedValueColorBlue &&
            !checkedValueColorGold) &&
        (choice != 10 && choice2 != 10)) {
      _searchList2.clear();
      for (int i = 0; i < countries.length; i++) {
        if ((countries[i].model.toLowerCase() ==
                _selectedLocation.toLowerCase()) &&
            (countries[i].condition.toLowerCase() ==
                _selectedLocation2.toLowerCase()))
          _searchList2.add(countries[i]);
      }

      result = _searchList2;
      _searchList = _searchList2;
      return _searchList;
    }
  }

  MobilePhonesState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          print("call1");
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          print("call2");
          _buildSearchList();
        });
      }
    });
  }

  List<Post2> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = result;
      //_list.map((contact) =>  Uiitem(contact)).toList();
    } else {
      /*for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      } 
      */

      _searchList = result
          .where((element) =>
              element.model.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();

      return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    }
  }

  Widget icrement1(String inc, RangeValues values1, bool flagg) {
    if (flagg == false) inc = values1.start.round().toString();
    if (flagg == true) inc = values1.end.round().toString();
    print(" inc$inc");
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          width: 140.0,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Colors.blueGrey,
              width: 2.0,
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 30,
                height: 38.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.arrow_drop_up,
                          size: 18.0,
                        ),
                        onTap: () {
                          int currentValue = int.parse(inc);
                          setState(() {
                            currentValue = currentValue + 10;

                            inc =
                                (currentValue).toString(); // incrementing value
                            print("currentValue$inc");
                            //    values1.start.toInt=int.parse(controller.text);
                          });
                        },
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 18.0,
                      ),
                      onTap: () {
                        int currentValue = int.parse(inc);
                        setState(() {
                          currentValue--;
                          inc = (currentValue > 0 ? currentValue : 0)
                              .toString(); // decrementing value
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(inc),
                /*TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  controller: controller,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------
  // Creates a list of RangeSlider definitions
  // -------------------------------------------------
  List<RangeSliderData> _rangeSliderDefinitions() {
    return <RangeSliderData>[
      RangeSliderData(
          min: 1.0, max: 100.0, lowerValue: 10.0, upperValue: 100.0),
    ];
  }

  List<Post2> _buildSortList() {
    result.forEach((element) {
      print(element.price);
    });
    if (id == 1) result.sort((a, b) => (a.price).compareTo(b.price));
    if (id == 2) result.sort((b, a) => (a.price).compareTo(b.price));
    if (id == 3) result.sort((a, b) => (a.price).compareTo(b.price));
    if (id == 4) result.sort((b, a) => (a.price).compareTo(b.price));

    _searchList = result;
    return _searchList;
  }

  Widget button(Function function) {
    return MaterialButton(
      elevation: 5,
      height: 30.0,
      minWidth: 90.0,
      color: Colors.white,
      child: Text("Call",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          )),
      onPressed: () {
        function();
      },
    );
  }

  final categories = ServicesMob();
  //final categories = ServicesMob.getPosts();
  @override
  void initState() {
    super.initState();

    //fill countries with objects
    choice = 10;
    choice2 = 10;
    onChangeColor = 0;
    onChangeMemory = 0;
    incrementPriceStart = "0";
    incrementPriceEnd = "450000";
    incrementYearStart = "1990";
    incrementYearEnd = "2021";
    incrementKMStart = "0";
    incrementKMEnd = "500";
    loading = true;
    _IsSearching = false;
    rangeSliders = _rangeSliderDefinitions();
    categories.getPosts().then((categories) {
      setState(() {
        countries = categories;
        _searchList = categories;
        everythink = categories;
        result = categories;
        loading = false;
      });
    }).catchError((err) {
      print("Error");
    });

    controller.addListener(() {
      setState(() {
        if (mounted) filter = controller.text;
      });
    });
  }

  void dispose() {
    // Set portrait orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

/*

  @override

  void dispose() {

  super.dispose();

  controller.dispose();

  }

  */

  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      translator.currentLanguage == 'en'
          ? landscape = MediaQuery.of(context).size.width * 0.17
          : landscape = MediaQuery.of(context).size.width * 0.097;

      translator.currentLanguage == 'en' ? paddding3 = 0 : paddding3 = 0;

      translator.currentLanguage == 'en'
          ? paddding = MediaQuery.of(context).size.width * 0.015
          : paddding = MediaQuery.of(context).size.width * 0.02;

      translator.currentLanguage == 'en'
          ? paddding2 = MediaQuery.of(context).size.width * 0.02
          : paddding2 = MediaQuery.of(context).size.width * 0.015;

      translator.currentLanguage == 'en'
          ? paddding4 = MediaQuery.of(context).size.width * 0.87
          : paddding4 = MediaQuery.of(context).size.width * 0.015;

      paddding5 = MediaQuery.of(context).size.height * 0.07;
      paddding6 = MediaQuery.of(context).size.height * 0.08;
      paddding7 = MediaQuery.of(context).size.height * 0.37;
      paddding8 = MediaQuery.of(context).size.height * 0.055;
      paddding9 = MediaQuery.of(context).size.width * 0.15;

      paddding10 = MediaQuery.of(context).size.width * 0.1;
      paddding11 = MediaQuery.of(context).size.width * 0.25;

      paddding12 = MediaQuery.of(context).size.height * 0.045;
      paddding13 = MediaQuery.of(context).size.height * 0.01;

      paddding14 = MediaQuery.of(context).size.height * 0.015;
      paddding15 = 0;
      paddding16 = MediaQuery.of(context).size.height * 0.0013;

      paddding17 = MediaQuery.of(context).size.width * 0.4;
      paddding18 = MediaQuery.of(context).size.width * 0.1;
      paddding19 = MediaQuery.of(context).size.width * 0.108;
      paddding20 = MediaQuery.of(context).size.height * 0.055;
      paddding21 = MediaQuery.of(context).size.width * 0.2;
      paddding22 = MediaQuery.of(context).size.height * 0.00082;
      paddding23 = MediaQuery.of(context).size.width * 0.6;
      paddding24 = MediaQuery.of(context).size.width * 0.7;
      paddding25 = MediaQuery.of(context).size.height * 0.02;
      paddding26 = MediaQuery.of(context).size.height * 0.01;
      paddding27 = MediaQuery.of(context).size.height * 0.095;
      paddding28 = MediaQuery.of(context).size.height * 0.04;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      translator.currentLanguage == 'en'
          ? paddding = 0
          : paddding = MediaQuery.of(context).size.width * 0.01;

      translator.currentLanguage == 'en'
          ? landscape = MediaQuery.of(context).size.width * 0.50
          : landscape = MediaQuery.of(context).size.width * 0.435;

      translator.currentLanguage == 'en'
          ? paddding3 = MediaQuery.of(context).size.width * 0.008
          : paddding3 = MediaQuery.of(context).size.width * 0.02;

      translator.currentLanguage == 'en'
          ? paddding4 = MediaQuery.of(context).size.width * 0.42
          : paddding4 = MediaQuery.of(context).size.width * 0.015;

      paddding5 = MediaQuery.of(context).size.height * 0.12;
      paddding6 = MediaQuery.of(context).size.height * 0.13;
      paddding7 = MediaQuery.of(context).size.height * 0.5;
      paddding8 = MediaQuery.of(context).size.height * 0.1;
      paddding9 = MediaQuery.of(context).size.width * 0.09;

      paddding10 = MediaQuery.of(context).size.width * 0.06;

      paddding11 = MediaQuery.of(context).size.width * 0.15;
      paddding12 = MediaQuery.of(context).size.height * 0.067;
      paddding13 = MediaQuery.of(context).size.height * 0.09;
      paddding14 = MediaQuery.of(context).size.height * 0.027;
      paddding15 = MediaQuery.of(context).size.height * 0.03;
      paddding16 = MediaQuery.of(context).size.height * 0.0023;

      paddding17 = MediaQuery.of(context).size.width * 0.3;
      paddding18 = MediaQuery.of(context).size.width * 0.075;
      paddding19 = MediaQuery.of(context).size.width * 0.07;
      paddding20 = MediaQuery.of(context).size.height * 0.1;
      paddding21 = MediaQuery.of(context).size.width * 0.25;
      paddding22 = MediaQuery.of(context).size.height * 0.00253;
      paddding23 = MediaQuery.of(context).size.width * 0.75;
      paddding24 = MediaQuery.of(context).size.width * 0.55;
      paddding25 = MediaQuery.of(context).size.height * 0.03;
      paddding26 = MediaQuery.of(context).size.height * 0.02;
      paddding27 = MediaQuery.of(context).size.height * 0.15;
//padding 3 = 0.02

    }

    return Scaffold(
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomInset: false,
        appBar: buildBar(context),
        body: OrientationBuilder(builder: (context, orientation) {
          return Column(
            children: <Widget>[
              AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: paddding5,
                  backgroundColor: Colors.orange,
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 5, left: 5, bottom: 3, top: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.grey),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Row(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.filter_list),
                                Text(translator.translate("Filters"))
                              ],
                            ),
                            // ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return StatefulBuilder(builder: (BuildContext
                                          context,
                                      void Function(void Function()) setState) {
                                    return GestureDetector(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: Container(
                                        color: Color.fromRGBO(0, 0, 0, 0.001),
                                        child: DraggableScrollableSheet(
                                          initialChildSize: paddding16,
                                          maxChildSize: paddding16,
                                          builder: (context,
                                              ScrollController
                                                  scrollController) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(
                                                          15.0),
                                                  topRight:
                                                      const Radius.circular(
                                                          15.0),
                                                ),
                                              ),
                                              child: SingleChildScrollView(
                                                controller: scrollController,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 12,
                                                              left: 12),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "Filter items",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(),
                                                    Text("By price"),
                                                    RangeSlider(
                                                      activeColor: Colors.grey,
                                                      values:
                                                          _currentRangeValuesPriceTest,
                                                      min: 0,
                                                      max: 450000,
                                                      divisions: 90,
                                                      labels: RangeLabels(
                                                        _currentRangeValuesPriceTest
                                                            .start
                                                            .round()
                                                            .toString(),
                                                        _currentRangeValuesPriceTest
                                                            .end
                                                            .round()
                                                            .toString(),
                                                      ),
                                                      onChanged: (values) {
                                                        setState(() {
                                                          _currentRangeValuesPriceTest =
                                                              values;

                                                          incrementPriceStart =
                                                              _currentRangeValuesPriceTest
                                                                  .start
                                                                  .round()
                                                                  .toString();

                                                          incrementPriceEnd =
                                                              _currentRangeValuesPriceTest
                                                                  .end
                                                                  .round()
                                                                  .toString();

                                                          redrawObject =
                                                              Object();
                                                        });
                                                      },
                                                    ),
                                                    //////
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Center(
                                                            child: Container(
                                                              width: paddding17,
                                                              foregroundDecoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .blueGrey,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    width:
                                                                        paddding18,
                                                                    height:
                                                                        paddding19,
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border(
                                                                              bottom: BorderSide(
                                                                                width: 0.5,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            child:
                                                                                Icon(
                                                                              //First container left
                                                                              Icons.arrow_drop_up,
                                                                              size: 18.0,
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              double currentValue = double.parse(incrementPriceStart);

                                                                              setState(() {
                                                                                currentValue = currentValue + 5000;

                                                                                incrementPriceStart = (currentValue).toString(); // incrementing value
                                                                                _currentRangeValuesPriceTest.start = currentValue;

                                                                                print("currrrrrrentValue$currentValue");
                                                                                //    values1.start.toInt=int.parse(controller.text);
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          child:
                                                                              Icon(
                                                                            Icons.arrow_drop_down,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                          onTap:
                                                                              () {
                                                                            double
                                                                                currentValue =
                                                                                double.parse(incrementPriceStart);
                                                                            setState(() {
                                                                              currentValue = currentValue - 5000;
                                                                              incrementPriceStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                              _currentRangeValuesPriceTest.start = (currentValue > 0 ? currentValue : 0).toDouble();
                                                                            });
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(incrementPriceStart
                                                                        .toString()
                                                                        .replaceAll(
                                                                            RegExp(r"([.]*0)(?!.*\d)"),
                                                                            "")),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Center(
                                                            child: Container(
                                                              width: paddding17,
                                                              foregroundDecoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .blueGrey,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    width:
                                                                        paddding18,
                                                                    height:
                                                                        paddding19,
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border(
                                                                              bottom: BorderSide(
                                                                                width: 0.5,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            child:
                                                                                Icon(
                                                                              Icons.arrow_drop_up,
                                                                              size: 18.0,
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              double currentValue = double.parse(incrementPriceEnd);
                                                                              setState(() {
                                                                                currentValue = currentValue + 5000;

                                                                                incrementPriceEnd = (currentValue).toString(); // incrementing value

                                                                                incrementPriceEnd = (currentValue < 450000 ? currentValue : 450000).toString();

                                                                                _currentRangeValuesPriceTest.end = (currentValue < 450000 ? currentValue : 450000);
                                                                                //    values1.start.toInt=int.parse(controller.text);
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          child:
                                                                              Icon(
                                                                            Icons.arrow_drop_down,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                          onTap:
                                                                              () {
                                                                            double
                                                                                currentValue =
                                                                                double.parse(incrementPriceEnd);
                                                                            setState(() {
                                                                              currentValue = currentValue - 5000;

                                                                              incrementPriceEnd = (currentValue > 0 ? currentValue : 0).toString(); // incrementing value

                                                                              _currentRangeValuesPriceTest.end = (currentValue > 0 ? currentValue : 0).toDouble();
                                                                            });
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                        incrementPriceEnd),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      endIndent: 8,
                                                      indent: 8,
                                                    ),
/*
                                                bool checkedValue = false;
bool checkedValueColorBlue=false;

bool checkedValueColorBlack,checkedValueColorGold;
bool checkedvaluememory = false;*/

                                                    Text("By Color"),
                                                    SizedBox(
                                                        height: paddding26),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        FilterChip(
                                                          label: Text('Black'),
                                                          selected:
                                                              checkedValueColorBlack,
                                                          selectedColor: Colors
                                                              .orange[200],
                                                          onSelected:
                                                              (bool value) {
                                                            setState(() {
                                                              onChangeColor = 1;
                                                              checkedValueColorBlack =
                                                                  !checkedValueColorBlack;

                                                              if (checkedValueColorBlack ==
                                                                  true) {
                                                                if (!colors
                                                                    .contains(
                                                                        "Black")) {
                                                                  colors.add(
                                                                      "Black");
                                                                }
                                                              } else {
                                                                colors.remove(
                                                                    "Black");
                                                              }
                                                            });
                                                          },
                                                        ),
                                                        FilterChip(
                                                          label: Text('Blue'),
                                                          selectedColor: Colors
                                                              .orange[200],
                                                          selected:
                                                              checkedValueColorBlue,
                                                          onSelected:
                                                              (bool value) {
                                                            setState(() {
                                                              onChangeColor = 1;
                                                              checkedValueColorBlue =
                                                                  !checkedValueColorBlue;

                                                              if (checkedValueColorBlue ==
                                                                  true) {
                                                                if (!colors
                                                                    .contains(
                                                                        "Blue")) {
                                                                  colors.add(
                                                                      "Blue");
                                                                }
                                                              } else {
                                                                colors.remove(
                                                                    "Blue");
                                                              }
                                                            });
                                                          },
                                                        ),
                                                        FilterChip(
                                                          label: Text('Gold'),
                                                          selectedColor: Colors
                                                              .orange[200],
                                                          selected:
                                                              checkedValueColorGold,
                                                          onSelected:
                                                              (bool value) {
                                                            setState(() {
                                                              onChangeColor = 1;
                                                              checkedValueColorGold =
                                                                  !checkedValueColorGold;

                                                              if (checkedValueColorGold ==
                                                                  true) {
                                                                print("ok");
                                                                if (!colors
                                                                    .contains(
                                                                        "Gold")) {
                                                                  colors.add(
                                                                      "Gold");
                                                                }
                                                              } else {
                                                                colors.remove(
                                                                    "Gold");
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),

                                                    /////

                                                    Divider(
                                                      thickness: 1,
                                                      endIndent: 8,
                                                      indent: 8,
                                                    ),
                                                    Text("By Memory"),
                                                    SizedBox(
                                                        height: paddding26),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        FilterChip(
                                                          label: Text('8 GB'),
                                                          selectedColor: Colors
                                                              .orange[200],
                                                          selected:
                                                              checkedValueColor8,
                                                          onSelected:
                                                              (bool value) {
                                                            setState(() {
                                                              onChangeMemory =
                                                                  1;
                                                              checkedValueColor8 =
                                                                  !checkedValueColor8;
                                                              if (checkedValueColor8 ==
                                                                  true) {
                                                                print("ok");
                                                                if (!memory
                                                                    .contains(
                                                                        "8 GB")) {
                                                                  memory.add(
                                                                      "8 GB");
                                                                }
                                                              } else {
                                                                memory.remove(
                                                                    "8 GB");
                                                              }
                                                            });
                                                          },
                                                        ),
                                                        FilterChip(
                                                          label: Text('16 GB'),
                                                          selectedColor: Colors
                                                              .orange[200],
                                                          selected:
                                                              checkedValueColor16,
                                                          onSelected:
                                                              (bool value) {
                                                            setState(() {
                                                              onChangeMemory =
                                                                  1;
                                                              checkedValueColor16 =
                                                                  !checkedValueColor16;
                                                              if (checkedValueColor16 ==
                                                                  true) {
                                                                print("ok");
                                                                if (!memory
                                                                    .contains(
                                                                        "16 GB")) {
                                                                  memory.add(
                                                                      "16 GB");
                                                                }
                                                              } else {
                                                                memory.remove(
                                                                    "16 GB");
                                                              }
                                                            });
                                                          },
                                                        ),
                                                        FilterChip(
                                                          label: Text('32 GB'),
                                                          selectedColor: Colors
                                                              .orange[200],
                                                          selected:
                                                              checkedValueColor32,
                                                          onSelected:
                                                              (bool value) {
                                                            setState(() {
                                                              onChangeMemory =
                                                                  1;
                                                              checkedValueColor32 =
                                                                  !checkedValueColor32;
                                                              if (checkedValueColor32 ==
                                                                  true) {
                                                                print("ok");
                                                                if (!memory
                                                                    .contains(
                                                                        "32 GB")) {
                                                                  memory.add(
                                                                      "32 GB");
                                                                }
                                                              } else {
                                                                memory.remove(
                                                                    "32 GB");
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      endIndent: 8,
                                                      indent: 8,
                                                    ),
                                                    Text("By Model"),
                                                    SizedBox(
                                                        height: paddding25),
                                                    Container(
                                                      width: paddding24,
                                                      child:
                                                          DropdownButtonFormField(
                                                        isExpanded: true,
                                                        decoration:
                                                            InputDecoration(
                                                                fillColor:
                                                                    Colors.grey,
                                                                focusColor:
                                                                    Colors.grey,
                                                                hoverColor:
                                                                    Colors.grey,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            15,
                                                                            20,
                                                                            15,
                                                                            0),
                                                                isDense: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.grey),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    const Radius
                                                                            .circular(
                                                                        5.0),
                                                                  ),
                                                                )),
                                                        hint: Text(
                                                            'Please choose a model'), // Not necessary for Option 1
                                                        value:
                                                            _selectedLocation,
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            _selectedLocation =
                                                                newValue;
                                                            if (newValue ==
                                                                "IPHONE TEW")
                                                              choice = 0;

                                                            if (newValue ==
                                                                "IPHONE TTY")
                                                              choice = 1;

                                                            if (newValue ==
                                                                "Any")
                                                              choice = 10;
                                                            print(
                                                                "choice$choice");
                                                          });
                                                        },
                                                        items: model
                                                            .map((location) {
                                                          return DropdownMenuItem(
                                                            child: new Text(
                                                                location),
                                                            value: location,
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      endIndent: 8,
                                                      indent: 8,
                                                    ),
                                                    Text("by Condition"),
                                                    SizedBox(
                                                        height: paddding25),
                                                    Container(
                                                      width: paddding24,
                                                      child:
                                                          DropdownButtonFormField(
                                                        isExpanded: true,
                                                        decoration:
                                                            InputDecoration(
                                                                fillColor:
                                                                    Colors.grey,
                                                                focusColor:
                                                                    Colors.grey,
                                                                hoverColor:
                                                                    Colors.grey,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            15,
                                                                            20,
                                                                            15,
                                                                            0),
                                                                isDense: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.grey),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    const Radius
                                                                            .circular(
                                                                        5.0),
                                                                  ),
                                                                )),
                                                        hint: Text(
                                                            'Please choose a Condition'), // Not necessary for Option 1
                                                        value:
                                                            _selectedLocation2,
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            _selectedLocation2 =
                                                                newValue;

                                                            if (newValue ==
                                                                'NEW')
                                                              choice2 = 0;

                                                            if (newValue ==
                                                                'USED')
                                                              choice2 = 1;
                                                            if (newValue ==
                                                                'Any')
                                                              choice2 = 10;
                                                            print(
                                                                "choice$choice2");
                                                          });
                                                          print(
                                                              "_selectedLocation$_selectedLocation2");
                                                        },
                                                        items: condition
                                                            .map((location) {
                                                          return DropdownMenuItem(
                                                            child: new Text(
                                                                location),
                                                            value: location,
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: paddding28),
                                                    Container(
                                                        height: paddding27,
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  spreadRadius:
                                                                      2,
                                                                  blurRadius: 3,
                                                                  offset:
                                                                      Offset(
                                                                          6, 0),
                                                                  color: Colors
                                                                      .black38)
                                                            ]),
                                                        child: Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10.0,
                                                                        right:
                                                                            10),
                                                                child:
                                                                    MaterialButton(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                                  elevation: 3,
                                                                  height:
                                                                      paddding20,
                                                                  minWidth: double
                                                                      .infinity,
                                                                  color: Colors
                                                                      .orange,
                                                                  child: Text(
                                                                      "Apply Filter",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      )),
                                                                  onPressed:
                                                                      () {
                                                                    test();
                                                                    _handleSearchStart();
                                                                  },
                                                                ),
                                                              ),
                                                            ])),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3, top: 3),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(CupertinoIcons.arrowtriangle_down_fill,
                                size: 10),
                            Text(translator.translate("Sort")),
                          ],
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return FractionallySizedBox(
                                    heightFactor: paddding22,
                                    child: StatefulBuilder(builder:
                                        (BuildContext context,
                                            void Function(void Function())
                                                setState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text("Sort By",
                                                      style: new TextStyle(
                                                        fontSize: 18,
                                                      )),
                                                ),
                                                SizedBox(width: paddding23),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          id = 10;
                                                        });

                                                        print(id);
                                                      },
                                                      child: Text("Reset",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 15))),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1.5,
                                              height: 1,
                                            ),
                                            Expanded(
                                                child: Column(
                                              children: sort
                                                  .map((data) => RadioListTile(
                                                        activeColor:
                                                            Colors.orange,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        title: Text(
                                                            "${data.name}"),
                                                        groupValue: id,
                                                        value: data.index,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            radioItem =
                                                                data.name;
                                                            id = data.index;
                                                            print(id);
                                                          });
                                                          _buildSortList();
                                                          _handleSearchStart();
                                                        },
                                                      ))
                                                  .toList(),
                                            )),
                                          ]);
                                    }));
                              });
                        },
                      ),
                    ),
                    SizedBox(width: landscape),
                    Padding(
                      padding:
                          EdgeInsets.only(right: paddding3, bottom: 3, top: 3),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.list_rounded),
                            Text(translator.translate("List"))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitDown,
                              DeviceOrientation.portraitUp,
                            ]);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: paddding, right: paddding2, bottom: 3, top: 3),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.grid_view),
                            Text(translator.translate("Grid"))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.landscapeRight,
                              DeviceOrientation.landscapeLeft,
                            ]);
                          });
                        },
                      ),
                    ),
                  ]),
              if (orientation == Orientation.portrait)
                if (loading)
                  Padding(
                      padding: new EdgeInsets.only(top: 200.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.orange),
                      )),
              if (!loading)
                Expanded(
                  child: _buildListView2(1, true, 1),
                ),
              /*  FutureBuilder(
                    future: categories.getPosts() ,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        /* setState(() {
                           countries = snapshot.data;
                          _searchList = snapshot.data;
                          everythink = snapshot.data;
                          result = snapshot.data;
                        });*/

                        return Expanded(
                          child: _buildListView2(1, true, 1),
                        );
                      } else {
                        return Padding(
                            padding: new EdgeInsets.only(top: 200.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.orange),
                            ));
                      }
                    }),*/
              if (orientation == Orientation.landscape)
                Expanded(
                  child: _buildListView2(2, false, 0.8),

                  /* child: GridView.count(
              // physics: new NeverScrollableScrollPhysics(),
              crossAxisCount: 1,
              children: List.generate(countries.length, (index) {
                return createGridItem(6, countries, index);
              }),
            ),*/
                ),
            ],
          );
        }));
  }

  void onSelected(int item) {
    switch (item) {
      case 0:
        print("hi");
        break;

      case 1:
        print("hi2");
        break;
    }
  }

  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: child)));
  }

  Widget frostedText(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Container(
                width: paddding11,
                height: paddding12,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.3),
                  //  shape: BoxShape.circle
                  borderRadius: BorderRadius.circular(12),
                ),
                child: child)));
  }

  Widget createGridItem(int position, List<Post2> data, int index, bool padding,
      double padding2) {
    //// 190 شاقولي
    ////130 افقي
    // ignore: unused_local_variable
    var color = Colors.white;
    // ignore: unused_local_variable
    var icondata = Icons.add;

    switch (position) {
      case 0:
        color = Colors.grey;
        icondata = Icons.home;

        break;
      case 1:
        color = Colors.grey;
        icondata = Icons.directions_car;

        break;
      case 2:
        color = Colors.grey;
        icondata = Icons.phone_android;

        break;
      case 3:
        color = Colors.grey;
        icondata = Icons.check_box_outline_blank;

        break;
      case 4:
        color = Colors.grey;
        icondata = Icons.local_laundry_service;

        break;
      case 5:
        color = Colors.grey[200];
        icondata = Icons.tag_faces;

        break;
      case 6:
        color = Colors.grey[100];
        icondata = Icons.business;

        break;
      case 7:
        color = Colors.orange;
        icondata = Icons.text_fields;

        break;
    }

    return Builder(builder: (context) {
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, paddding13),
          child: Card(
            /*shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)))*/
            elevation: 6,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SpecializationComp();
                    },
                  ),
                );
              },

              /* decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                ),*/
              child: Column(
                children: [
                  SizedBox(
                    height: paddding7,
                    child: Stack(children: [
                      Carousel(
                        boxFit: BoxFit.cover,
                        autoplay: false,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 1000),
                        dotSize: 6.0,
                        dotIncreasedColor: Color(0xFFFF9800),
                        dotBgColor: Colors.transparent,
                        dotPosition: DotPosition.bottomCenter,
                        dotVerticalPadding: 10.0,
                        showIndicator: true,
                        indicatorBgPadding: 7.0,
                        images: [
                          watermark(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzCAgJFs3EBfiLukqf4iB3RqRS9ChJD-uJxQ&usqp=CAU'),
                          watermark(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzCAgJFs3EBfiLukqf4iB3RqRS9ChJD-uJxQ&usqp=CAU'),
                          watermark(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzCAgJFs3EBfiLukqf4iB3RqRS9ChJD-uJxQ&usqp=CAU'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (!padding)
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5,
                                  MediaQuery.of(context).size.width * 0.28, 20),
                              child: Container(
                                  child: frostedText(Center(
                                child: Text("${data[index].price}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ))),
                            ),
                          if (padding)
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5,
                                  MediaQuery.of(context).size.width * 0.65, 20),
                              child: Container(
                                  child: frostedText(Center(
                                child: Text("${data[index].price}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ))),
                            ),
                        ],
                      )
                    ]),
                  ),
                  SizedBox(height: paddding15),
                  SizedBox(
                    width: paddding4,
                    child: Row(
                      children: [
                        SizedBox(
                          width: padding2,
                          child: Row(
                            children: [
                              Text("Condition : ",
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Text(
                                  data[index].condition.length > 22
                                      ? data[index].condition.substring(0, 22) +
                                          '...'
                                      : data[index].condition,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      fontSize: 15, color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        Container(
                            height: paddding8,
                            width: paddding9,
                            child: frostedIconButton(
                              IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {}),
                            )),
                        Container(
                            height: paddding8,
                            width: paddding10,
                            child: frostedIconButton(
                              IconButton(
                                  icon: Icon(
                                    Icons.flag_outlined,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {}),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: paddding4,
                      child: Row(
                        children: [
                          Text("Model :",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text(data[index].model,
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.grey[600])),
                        ],
                      )),
                  SizedBox(
                    height: paddding14,
                  ),
                  SizedBox(
                      width: paddding4,
                      child: Row(
                        children: [
                          Text("Color :",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text(data[index].color,
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.grey[600])),
                        ],
                      )),
                  SizedBox(
                    height: paddding14,
                  ),
                  SizedBox(
                      width: paddding4,
                      child: Row(
                        children: [
                          Text("Memory",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          //   Text("Km:${data[index].km}",
                          Text(data[index].memory,
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.grey[600])),
                        ],
                      ))
                ],
              ),
              // ),
            ),
          ),
        ),
      );
    });
  }

/////////////////////////////////////////////////مهم جداا
  /* Widget _buildListView() {
    return ListView.builder(
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index) {
          /* print(flag);
          if (_selectedLocation == "A") {
            if (filter.isEmpty &&
                (countries[index].age > _currentRangeValuesPrice.start) &&
                (countries[index].year > _currentRangeValuesYear.start) &&
                (countries[index].km > _currentRangeValuesKM.start) &&
                (flag)) {
              print("con1");
              return _buildRow(countries[index]);
            }*/

          if (filter.isEmpty) return createGridItem(6, countries, index);
          /* if (countries[index]
                    .name
                    .toLowerCase()
                    .contains(filter.toLowerCase()) &&
                (countries[index].age > _currentRangeValuesPrice.start) &&
                (countries[index].year > _currentRangeValuesYear.start) &&
                (countries[index].km > _currentRangeValuesKM.start) &&
                (filter.isNotEmpty)) {
              print("con3");
              return _buildRow(countries[index]);
            } */
          if (countries[index]
                  .name
                  .toLowerCase()
                  .contains(filter.toLowerCase()) &&
              (filter.isNotEmpty)) {
            return createGridItem(6, countries, index);
          } else {
            return new Container();
          }
        });
  }*/

  Widget _buildListView2(int number, bool padding, double aspect) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: number, childAspectRatio: aspect),
        /*  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisCount:1,
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),*/

        itemCount: _searchList.length,
        itemBuilder: (BuildContext context, int index) {
          /*  if (filter.isEmpty) {
              // landscape;
              // print("ffff");
              return createGridItem(6, countries, index, padding, 65);
            }


          print("hoon");
          print(countries
              .where((element) =>
                  element.name.toLowerCase().contains(filter.toLowerCase()))
              .toList()
              .length);*/

          ///////////////////////////////////////////////
          if (!padding) {
            if (filter.isEmpty) {
              // landscape;c
              return createGridItem(6, _searchList, index, padding, 155);
            }
          }
          if (padding) {
            return createGridItem(6, _searchList, index, padding, 220);

            /* if ((_searchList[index].age > _currentRangeValuesPriceTest.start) &&
                (_searchList[index].year > _currentRangeValuesYear.start) &&
                (_searchList[index].km > _currentRangeValuesKM.start) )
              return createGridItem(6, _searchList, index, padding, 130);*/
            /* if (countries[index]
                    .name
                    .toLowerCase()
                    .contains(filter.toLowerCase()) &&
                (filter.isNotEmpty)) {
              print("d");
              return createGridItem(6, countries, index, padding, 130);
            }*/
          } else
            return new Container();
        });

    /*  GridView.count(
      
      // Create a grid with 2 columns in portrait mode, or 3 columns in
      // landscape mode.
      crossAxisCount: 2,

      // orientation == Orientation.portrait ? 2 : 3,

      // Generate 100 widgets that display their index in the List.
      children:List.generate(10, (index) {
        return createGridItem(6, countries, index);
      }
      
      ),
    );
    */
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
        toolbarHeight: paddding6,
        centerTitle: true,
        title: appBarTitle,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) { 
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "Search By model",
                      hintStyle: TextStyle(color: Colors.white),
                      isDense: true,
                    ),
                  );
                  _handleSearchStart();
                } else { 
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        " ",
        style: TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class ServicesMob {
/*  var url = Uri.http(
      'www.json-generator.com', '/api/json/get/bVgzIdyusy', {"indent": "2"});
*/

  var url = Uri.https('api.json-generator.com', '/templates/WC1QZ5OYiOgc/data');

  /*static const String url =
      "http://www.json-generator.com/api/json/get/bVgzIdyusy?indent=2";
*/
  //'http://www.json-generator.com/api/json/get/bVmXkGGZAi?indent=2';

  //'https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8';

  //'http://www.json-generator.com/api/json/get/cfOoQyCkqG?indent=2';

  // 'http://www.json-generator.com/api/json/get/bOtoDGRSUO?indent=2';

  Future<List<Post2>> getPosts() async {
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer 3ejt83z2wpucusnyvj8tkm1nbfyeusz38qe7s4np'
      });
      if (response.statusCode == 200) {
        final List<Post2> listPosts = postFromJson(response.body);
        return listPosts;
      } else {
        return <Post2>[];
      }
    } catch (e) {
      return <Post2>[];
    }
  }
}
