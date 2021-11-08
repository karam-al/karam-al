/*import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'HouseForSale.dart';

class PropertySaleMain extends StatelessWidget {
  // final String message;
  //final int choice;
  //Test2({@required this.message, @required this.choice});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: MotorCycle(),
    );
  }
}

class MotorCycle extends StatelessWidget {
  // final String choice;
  // MotorCycle({@required this.choice});

  @override
  Widget build(BuildContext context) {
        List villa = [
  translator.translate('Villa/House For Sale'),
  translator.translate('Villa Compound'),
  translator.translate('Residential Building'),
  translator.translate('Land for Sale'),
  translator.translate('Commercial for Sale'),
  translator.translate('Apartment For Sale'),
];
    gotoScreen(int choice) {
      Navigator.of(context).push(
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          if (choice == 0) return HouseForSale();
          if (choice == 1) return HouseForSale();
        }),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Text("Choose the category",
                      style: new TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                  SizedBox(height: 9),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
            Divider(height: 0,thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: villa.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                  },
                  title: Text(villa[index], style: TextStyle(fontSize: 17)),
                  //  selected: index == _selectedIndex,
                ),
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            )
          ]),
    );
  }
}
*/

/*import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'HouseForRent.dart';

class PropertyMain extends StatelessWidget {
  // final String message;
  //final int choice;
  //Test2({@required this.message, @required this.choice});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: MotorCycle(),
    );
  }
}



class MotorCycle extends StatelessWidget {
  // final String choice;
  // MotorCycle({@required this.choice});

  @override
  Widget build(BuildContext context) { 

    List villa = [
      translator.translate('Villa/House For Rent'),
      translator.translate('Apartment For Rent'),
    ];
    gotoScreen(int choice) {
      Navigator.of(context).push(
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          if (choice == 0) return HouseForRent(carModelSeries:"hh", carModel:"hh");
          if (choice == 1) return HouseForRent(carModelSeries:"hh",  carModel:"hh");
        }),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Text("Choose the category",
                      style: new TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                  SizedBox(height: 9),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
            Divider(height: 0,thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: villa.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                  },
                  title: Text(villa[index], style: TextStyle(fontSize: 17)),
                  //  selected: index == _selectedIndex,
                ),
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            )
          ]),
    );
  }
}*/
///////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import 'HouseForSale2.dart';

double rotate = 0, rotate2 = 0;

class PropertyMain extends StatefulWidget {
  final bool choice2;
  final List<String> car;

  //Test2({@required this.message, @required this.choice});
  //NameViewList({List<String> names}) : this.names = names ?? [];

  PropertyMain({@required this.choice2, @required this.car});

  @override
  _PropertyMainState createState() => _PropertyMainState();
}

class _PropertyMainState extends State<PropertyMain> {
  double rotate = 0, rotate2 = 0, leadingSize;
  int api;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    gotoScreen(bool ch, String carModel, int index) {
      Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          if (ch == true)
            return PropertyMainInner(
                choice: carModel,
                title: "Property For Rent2",
                index: index,
                rentOrSale: true);
          if (ch == false)
            return PropertyMainInner(
                choice: carModel,
                title: "Property For salee",
                index: index,
                rentOrSale: false);
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Transform.scale(
            scale: leadingSize,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp,
                ]);
                Navigator.of(context).pop();
              },
            )),
        automaticallyImplyLeading: false,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("choose_the_category2")}",
                style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            /* Row(
          children: [
            Text(
                "... > ${translator.translate('${widget.section}')} > ${translator.translate('${widget.innersection}')} > ${translator.translate('${widget.carModel}')}  ",
                style: new TextStyle(fontSize: 3.5.w, color: Colors.grey[800])),
          ],
        ),*/
            SizedBox(height: rotate2),
            Divider(
              height: 0,
              thickness: 1.2,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: widget.car.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    if (index == 0 || index == 1) {
                      if (index == 0) {
                        if (translator.currentLanguage == 'ar') api = 1586;

                        if (translator.currentLanguage == 'en') api = 1584;
                      }

                      if (index == 1) {
                        if (translator.currentLanguage == 'ar') api = 1580;
                        if (translator.currentLanguage == 'en') api = 1578;
                      }
                      return ForSaleSection(
                          carModel: widget.car[index], api: api);
                    }
                    if (index == 2 || index == 3)
                      gotoScreen(widget.choice2, widget.car[index], index);
                  },
                  title:
                      Text(widget.car[index], style: TextStyle(fontSize: 5.w)),
                ),
                separatorBuilder: (context, index) {
                  return Divider(height: 5);
                },
              ),
            )
          ]),
    );
  }
}

