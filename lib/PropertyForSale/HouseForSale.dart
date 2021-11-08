/*import 'dart:ui';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/Pages/Specialization_company.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../Data/Post_HouseForRent.dart';
import '../WaterMark.dart';
import 'package:http/http.dart' as http;

TextEditingController controller = new TextEditingController();
String filter = "";

bool loading;
RangeValues _currentRangeValuesSqFt = RangeValues(0, 350);
RangeValues _currentRangeValuesPriceTest = RangeValues(0, 450000);
RangeValues _currentRangeValuesBeds = RangeValues(0, 6);
RangeValues _currentRangeValuesBaths = RangeValues(0, 4);
RangeValues range;
RangeValues values1;
bool flag = false;
bool flag2 = false;
bool flag3 = false;
int grid = 0;
String incrementPriceStart = "";
String incrementPriceEnd = "";
String incrementBedsStart = "";
String incrementBedsEnd = "";
String incrementBathsStart = "";
String incrementBathsEnd = "";
String incrementSqftStart = "";
String incrementSqftEnd = "";
String _searchText = "";
dynamic val, val2, val3, val4;
double ss = 0, paddding = 0, paddding2 = 0, paddding3 = 0, landscape = 0;
// Option 2.
int choice, choice2;

// ignore: deprecated_member_use
List<Post3> _searchList = List();
List<Post3> countries, result;

bool _IsSearching;

final TextEditingController _searchQuery = TextEditingController();
RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
var redrawObject;

class HouseForSale extends StatefulWidget {
  @override
  State createState() => HouseForSaleState();
}

class SortList {
  String name;
  int index;
  SortList({this.name, this.index});
}

class HouseForSaleState extends State<HouseForSale> {
  // Default Radio Button Item
  String radioItem = 'Sort..';

  // Group Value for Radio Button.
  int id = 10;

  List<SortList> model = [
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

  double padding = 0.0;
  dynamic landscape, portriat;
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  Widget appBarTitle = new Text(
    "Search By Model",
    style: new TextStyle(color: Colors.white),
  );

  HouseForSaleState() {
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

  List<Post3> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = result;
    } else {
      _searchList = result
          .where((element) =>
              element.amenities.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();

      return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    }
  }

  List<Post3> _buildSortList() {
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

  List<Post3> _buildFilterList() {
    var nlist = [4, 2, 1, 5];
    var ascending = nlist..sort();
    var descending = ascending.reversed;
    print(ascending); // [1, 2, 4, 5]
    print(descending); // [5, 4, 2, 1]
    print("_searchList${_searchList.length}");
    _searchList = countries
        .where((element) =>
            element.price >= _currentRangeValuesPriceTest.start &&
            element.baths >= _currentRangeValuesBaths.start &&
            element.beds >= _currentRangeValuesBeds.start &&
            element.sqFt >= _currentRangeValuesSqFt.start)
        .toList();

    result = _searchList;

    print("_searchList${_searchList.length}");
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

  final categories = ServicesRent();

  // final categories = ServicesRent.getPosts();
  List<Post3> countries;

  @override
  void initState() {
    super.initState();
    //fill countries with objects

    incrementPriceStart = "0";
    incrementPriceEnd = "450000";
    incrementBedsStart = "0";
    incrementBedsEnd = "6";
    incrementBathsStart = "0";
    incrementBathsEnd = "4";
    incrementSqftStart = "0";
    incrementSqftEnd = "350";
    loading = true;
    _IsSearching = false;
    categories.getPosts().then((categories) {
      setState(() {
        countries = categories;
        _searchList = categories;
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
                  toolbarHeight: 45,
                  backgroundColor: Colors.orange,
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 5, left: 5, bottom: 3, top: 3),
                      child: Row(
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
                                  isScrollControlled: true,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            void Function(void Function())
                                                setState) {
                                      return GestureDetector(
                                          onTap: () =>
                                              Navigator.of(context).pop(),
                                          child: Container(
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.001),
                                              child: GestureDetector(
                                                  onTap: () {},
                                                  child:
                                                      DraggableScrollableSheet(
                                                          initialChildSize:
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.0013,
                                                          maxChildSize:
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.0013,
                                                          builder: (context,
                                                              ScrollController
                                                                  scrollController) {
                                                            return Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: const Radius
                                                                            .circular(
                                                                        25.0),
                                                                    topRight:
                                                                        const Radius.circular(
                                                                            25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  controller:
                                                                      scrollController,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <
                                                                        Widget>[
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                12,
                                                                            left:
                                                                                12),
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "Filter items",
                                                                            style:
                                                                                TextStyle(fontSize: 18),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Divider(),
                                                                      Text(
                                                                          "By price"),
                                                                      RangeSlider(
                                                                        activeColor:
                                                                            Colors.grey,
                                                                        values:
                                                                            _currentRangeValuesPriceTest,
                                                                        min: 0,
                                                                        max:
                                                                            450000,
                                                                        divisions:
                                                                            90,
                                                                        labels:
                                                                            RangeLabels(
                                                                          _currentRangeValuesPriceTest
                                                                              .start
                                                                              .round()
                                                                              .toString(),
                                                                          _currentRangeValuesPriceTest
                                                                              .end
                                                                              .round()
                                                                              .toString(),
                                                                        ),
                                                                        onChanged:
                                                                            (values) {
                                                                          setState(
                                                                              () {
                                                                            _currentRangeValuesPriceTest.start =
                                                                                values.start;
                                                                            _currentRangeValuesPriceTest.end = (_currentRangeValuesPriceTest.start == 0 && values.end < 5000
                                                                                ? _currentRangeValuesPriceTest.end
                                                                                : values.end);

                                                                            incrementPriceStart =
                                                                                _currentRangeValuesPriceTest.start.round().toString();

                                                                            incrementPriceEnd =
                                                                                _currentRangeValuesPriceTest.end.round().toString();

                                                                            redrawObject =
                                                                                Object();
                                                                          });
                                                                        },
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Center(
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
                                                                                                //First container left
                                                                                                Icons.arrow_drop_up,
                                                                                                size: 18.0,
                                                                                              ),
                                                                                              onTap: () {
                                                                                                int currentValue = int.parse(incrementPriceStart);
                                                                                                int incValue = int.parse(incrementPriceEnd);

                                                                                                setState(() {
                                                                                                  currentValue = currentValue + 5000;

                                                                                                  incrementPriceStart = (currentValue <= incValue ? currentValue : incrementPriceStart).toString(); // incrementing value

                                                                                                  //   incrementPriceStart = (incrementPriceStart == (445000).toString() ? currentValue : incrementPriceStart).toString(); // incrementing value

                                                                                                  _currentRangeValuesPriceTest.start = double.parse(incrementPriceStart);

                                                                                                  // _currentRangeValuesPriceTest.start = (currentValue < _currentRangeValuesPriceTest.end ? currentValue : _currentRangeValuesPriceTest.start).toDouble();

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
                                                                                              int currentValue = int.parse(incrementPriceStart);
                                                                                              setState(() {
                                                                                                currentValue = currentValue - 5000;
                                                                                                incrementPriceStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                                _currentRangeValuesPriceTest.start = (currentValue > 0 && currentValue <= _currentRangeValuesPriceTest.end ? currentValue : 0).toDouble();
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      //   child: Text(incrementPriceStart.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "")),
                                                                                      child: Text(incrementPriceStart),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Center(
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
                                                                                                int currentValue = int.parse(incrementPriceEnd);
                                                                                                setState(() {
                                                                                                  currentValue = currentValue + 5000;

                                                                                                  incrementPriceEnd = (currentValue < 450000 ? currentValue : 450000).toString();

                                                                                                  _currentRangeValuesPriceTest.end = (currentValue < 450000 ? currentValue : 450000).toDouble();
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
                                                                                              int currentValue = int.parse(incrementPriceEnd);
                                                                                              setState(() {
                                                                                                currentValue = currentValue - 5000;

                                                                                                incrementPriceEnd = (currentValue >= _currentRangeValuesPriceTest.start ? currentValue : incrementPriceEnd).toString(); // decrementing value
                                                                                                incrementPriceEnd = (incrementPriceEnd == (0).toString() ? incrementPriceEnd = "5000" : incrementPriceEnd).toString();
                                                                                                _currentRangeValuesPriceTest.end = double.parse(incrementPriceEnd);

                                                                                                // _currentRangeValuesPriceTest.end = (currentValue > _currentRangeValuesPriceTest.start ? currentValue : _currentRangeValuesPriceTest.end).toDouble();
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Text(incrementPriceEnd),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1,
                                                                        endIndent:
                                                                            8,
                                                                        indent:
                                                                            8,
                                                                      ),
                                                                      Text(
                                                                          "by Beds"),
                                                                      RangeSlider(
                                                                        activeColor:
                                                                            Colors.grey,
                                                                        values:
                                                                            _currentRangeValuesBeds,
                                                                        min: 0,
                                                                        max: 6,
                                                                        labels:
                                                                            RangeLabels(
                                                                          _currentRangeValuesBeds
                                                                              .start
                                                                              .round()
                                                                              .toString(),
                                                                          _currentRangeValuesBeds
                                                                              .end
                                                                              .round()
                                                                              .toString(),
                                                                        ),
                                                                        onChanged:
                                                                            (RangeValues
                                                                                values1) {
                                                                          setState(
                                                                              () {
                                                                            _currentRangeValuesBeds.start =
                                                                                values1.start;
                                                                            _currentRangeValuesBeds.end = (_currentRangeValuesBeds.start == 0 && values1.end < 1
                                                                                ? _currentRangeValuesBeds.end
                                                                                : values1.end);

                                                                            incrementBedsStart =
                                                                                _currentRangeValuesBeds.start.round().toString();

                                                                            incrementBedsEnd =
                                                                                _currentRangeValuesBeds.end.round().toString();
                                                                          });
                                                                        },
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Center(
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
                                                                                                int currentValue = int.parse(incrementBedsStart);
                                                                                                int incValue = int.parse(incrementBedsEnd);

                                                                                                setState(() {
                                                                                                  currentValue++;

                                                                                                  incrementBedsStart = (currentValue <= incValue ? currentValue : incrementBedsStart).toString();
                                                                                                  _currentRangeValuesBeds.start = double.parse(incrementBedsStart);

                                                                                                  // _currentRangeValuesBeds.start = (currentValue <= _currentRangeValuesBeds.end ? currentValue : _currentRangeValuesBeds.start).toDouble();
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
                                                                                              int currentValue = int.parse(incrementBedsStart);
                                                                                              setState(() {
                                                                                                currentValue--;
                                                                                                incrementBedsStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                                _currentRangeValuesBeds.start = (currentValue > 0 && currentValue <= _currentRangeValuesBeds.end ? currentValue : 0).toDouble();
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Text(incrementBedsStart),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Center(
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
                                                                                                int currentValue = int.parse(incrementBedsEnd);
                                                                                                setState(() {
                                                                                                  currentValue++;

                                                                                                  incrementBedsEnd = (currentValue < 6 ? currentValue : 6).toString();

                                                                                                  _currentRangeValuesBeds.end = (currentValue < 6 ? currentValue : 6).toDouble();
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
                                                                                              int currentValue = int.parse(incrementBedsEnd);
                                                                                              setState(() {
                                                                                                currentValue--;
                                                                                                incrementBedsEnd = (currentValue >= _currentRangeValuesBeds.start ? currentValue : incrementBedsEnd).toString(); // decrementing value
                                                                                                incrementBedsEnd = (incrementBedsEnd == (0).toString() ? incrementBedsEnd = "1" : incrementBedsEnd).toString();
                                                                                                _currentRangeValuesBeds.end = double.parse(incrementBedsEnd);

                                                                                                //  _currentRangeValuesBeds.end = (currentValue >= _currentRangeValuesBeds.start ? currentValue : _currentRangeValuesBeds.end).toDouble();
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Text(incrementBedsEnd),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1,
                                                                        endIndent:
                                                                            8,
                                                                        indent:
                                                                            8,
                                                                      ),
                                                                      Text(
                                                                          "By Baths"),
                                                                      RangeSlider(
                                                                        activeColor:
                                                                            Colors.grey,
                                                                        values:
                                                                            _currentRangeValuesBaths,
                                                                        min: 0,
                                                                        max: 4,
                                                                        labels:
                                                                            RangeLabels(
                                                                          _currentRangeValuesBaths
                                                                              .start
                                                                              .round()
                                                                              .toString(),
                                                                          _currentRangeValuesBaths
                                                                              .end
                                                                              .round()
                                                                              .toString(),
                                                                        ),
                                                                        onChanged:
                                                                            (RangeValues
                                                                                values1) {
                                                                          setState(
                                                                              () {
                                                                            _currentRangeValuesBaths.start =
                                                                                values1.start;
                                                                            _currentRangeValuesBaths.end = (_currentRangeValuesBaths.start == 0 && values1.end < 1
                                                                                ? _currentRangeValuesBaths.end
                                                                                : values1.end);

                                                                            incrementBathsStart =
                                                                                _currentRangeValuesBaths.start.round().toString();

                                                                            incrementBathsEnd =
                                                                                _currentRangeValuesBaths.end.round().toString();
                                                                          });
                                                                        },
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Center(
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
                                                                                                int currentValue = int.parse(incrementBathsStart);
                                                                                                int incValue = int.parse(incrementBathsEnd);

                                                                                                setState(() {
                                                                                                  currentValue++;

                                                                                                  incrementBathsStart = (currentValue <= incValue ? currentValue : incrementBathsStart).toString();
                                                                                                  _currentRangeValuesBaths.start = double.parse(incrementBathsStart);

                                                                                                  // _currentRangeValuesBaths.start = (currentValue < _currentRangeValuesBaths.end ? (currentValue).toDouble() : _currentRangeValuesBaths.start).toDouble();
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
                                                                                              int currentValue = int.parse(incrementBathsStart);
                                                                                              setState(() {
                                                                                                currentValue--;
                                                                                                incrementBathsStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                                _currentRangeValuesBaths.start = (currentValue > 0 && currentValue <= _currentRangeValuesBaths.end ? currentValue : 0).toDouble();
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Text(incrementBathsStart),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Center(
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
                                                                                                int currentValue = int.parse(incrementBathsEnd);
                                                                                                setState(() {
                                                                                                  currentValue++;

                                                                                                  incrementBathsEnd = (currentValue < 4 ? currentValue : 4).toString();

                                                                                                  _currentRangeValuesBaths.end = (currentValue < 4 ? currentValue : 4).toDouble();
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
                                                                                              int currentValue = int.parse(incrementBathsEnd);
                                                                                              setState(() {
                                                                                                currentValue--;

                                                                                                incrementBathsEnd = (currentValue >= _currentRangeValuesBaths.start ? currentValue : incrementBathsEnd).toString(); // decrementing value
                                                                                                incrementBathsEnd = (incrementBathsEnd == (0).toString() ? incrementBathsEnd = "1" : incrementBathsEnd).toString();
                                                                                                _currentRangeValuesBaths.end = double.parse(incrementBathsEnd);

                                                                                                //  _currentRangeValuesBaths.end = (currentValue > _currentRangeValuesBaths.start ? (currentValue).toDouble() : _currentRangeValuesBeds.end).toDouble();
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Text(incrementBathsEnd),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      /*  IconButton(
                                                icon: actionIcon,
                                                onPressed: () {
                                                  setState(() {
                                                    if (this.actionIcon.icon ==
                                                        Icons.search) {
                                                      _buildSearchList();
                                                      _handleSearchStart();
                                                    } else {
                                                      _handleSearchEnd();
                                                    }
                                                  });
                                                },
                                              ),*/

                                                                      /////////////////////////////////////////////////////////
                                                                      Divider(
                                                                        thickness:
                                                                            1,
                                                                        endIndent:
                                                                            8,
                                                                        indent:
                                                                            8,
                                                                      ),
                                                                      Text(
                                                                          "By Sqft"),
                                                                      RangeSlider(
                                                                        activeColor:
                                                                            Colors.grey,
                                                                        values:
                                                                            _currentRangeValuesSqFt,
                                                                        min: 0,
                                                                        max:
                                                                            350.0,
                                                                        labels:
                                                                            RangeLabels(
                                                                          _currentRangeValuesSqFt
                                                                              .start
                                                                              .round()
                                                                              .toString(),
                                                                          _currentRangeValuesSqFt
                                                                              .end
                                                                              .round()
                                                                              .toString(),
                                                                        ),
                                                                        onChanged:
                                                                            (RangeValues
                                                                                values2) {
                                                                          setState(
                                                                              () {
                                                                            _currentRangeValuesSqFt.start =
                                                                                values2.start;
                                                                            _currentRangeValuesSqFt.end = (_currentRangeValuesSqFt.start == 0 && values2.end < 1
                                                                                ? _currentRangeValuesSqFt.end
                                                                                : values2.end);
                                                                            print(values2.end);
                                                                            print(_currentRangeValuesSqFt.end);

                                                                            incrementSqftStart =
                                                                                _currentRangeValuesSqFt.start.round().toString();

                                                                            incrementSqftEnd =
                                                                                _currentRangeValuesSqFt.end.round().toString();
                                                                          });
                                                                        },
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Center(
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
                                                                                                int currentValue = int.parse(incrementSqftStart);
                                                                                                int incValue = int.parse(incrementSqftEnd);

                                                                                                setState(() {
                                                                                                  currentValue++;

                                                                                                  incrementSqftStart = (currentValue <= incValue ? currentValue : incrementSqftStart).toString();
                                                                                                  _currentRangeValuesSqFt.start = double.parse(incrementSqftStart);

                                                                                                  //  _currentRangeValuesSqFt.start = (currentValue < _currentRangeValuesSqFt.end ? currentValue : _currentRangeValuesSqFt.start).toDouble();
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
                                                                                              int currentValue = int.parse(incrementSqftStart);
                                                                                              setState(() {
                                                                                                currentValue--;
                                                                                                incrementSqftStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                                _currentRangeValuesSqFt.start = (currentValue > 0 && currentValue <= _currentRangeValuesSqFt.end ? currentValue : 0).toDouble();
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Text(incrementSqftStart),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Center(
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
                                                                                                int currentValue = int.parse(incrementSqftEnd);
                                                                                                setState(() {
                                                                                                  currentValue++;

                                                                                                  incrementSqftEnd = (currentValue < 350 ? currentValue : 350).toString();

                                                                                                  _currentRangeValuesSqFt.end = (currentValue < 350 ? currentValue : 350).toDouble();
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
                                                                                              int currentValue = int.parse(incrementSqftEnd);
                                                                                              setState(() {
                                                                                                currentValue--;
                                                                                                incrementSqftEnd = (currentValue >= _currentRangeValuesSqFt.start ? currentValue : incrementSqftEnd).toString(); // decrementing value
                                                                                                incrementSqftEnd = (incrementSqftEnd == (0).toString() ? incrementSqftEnd = "1" : incrementSqftEnd).toString();
                                                                                                _currentRangeValuesSqFt.end = double.parse(incrementSqftEnd);

                                                                                                //_currentRangeValuesSqFt.end = (currentValue > _currentRangeValuesSqFt.start ? currentValue : _currentRangeValuesSqFt.end).toDouble();
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Text(incrementSqftEnd),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),

                                                                      /////////////////////////////////////
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 20),
                                                                        child:
                                                                            MaterialButton(
                                                                          elevation:
                                                                              3,
                                                                          height:
                                                                              30.0,
                                                                          minWidth:
                                                                              90.0,
                                                                          color:
                                                                              Colors.white,
                                                                          child: Text(
                                                                              "Apply Filter",
                                                                              style: TextStyle(
                                                                                color: Colors.orange,
                                                                                fontWeight: FontWeight.bold,
                                                                              )),
                                                                          onPressed:
                                                                              () {
                                                                            _buildFilterList();
                                                                            print("onpressed${result.length}");
                                                                            _handleSearchStart();
                                                                          },
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ));
                                                          }))));
                                    });
                                  }); /////
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
                                    heightFactor: MediaQuery.of(context).size.height *
                                            0.00088,
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
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.6),
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
                                            ),
                                            Expanded(
                                                child: Container(
                                              height: 350.0,
                                              child: Column(
                                                children: model
                                                    .map((data) =>
                                                        RadioListTile(
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
                                              ),
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
                FutureBuilder(
                    future: categories.getPosts(),
                    // ignore: missing_return
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: _buildListView2(1, true, 1),
                        );
                      } else if (snapshot.hasError) {
                        print("nooo");
                      } else {
                        return Padding(
                            padding: new EdgeInsets.only(top: 200.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.orange),
                            ));
                      }

                      /*   if (snapshot.data != null) {
                        return Expanded(
                          child: new Padding(
                              padding: new EdgeInsets.only(top: 8.0),
                              child: _buildListView2(1, true, 1)),
                        );
                      } else {
                        return Padding(
                            padding: new EdgeInsets.only(top: 200.0),
                            child: CircularProgressIndicator());
                      }*/
                    }),
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
        break;

      case 1:
        break;
    }
  }

  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
                width: 50.0,
                height: 50.0,
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
                width: 70.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.3),
                  //  shape: BoxShape.circle
                  borderRadius: BorderRadius.circular(12),
                ),
                child: child)));
  }

  Widget createGridItem(int position, List<Post3> data, int index, bool padding,
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
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
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
              child: Column(
                children: [
                  SizedBox(
                    height: 220,
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
                              padding: const EdgeInsets.fromLTRB(0, 5, 190, 20),
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
                              padding: const EdgeInsets.fromLTRB(0, 5, 257, 20),
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
                  SizedBox(
                    width: 320,
                    child: Row(
                      children: [
                        Text("Type : ",
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        //   Text("${data[index].name}",
                        Text(
                            data[index].name.length > 22
                                ? data[index].name.substring(0, 22) + '...'
                                : data[index].name,
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: 15, color: Colors.grey[600])),
                        SizedBox(width: padding2),
                        Container(
                            height: 40,
                            width: 60,
                            child: frostedIconButton(
                              IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {}),
                            )),
                        Container(
                            height: 40,
                            width: 30,
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
                      width: 320,
                      child: Row(
                        children: [
                          Text("Beds :",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text("${data[index].beds}",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.grey[600])),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 320,
                      child: Row(
                        children: [
                          Text("Baths :",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          //     Text("${data[index].city}",
                          Text("${data[index].baths}",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.grey[600])),
                          SizedBox(
                            width: 90,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 320,
                      child: Row(
                        children: [
                          Text("Sqft:",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          //    Text("Km:${data[index].city}",
                          Text("${data[index].sqFt}",
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

  Widget _buildListView2(int number, bool padding, double aspect) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: number, childAspectRatio: aspect),
        itemCount: _searchList.length,
        itemBuilder: (BuildContext context, int index) {
          if (!padding) {
            if (filter.isEmpty) {
              // landscape;c
              return createGridItem(6, _searchList, index, padding, 50);
            }
          }
          if (padding) {
            return createGridItem(6, _searchList, index, padding, 115);
          } else
            return new Container();
        });
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
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
                      hintText: "Search here..",
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
        "My Properties",
        style: TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class ServicesRent {
  var url = Uri.http(
      'www.json-generator.com', '/api/json/get/bTCrbjTGxu', {"indent": "2"});

  /* static const String url =
      "http://www.json-generator.com/api/json/get/bTCrbjTGxu?indent=2";
*/
  //"http://www.json-generator.com/api/json/get/bVgzIdyusy?indent=2";

  //'https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8';

  //'http://www.json-generator.com/api/json/get/cfOoQyCkqG?indent=2';

  // 'http://www.json-generator.com/api/json/get/bOtoDGRSUO?indent=2';

  Future<List<Post3>> getPosts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Post3> listPosts = postFromJson(response.body);
        return listPosts;
      } else {
        return <Post3>[];
      }
    } catch (e) {
      return <Post3>[];
    }
  }
}*/
