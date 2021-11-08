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
import 'package:oxydu/PropertyForSale/HouseForSale2.dart';
import 'package:sizer/sizer.dart';

import 'HouseForRent.dart';

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
  int api = 0;
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
    gotoScreen(int choice22, bool ch, String carModel, int index) {
      if (index == 0 || index == 1) {
       
        if (index == 0) {
          if (translator.currentLanguage == 'ar') {
            api = 1586;
          }
          if (translator.currentLanguage == 'en') {
            api = 1584;
          }
        }
        if (index == 1) {
          if (translator.currentLanguage == 'ar') {
            api = 1580;
          }
          if (translator.currentLanguage == 'en') {
            api = 1578;
          }
        } 
        Navigator.push(
          context,
          // ignore: missing_return
          MaterialPageRoute(builder: (context) {
            return ForSaleSection(carModel: carModel, api: api);
          }),
        );
      }
      if (index == 2 || index == 3) {
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
            if (ch == false) {
              return PropertyMainInner(
                  choice: carModel,
                  title: "roperty For salee",
                  index: index,
                  rentOrSale: false);
            }
          }),
        );
      }
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
                    gotoScreen(1, widget.choice2, widget.car[index], index);
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
  //Test2({@required this.message, @required this.choice});
  //NameViewList({List<String> names}) : this.names = names ?? [];

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
    if (widget.rentOrSale == true) {
      if (widget.index == 0)
        array = [
          translator.translate("Residential Building"),
          translator.translate("Residential Floor"),
          translator.translate("Residential Plot"),
          translator.translate("Townhouse"),
          translator.translate("Villa Compound"),
          translator.translate("Penthouse"),
          translator.translate("Villa/House for Rent"),
          translator.translate("Apartment for Rent"),
        ];
      //Short Term Monthly
      if (widget.index == 1)
        array = [
          translator.translate(
            "Apartment for Rent",
          ),
          translator.translate(
            "Villa/House for Rent",
          ),
        ];
      //Short Term daily
      if (widget.index == 2)
        array = [
          translator.translate(
            "Apartment for Rent",
          ),
          translator.translate(
            "Villa/House for Rent",
          ),
        ];
      //rooms for rent
      if (widget.index == 3)
        array = [
          translator.translate(
            "Apartment for Rent",
          ),
          translator.translate(
            "Villa/House for Rent",
          ),
        ];
      //commercial for rent
      if (widget.index == 4)
        array = [
          translator.translate(
            "Bulk Unit",
          ),
          translator.translate("Commercial Building"),
          translator.translate(
            "Commercial Floor",
          ),
          translator.translate(
            "Commercial Plot",
          ),
          translator.translate(
            "Commercial Vila",
          ),
          translator.translate(
            "Factory",
          ),
          translator.translate("Industrial for Rent"),
          translator.translate(
            "Industrial Land",
          ),
          translator.translate(
            "Mixed Use Land",
          ),
          translator.translate(
            "Office for Rent",
          ),
          translator.translate("other5"),
          translator.translate(
            "Retial for Rent2",
          ),
          translator.translate(
            "Staff",
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
        ];
    }
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
    /* carModels = [
      translator.translate("Academic City"),
      translator.translate("Al Barari"),
      translator.translate("Al Barsha"),
      translator.translate("Al Buteen"),
      translator.translate("Al Furjan"),
      translator.translate("Al Jaddaf"),
      translator.translate("Al Jafiliya"),
      translator.translate("Al Karama"),
      translator.translate("Al Mamzar"),
      translator.translate("Al Nahda "),
      translator.translate("Al Quoz"),
      translator.translate("Al Qusais"),
      translator.translate("Al Sufouh"),
      translator.translate("Al Warqaa"),
      translator.translate("Al Warsan"),
      translator.translate("Al Wasl"),
      translator.translate("Arabian Ranches"),
      translator.translate("Arabian Ranches 2"),
      translator.translate("Arabian Ranches 3"),
      translator.translate("Arjan"),
      translator.translate("Barsha Heights (Tecom)"),
      translator.translate("Bluewaters Island"),
      translator.translate("Bur Dubai"),
      translator.translate("Business Bay"),
      translator.translate("City of Arabia"),
      translator.translate("City of Dubai"),
      translator.translate("Culture Village"),
      translator.translate("DAMAC Hills (Akoya by DAMAC)"),
      translator.translate("DAMAC Hills 2 (Akoya Oxygen)"),
      translator.translate("DIFC"),
      translator.translate("DMC, DIC & KV Freezones"),
      translator.translate("Deira"),
      translator.translate("Discovery Gardens"),
      translator.translate("Downtown Dubai"),
      translator.translate("Downtown Jebel Ali"),
      translator.translate("Dubai Autodrome"),
      translator.translate("Dubai Festival City"),
      translator.translate("Dubai Harbour"),
      translator.translate("Dubai Hills Estate"),
      translator.translate("Dubai Industrial Park"),
      translator.translate("Dubai Investment Park (DIP)"),
      translator.translate("Dubai Marina"),
      translator.translate("Dubai Maritime City"),
      translator.translate("Dubai Media City"),
      translator.translate("Dubai Production City (IMPZ)"),
      translator.translate("Dubai Residence Complex"),
      translator.translate("Dubai Science Park"),
      translator.translate("Dubai Silicon Oasis"),
      translator.translate("Dubai South"),
      translator.translate("Dubai Sports City"),
      translator.translate("Dubai Studio City"),
      translator.translate("Dubai Waterfront"),
      translator.translate("Dubai World Central"),
      translator.translate("Dubailand"),
      translator.translate("Emirates Hills"),
      translator.translate("Golf City"),
      translator.translate("Green Community"),
      translator.translate("International City"),
      translator.translate("Jebel Ali"),
      translator.translate("Jumeirah"),
      translator.translate("Jumeirah Beach Residence (JBR)"),
      translator.translate("Jumeirah Golf Estates"),
      translator.translate("Jumeirah Heights"),
      translator.translate("Jumeirah Islands"),
      translator.translate("Jumeirah Lake Towers (JLT)"),
      translator.translate("Jumeirah Park"),
      translator.translate("Jumeirah Village"),
      translator.translate("Jumeirah Village Circle (JVC)"),
      translator.translate("Jumeirah Village Triangle (JVT)"),
      translator.translate("Knowledge Village"),
      translator.translate("Liwan"),
      translator.translate("Meadows Town Centre"),
      translator.translate("Meydan City"),
      translator.translate("Mirdif"),
      translator.translate("Mohammed Bin Rashid City"),
      translator.translate("Motor City"),
      translator.translate("Mudon"),
      translator.translate("Muhaisnah"),
      translator.translate("Nad Al Sheba"),
      translator.translate("Old Town"),
      translator.translate("Palm Jumeirah"),
      translator.translate("Pearl Jumeirah"),
      translator.translate("Ras Al Khor"),
      translator.translate("Remraam"),
      translator.translate("Serena"),
      translator.translate("Sheikh Zayed Road"),
      translator.translate("The Greens"),
      translator.translate("The Hills"),
      translator.translate("The Lagoons"),
      translator.translate("The Valley"),
      translator.translate("The Views"),
      translator.translate("The Villa"),
      translator.translate("The World Islands"),
      translator.translate("Tilal Al Ghaf"),
      translator.translate("Town Square"),
      translator.translate("Umm Suqeim"),
      translator.translate("Wasl Gate"),
      translator.translate("World Trade Center"),
      translator.translate("Za'abeel"),
    ];*/

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    gotoScreen(int choice2, String car, String carModel, int _index) {
      if (widget.rentOrSale == true) {
        //Rent
        if (widget.index == 0) {
          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 6867;
            if (_index == 1) api = 6869;
            if (_index == 2) api = 6871;
            if (_index == 3) api = 6873;
            if (_index == 4) api = 6875;
            if (_index == 5) api = 9103;
            if (_index == 6) api = 9107;
            if (_index == 7) api = 9105;
          }

          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 6883;
            if (_index == 1) api = 6889;
            if (_index == 2) api = 6885;
            if (_index == 3) api = 6887;
            if (_index == 4) api = 6891;
            if (_index == 5) api = 6893;
            if (_index == 6) api = 6879;
          }
        }
        if (widget.index == 1) {
          //monthly
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 6971;
            if (_index == 1) api = 6973;
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 9113;
            if (_index == 1) api = 9115;
          }
        }
        if (widget.index == 2) {
          //daily
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 6979;
            if (_index == 1) api = 6981;
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 9109;
            if (_index == 1) api = 9111;
          }
        }
        if (widget.index == 3) {
          //rooms for rent
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 6963;
            if (_index == 1) api = 6965;
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 9117;
            if (_index == 1) api = 9119;
          }
        }
        if (widget.index == 4) {
          //Commercial for rent
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 6927;
            if (_index == 1) api = 6929;
            if (_index == 2) api = 6931;
            if (_index == 3) api = 6933;
            if (_index == 4) api = 6935;
            if (_index == 5) api = 6937;
            if (_index == 6) api = 6941;
            if (_index == 7) api = 6939;
            if (_index == 8) api = 6943;
            if (_index == 9) api = 6945;
            if (_index == 10) api = 6947;
            if (_index == 11) api = 6949;
            if (_index == 12) api = 6955;
            if (_index == 13) api = 6951;
            if (_index == 14) api = 6957;
            if (_index == 15) api = 6953;
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 6895;
            if (_index == 1) api = 6897;
            if (_index == 2) api = 6899;
            if (_index == 3) api = 6901;
            if (_index == 4) api = 6903;
            if (_index == 5) api = 6905;
            if (_index == 6) api = 6909;
            if (_index == 7) api = 6907;
            if (_index == 8) api = 6911;
            if (_index == 9) api = 6913;
            if (_index == 10) api = 6915;
            if (_index == 11) api = 6917;
            if (_index == 12) api = 6923;
            if (_index == 13) api = 6919;
            if (_index == 14) api = 6925;
            if (_index == 15) api = 6921;
          }
        }
        Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          return HouseForRent(carModel: car, api: api);
        }),
      );
      }
      if (widget.rentOrSale == false) {
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
        Navigator.push(
          context,
          // ignore: missing_return
          MaterialPageRoute(builder: (context) {
            return ForSaleSection(carModel: car, api: api);
          }),
        );
      } 
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
                    gotoScreen(1, widget.choice, array[index], index);
                    // if (index == 1) gotoScreen(1);
                    //   if (index == 5) gotoScreen(5);
                    //   if (index == )
                    /* if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                    if (index == 5) gotoScreen(5);*/
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
