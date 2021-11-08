import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/MotorsMain/UsedCarForSale.dart';
import 'package:sizer/sizer.dart';

double rotate = 0, rotate2 = 0, leadingSize = 0;

class MotorCycleMain extends StatefulWidget {
  @override
  _MotorCycleMainState createState() => _MotorCycleMainState();
}

class _MotorCycleMainState extends State<MotorCycleMain> {
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
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
                Navigator.of(context).pop();
              },
            )),
        automaticallyImplyLeading: false,
      ),
      body: MotorCycle(),
    );
  }
}

/*
List motor = [
  "Sport Bike",
  "Adventure/Touring",
  "Cruiser/Chopper",
  "Off-Road",
  "Scooter",
  "Standard/Commuter",
  "Cafe racer",
  "Trilke",
  "Trailer",
  "Karting",
  "Mo-Ped",
  "Other",
];*/

class MotorCycle extends StatefulWidget {
  @override
  _MotorCycleState createState() => _MotorCycleState();
}

class _MotorCycleState extends State<MotorCycle> {
  double leadingSize = 0;
  int motorcylceType = 0;
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  @override
  Widget build(BuildContext context) {
    List motor = [
      translator.translate("Trailer"),
      translator.translate("Standard"),
      translator.translate("Sport Bike"),
      translator.translate("Scooter"),
      translator.translate("Off-Road"),
      translator.translate("Karting"),
      translator.translate("Cruiser"),
      translator.translate("Café racer"),
      translator.translate("Adventure"),
      translator.translate("Trike"),
      translator.translate("Otheer"),
    ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    gotoScreen(int _index, String s) {
      if (translator.currentLanguage == 'en') {
        if (_index == 0) motorcylceType = 1508;
        if (_index == 1) motorcylceType = 1504;
        if (_index == 3) motorcylceType = 1502;
        if (_index == 4) motorcylceType = 1500;
        if (_index == 5) motorcylceType = 1510;
        if (_index == 6) motorcylceType = 1498;
        if (_index == 7) motorcylceType = 1506;
        if (_index == 8) motorcylceType = 1496;
        if (_index == 9) motorcylceType = 7621;
        if (_index == 10) motorcylceType = 1512;
      }
      if (translator.currentLanguage == 'ar') {
        if (_index == 0) motorcylceType = 1532;
        if (_index == 1) motorcylceType = 1530;
        if (_index == 3) motorcylceType = 1526;
        if (_index == 4) motorcylceType = 1524;
        if (_index == 5) motorcylceType = 1522;
        if (_index == 6) motorcylceType = 1520;
        if (_index == 7) motorcylceType = 1518;
        if (_index == 8) motorcylceType = 1516;
        if (_index == 9) motorcylceType = 7623;
        if (_index == 10) motorcylceType = 1514;
      }
      Navigator.of(context).push(
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          if (_index == 2)
            return Sportbike();
          else {
            return UsedCarForSale(
                choice: 5, carModelAPI: motorcylceType, title: s);
          }
        }),
      );
    }

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03), 
                  Text("${translator.translate("choose_the_category2")}",
                      style: new TextStyle(
                          fontSize: 5.w, color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate('Motors')}> ${translator.translate('Motorcycles')}",
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
                  ),
                  SizedBox(height: rotate2),
                ],
              ),
            ),
            Divider(height: 0, thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: motor.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 2) gotoScreen(2, motor[index]);
                    if (index != 2) {
                      gotoScreen(1, motor[index]);
                    }
                  },
                  title: Text(motor[index], style: TextStyle(fontSize: 5.w)),
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

class Sportbike extends StatefulWidget {
  @override
  _SportbikeState createState() => _SportbikeState();
}

class _SportbikeState extends State<Sportbike> {
  int sportBikeType = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String s) {
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        sportBikeType = 1536;
      }
      if (_index2 == 1) {
        sportBikeType = 1538;
      }
      if (_index2 == 2) {
        sportBikeType = 1544;
      }
    }
    if (translator.currentLanguage == 'en') {
      if (_index2 == 0) {
        sportBikeType = 1534;
      }
      if (_index2 == 1) {
        sportBikeType = 1540;
      }
      if (_index2 == 2) {
        sportBikeType = 1542;
      }
    }
    Navigator.of(context).push(
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          choice: 5,
          carModelAPI: sportBikeType,
          title: s,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    List sportBike = [
      translator.translate("Hyper_sports"),
      translator.translate("Super_bike"),
      translator.translate("Super_sports"),
    ];

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
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
                Navigator.of(context).pop();
              },
            )),
        automaticallyImplyLeading: false,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text("${translator.translate("choose_the_category2")}",
                      style: new TextStyle(
                          fontSize: 5.w, color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate('Motors')} > ${translator.translate('Motorcycles')} > ${translator.translate('Sport Bike')}",
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
                  ),
                  SizedBox(height: rotate2),
                ],
              ),
            ),
            Divider(height: 0, thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: sportBike.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, sportBike[index]);
                  },
                  title:
                      Text(sportBike[index], style: TextStyle(fontSize: 5.w)),
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