class PropertyMainInner extends StatefulWidget {
  final String choice;
  final String title;
  final int index;
  final bool rentOrSale;

  PropertyMainInner(
      {@required this.choice,
      @required this.title,
      @required this.index,
      @required this.rentOrSale});

  @override
  _PropertyMainInnerState createState() => _PropertyMainInnerState();
}

class _PropertyMainInnerState extends State<PropertyMainInner> {
  double rotate = 0, rotate2 = 0, leadingSize;
  int api;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  List<String> array;
  @override
  Widget build(BuildContext context) {
    if (widget.rentOrSale == false) {
      if (widget.index == 2)
        array = [
          translator.translate(
            "Commercial Floor",
          ),
          translator.translate(
            "Commercial Vila",
          ),
          translator.translate("Commercial Building"),
          translator.translate(
            "Factory",
          ),
          translator.translate("Industrial for Sale"),
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
      //Residential
      if (widget.index == 3)
        array = [
          translator.translate("Apartment for Sale"),
          translator.translate("Penthouse"),
          translator.translate("Residential Building3"),
          translator.translate("Residential Floor2"),
          translator.translate("Townhouse"),
          translator.translate("Villa/House for Sale"),
          translator.translate("Villa Compound3"),
        ];
    }

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    gotoScreen(String car, String carModel, int _index) {
      if (widget.rentOrSale == true) {
        if (widget.index == 2) {
          //Commercial
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 7303;
            if (_index == 1) api = 7305;
            if (_index == 2) api = 7301;
            if (_index == 3) api = 7309;
            if (_index == 4) api = 9092;
            if (_index == 5) api = 7311;
            if (_index == 6) api = 7315;
            if (_index == 7) api = 7317;
            if (_index == 8) api = 7299;
            if (_index == 9) api = 7319;
            if (_index == 10) api = 7313;
            if (_index == 11) api = 7321;
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 7277;
            if (_index == 1) api = 7279;
            if (_index == 2) api = 7275;
            if (_index == 3) api = 7281;
            if (_index == 4) api = 8387;
            if (_index == 5) api = 7285;
            if (_index == 6) api = 7289;
            if (_index == 7) api = 7291;
            if (_index == 8) api = 7297;
            if (_index == 9) api = 7293;
            if (_index == 10) api = 7287;
            if (_index == 11) api = 7295;
          }
        }
        if (widget.index == 3) {
          //Residential
          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 7247;
            if (_index == 1) api = 7249;
            if (_index == 2) api = 7271;
            if (_index == 3) api = 7251;
            if (_index == 4) api = 7253;
            if (_index == 5) api = 7257;
            if (_index == 6) api = 7255;
          }
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 7269;
            if (_index == 1) api = 7267;
            if (_index == 2) api = 7273;
            if (_index == 3) api = 7265;
            if (_index == 4) api = 7263;
            if (_index == 5) api = 7259;
            if (_index == 6) api = 7261;
          }
        }
      }
      Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          if (choice2 == 1) return ForSaleSection(carModel: car, api: api);
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Transform.scale(
            scale: leadingSize,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp,
                ]);
                Navigator.of(context).pop();
              },
            )),
        automaticallyImplyLeading: false,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("choose_the_category2")}",
                style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              children: [
                Text(
                    //  "... > ${translator.translate('${widget.title}')} > ${translator.translate('${widget.choice}')} > ${translator.translate('${widget.carModel}')}  ",
                    "... > ${translator.translate('${widget.title}')} > ${translator.translate('${widget.choice}')} ",
                    style: new TextStyle(
                        fontSize: 3.5.w, color: Colors.grey[800])),
              ],
            ),
            SizedBox(height: rotate2),
            Divider(
              height: 0,
              thickness: 1.2,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: array.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    gotoScreen(widget.choice, array[index], index);
                  },
                  title: Text(array[index], style: TextStyle(fontSize: 5.w)),
                ),
                separatorBuilder: (context, index) {
                  return Divider(height: 5);
                },
              ),
            )
          ]),
    );
  }
}
