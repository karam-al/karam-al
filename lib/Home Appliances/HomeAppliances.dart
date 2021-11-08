import 'dart:ui';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oxydu/Data/Post.dart';
import 'package:oxydu/MotorsMain/AllinMotorsTest.dart';
import 'package:oxydu/Pages/Specialization_company.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../WaterMark.dart';
import '../Data/services.dart';

TextEditingController controller = new TextEditingController();
final servic = Services();
String filter = "";
List<Post> countries;
bool loading;
RangeValues _currentRangeValuesPriceTest = RangeValues(0, 450000);
RangeValues range;
RangeValues values1;
bool flag = false;
bool flag2 = false;
bool flag3 = false;
int grid = 0;
String incrementPriceStart = "";
String incrementPriceEnd = "";
String incrementYearStart = "";
String incrementYearEnd = "";
String incrementKMStart = "";
String incrementKMEnd = "";
RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
Icrement c;
double ss;
var redrawObject;

class HomeAppliances extends StatefulWidget {
  @override
  State createState() => HouseForRentState();
}

class HouseForRentState extends State<HomeAppliances> {
  List<RangeSliderData> rangeSliders;
  double padding = 0.0;

  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  Widget appBarTitle = new Text(
    "Search Sample",
    style: new TextStyle(color: Colors.white),
  );

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
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<RangeSliderData> _rangeSliderDefinitions() {
    return <RangeSliderData>[
      RangeSliderData(
          min: 1.0, max: 100.0, lowerValue: 10.0, upperValue: 100.0),
    ];
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

  final categories = Services();

//  final categories = Services.getPosts();
  @override
  void initState() {
    super.initState();
    //fill countries with objects

    incrementPriceStart = "0";
    incrementPriceEnd = "50000";
    incrementYearStart = "0";
    incrementYearEnd = "4";
    incrementKMStart = "0";
    incrementKMEnd = "6";
    loading = true;
    rangeSliders = _rangeSliderDefinitions();
    categories.getPosts(6092).then((categories) {
      setState(() {
        countries = categories;

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

/*

  @override

  void dispose() {

  super.dispose();

  controller.dispose();

  }

  */

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.orange,
          title: Container(
            width: 300,
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              onTap: () {
                //   controller.clear();
                //   FocusScope.of(context).requestFocus(new FocusNode());
                /* setState(() {
                  flag = true;
                });*/
              },
              //     controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: new IconButton(
                  icon: new Icon(Icons.close),
                  onPressed: () {
                    controller.clear();
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                ),
              ),
            ),
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return Column(
            children: <Widget>[
              AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 45,
                  backgroundColor: Colors.orange,
                  actions: <Widget>[
                    if (orientation == Orientation.portrait)
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 70, left: 5, bottom: 3, top: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: (ElevatedButton.styleFrom(
                                primary: Colors.grey,
                              )),
                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(Icons.filter_list),
                                  Text("Filters")
                                ],
                              ),
                              // ),
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return FractionallySizedBox(
                                        heightFactor: 0.9,
                                        child: StatefulBuilder(builder:
                                            (BuildContext context,
                                                void Function(void Function())
                                                    setState) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Icon(
                                                Icons.view_headline_rounded,
                                                size: 35.0,
                                              ),
                                              Divider(
                                                thickness: 4,
                                              ),
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

                                                    redrawObject = Object();
                                                  });
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Center(
                                                      child: Container(
                                                        width: 140.0,
                                                        foregroundDecoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          border: Border.all(
                                                            color:
                                                                Colors.blueGrey,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              width: 30,
                                                              height: 38.0,
                                                              child: Column(
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
                                                                        bottom:
                                                                            BorderSide(
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      child:
                                                                          Icon(
                                                                        //First container left
                                                                        Icons
                                                                            .arrow_drop_up,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        double
                                                                            currentValue =
                                                                            double.parse(incrementPriceStart);

                                                                        setState(
                                                                            () {
                                                                          currentValue =
                                                                              currentValue + 5000;

                                                                          incrementPriceStart =
                                                                              (currentValue).toString(); // incrementing value
                                                                          _currentRangeValuesPriceTest.start =
                                                                              currentValue;

                                                                          print(
                                                                              "currrrrrrentValue$currentValue");
                                                                          //    values1.start.toInt=int.parse(controller.text);
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_drop_down,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                    onTap: () {
                                                                      double
                                                                          currentValue =
                                                                          double.parse(
                                                                              incrementPriceStart);
                                                                      setState(
                                                                          () {
                                                                        currentValue =
                                                                            currentValue -
                                                                                5000;
                                                                        incrementPriceStart = (currentValue > 0
                                                                                ? currentValue
                                                                                : 0)
                                                                            .toString(); // decrementing value

                                                                        _currentRangeValuesPriceTest
                                                                            .start = (currentValue > 0
                                                                                ? currentValue
                                                                                : 0)
                                                                            .toDouble();
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
                                                                      RegExp(
                                                                          r"([.]*0)(?!.*\d)"),
                                                                      "")),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Center(
                                                      child: Container(
                                                        width: 140.0,
                                                        foregroundDecoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          border: Border.all(
                                                            color:
                                                                Colors.blueGrey,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              width: 30,
                                                              height: 38.0,
                                                              child: Column(
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
                                                                        bottom:
                                                                            BorderSide(
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_drop_up,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        double
                                                                            currentValue =
                                                                            double.parse(incrementPriceEnd);
                                                                        setState(
                                                                            () {
                                                                          currentValue =
                                                                              currentValue + 5000;

                                                                          incrementPriceEnd =
                                                                              (currentValue).toString(); // incrementing value

                                                                          incrementPriceEnd =
                                                                              (currentValue < 450000 ? currentValue : 450000).toString();

                                                                          _currentRangeValuesPriceTest
                                                                              .end = (currentValue <
                                                                                  450000
                                                                              ? currentValue
                                                                              : 450000);
                                                                          //    values1.start.toInt=int.parse(controller.text);
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_drop_down,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                    onTap: () {
                                                                      double
                                                                          currentValue =
                                                                          double.parse(
                                                                              incrementPriceEnd);
                                                                      setState(
                                                                          () {
                                                                        currentValue =
                                                                            currentValue -
                                                                                5000;

                                                                        incrementPriceEnd = (currentValue > 0
                                                                                ? currentValue
                                                                                : 0)
                                                                            .toString(); // incrementing value

                                                                        _currentRangeValuesPriceTest
                                                                            .end = (currentValue > 0
                                                                                ? currentValue
                                                                                : 0)
                                                                            .toDouble();
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
                                              Text("by Color"),
                                              Text("by Beds"),
                                            ],
                                          );
                                        }),
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                    if (orientation == Orientation.landscape)
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 300, left: 5, bottom: 3, top: 3),
                        child: ElevatedButton(
                          style: (ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          )),
                          child: Row(
                            // Replace with a Row for horizontal icon + text
                            children: <Widget>[
                              Icon(Icons.filter_list),
                              Text("Filters")
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, bottom: 3, top: 3),
                      child: ElevatedButton(
                        style: (ElevatedButton.styleFrom(
                          primary: Colors.grey,
                        )),
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.list_rounded),
                            Text("List")
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
                      padding:
                          const EdgeInsets.only(right: 10, bottom: 3, top: 3),
                      child: ElevatedButton(
                        style: (ElevatedButton.styleFrom(
                          primary: Colors.grey,
                        )),
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.grid_view),
                            Text("Grid")
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
                    future: categories.getPosts(6092),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return Expanded(
                          child: new Padding(
                              padding: new EdgeInsets.only(top: 8.0),
                              child: _buildListView2(1, true, 1)),
                        );
                      } else {
                        return Padding(
                            padding: new EdgeInsets.only(top: 200.0),
                            child: CircularProgressIndicator());
                      }
                    }),
              if (orientation == Orientation.landscape)
                Expanded(
                  child: new Padding(
                      padding: new EdgeInsets.only(top: 8.0),
                      child: _buildListView2(2, false, 0.8)),
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

  Widget createGridItem(
      int position, List<Post> data, int index, bool padding, double padding2) {
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

              /* decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                ),*/
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
                              'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/90/21/9021312.jpeg'),
                          watermark(
                              'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/90/21/9021312.jpeg'),
                          watermark(
                              'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/90/21/9021312.jpeg'),
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
                                child: Text("25000",
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
                                child: Text("25000",
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
                        Text("Model : ",
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                       /* Text(
                            data[index].name.length > 22
                                ? data[index].name.substring(0, 22) + '...'
                                : data[index].name,
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: 15, color: Colors.grey[600])),*/
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
                          Text("Type :",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text("House",
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
                          Text("Year :",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text("Test",
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
                          Text("House Type:",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          //   Text("Km:${data[index].km}",
                          Text("Villa",
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
                (countries[index].km > _currentRangeValuesBeds.start) &&
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
                (countries[index].km > _currentRangeValuesBeds.start) &&
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

        itemCount: countries.length,
        // ignore: missing_return
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
          if (!padding) {
            if (filter.isEmpty) {
              // landscape;
              // print("ffff");
              return createGridItem(6, countries, index, padding, 65);
            }
          }
          if (padding) {
            print("ppading");
            if (filter.isEmpty) {
              // protraite
              // print("ffff");
              return createGridItem(6, countries, index, padding, 130);
            }

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
}
