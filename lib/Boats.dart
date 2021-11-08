import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import 'MotorsMain/UsedCarForSale.dart';

double rotate = 0, rotate2 = 0, leadingSize = 0;

class BoatsMain extends StatefulWidget {  
  @override
  _BoatsMainState createState() => _BoatsMainState();
}

class _BoatsMainState extends State<BoatsMain> {
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  Widget build(BuildContext context) {
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
      body: Boats(),
    );
  }
}

class Boats extends StatefulWidget {
  @override
  _BoatsState createState() => _BoatsState();
}

class _BoatsState extends State<Boats> {
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  Widget build(BuildContext context) {
    final List boats = [
      translator.translate("Motorboats"),
      translator.translate("Sailboats"),
      translator.translate("Row/Paddle Boats"),
    ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    gotoScreen(int choicee) {
      Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          if (choicee == 0) return Motorboats();
          if (choicee == 1) return Sailboats();
          if (choicee == 2) return RowPaddleBoats();
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
                  SizedBox(
                    width: rotate,
                    child: Text(
                        "... > ${translator.translate("Motors")} > ${translator.translate("Boats")}",
                        style: new TextStyle(
                            fontSize: 3.5.w, color: Colors.grey[800])),
                  ),
                  SizedBox(height: rotate2),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 1.2,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: boats.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                  },
                  title: Text(boats[index], style: TextStyle(fontSize: 5.w)),
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

class Motorboats extends StatefulWidget {
  @override
  _MotorboatsState createState() => _MotorboatsState();
}

class _MotorboatsState extends State<Motorboats> {
  int boatsAPIChild = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        boatsAPIChild = 1750;
      }
      if (_index2 == 1) {
        boatsAPIChild = 1752;
      }
      if (_index2 == 2) {
        boatsAPIChild = 7941;
      }
      if (_index2 == 3) {
        boatsAPIChild = 1754;
      }
      if (_index2 == 4) {
        boatsAPIChild = 1756;
      }
      if (_index2 == 5) {
        boatsAPIChild = 1758;
      }
      if (_index2 == 6) {
        boatsAPIChild = 1760;
      }
      if (_index2 == 7) {
        boatsAPIChild = 1748;
      }
    }
    if (translator.currentLanguage == 'en') {
      if (_index2 == 0) {
        boatsAPIChild = 1734;
      }
      if (_index2 == 1) {
        boatsAPIChild = 1736;
      }
      if (_index2 == 2) {
        boatsAPIChild = 7937;
      }
      if (_index2 == 3) {
        boatsAPIChild = 1738;
      }
      if (_index2 == 4) {
        boatsAPIChild = 1740;
      }
      if (_index2 == 5) {
        boatsAPIChild = 1742;
      }
      if (_index2 == 6) {
        boatsAPIChild = 1744;
      }
      if (_index2 == 7) {
        boatsAPIChild = 1746;
      }
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: boatsAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List motorboats = [
      translator.translate("Fishing Boat"),
      translator.translate("Outboard Dayboat"),
      translator.translate("Pontoon/House Boat"),
      translator.translate("Racing Boat"),
      translator.translate("Sleeper/Mini Yacht"),
      translator.translate("Wakeboarding/Ski Boat"),
      translator.translate("Yacht"),
      translator.translate("Other"),
    ];
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
                  /*if (widget.choice == false)
                Text("${translator.translate("Now_choose_the_right")}",
                    style:
                        new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
              if (widget.choice == false)
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              if (widget.choice == false)
                Text("${translator.translate("category_for_your_ad")}",
                    style:
                        new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
              if (widget.choice == true)*/
                  Text("${translator.translate("choose_the_category2")}",
                      style: new TextStyle(
                          fontSize: 5.w, color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(
                    width: rotate,
                    child: Text(
                        "... > ${translator.translate("Motors")} > ${translator.translate("Boats")} > ${translator.translate("Motorboats")}",
                        style: new TextStyle(
                            fontSize: 3.5.w, color: Colors.grey[800])),
                  ),
                  SizedBox(height: rotate2),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 1.2,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: motorboats.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, motorboats[index]);
                  },
                  title:
                      Text(motorboats[index], style: TextStyle(fontSize: 5.w)),
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

class Sailboats extends StatefulWidget {
  @override
  _SailboatsState createState() => _SailboatsState();
}

class _SailboatsState extends State<Sailboats> {
  int boatsAPIChild = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {
    if (translator.currentLanguage == 'en') {
      if (_index2 == 0) {
        boatsAPIChild = 1762;
      }
      if (_index2 == 1) {
        boatsAPIChild = 7949;
      }
      if (_index2 == 2) {
        boatsAPIChild = 7957;
      }
      if (_index2 == 3) {
        boatsAPIChild = 7961;
      }
      if (_index2 == 4) {
        boatsAPIChild = 7965;
      }
      if (_index2 == 5) {
        boatsAPIChild = 1764;
      }
      if (_index2 == 6) {
        boatsAPIChild = 7973;
      }
    }
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        boatsAPIChild = 1768;
      }
      if (_index2 == 1) {
        boatsAPIChild = 7953;
      }
      if (_index2 == 2) {
        boatsAPIChild = 7959;
      }
      if (_index2 == 3) {
        boatsAPIChild = 7963;
      }
      if (_index2 == 4) {
        boatsAPIChild = 7969;
      }
      if (_index2 == 5) {
        boatsAPIChild = 1766;
      }
      if (_index2 == 6) {
        boatsAPIChild = 7997;
      }
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: boatsAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List sailboats = [
      translator.translate("Catamaran"),
      translator.translate("Cruiser/Day Sailor"),
      translator.translate("DhowVoilier"),
      translator.translate("Dinghy"),
      translator.translate("Racer"),
      translator.translate("Sailing Yacht"),
      translator.translate("Other"),
    ];
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
                  SizedBox(
                    width: rotate,
                    child: Text(
                        "... > ${translator.translate("Motors")} > ${translator.translate("Boats")} > ${translator.translate("Sailboats")}",
                        style: new TextStyle(
                            fontSize: 3.5.w, color: Colors.grey[800])),
                  ),
                  SizedBox(height: rotate2),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 1.2,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: sailboats.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, sailboats[index]);
                  },
                  title:
                      Text(sailboats[index], style: TextStyle(fontSize: 5.w)),
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

class RowPaddleBoats extends StatefulWidget {
  @override
  _RowPaddleBoatsState createState() => _RowPaddleBoatsState();
}

class _RowPaddleBoatsState extends State<RowPaddleBoats> {
  int boatsAPIChild = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {
    if (translator.currentLanguage == 'en') {
      if (_index2 == 0) {
        boatsAPIChild = 7985;
      }
      if (_index2 == 1) {
        boatsAPIChild = 1771;
      }
      if (_index2 == 2) {
        boatsAPIChild = 7993;
      }
      if (translator.currentLanguage == 'ar') {
        if (_index2 == 0) {
          boatsAPIChild = 7989;
        }
        if (_index2 == 1) {
          boatsAPIChild = 1773;
        }
        if (_index2 == 2) {
          boatsAPIChild = 7997;
        }
      }
      Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          return UsedCarForSale(
            carModelAPI: boatsAPIChild,
            choice: 5,
            title: carModel,
          );
        }),
      );
    }
  }

  Widget build(BuildContext context) {
    final List rowPaddleBoats = [
      translator.translate("Canoe/Row Boat"),
      translator.translate("Paddle Boat"),
      translator.translate("Other"),
    ];
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
                  SizedBox(
                    width: rotate,
                    child: Text(
                        "... > ${translator.translate("Motors")} > ${translator.translate("Boats")} > ${translator.translate("Row/Paddle Boats")}",
                        style: new TextStyle(
                            fontSize: 3.5.w, color: Colors.grey[800])),
                  ),
                  SizedBox(height: rotate2),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 1.2,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: rowPaddleBoats.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, rowPaddleBoats[index]);
                  },
                  title: Text(rowPaddleBoats[index],
                      style: TextStyle(fontSize: 5.w)),
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
