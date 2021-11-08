import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/MotorsMain/UsedCarForSale.dart';
import 'package:sizer/sizer.dart';

double rotate = 0, rotate2 = 0, leadingSize = 0;

class HeavyVehiclesMain extends StatefulWidget {
  @override
  _HeavyVehiclesMainState createState() => _HeavyVehiclesMainState();
}

class _HeavyVehiclesMainState extends State<HeavyVehiclesMain> {
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
      body: MotorCycle(),
    );
  }
}

class MotorCycle extends StatefulWidget {
  @override
  _MotorCycleState createState() => _MotorCycleState();
}

class _MotorCycleState extends State<MotorCycle> {
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  Widget build(BuildContext context) {
    List heavyVehicles = [
      translator.translate("Trucks"),
      translator.translate("Buses"),
      translator.translate("Forklifts"),
      translator.translate("Trailes"),
      translator.translate("Cranes"),
      translator.translate("Tankers"),
      translator.translate("Parts & Engines"),
      translator.translate("other Heavy Vehicles"),
    ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    gotoScreen(int choice2) {
      Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          if (choice2 == 0) return Trucks();
          if (choice2 == 1) return Buses();
          if (choice2 == 2) return Forklifts();
          if (choice2 == 3) return Trailers();
          if (choice2 == 4) return Cranes();
          if (choice2 == 5) return Tankers();
          if (choice2 == 6) return PartsEngines();
          if (choice2 == 7) return OtherHeavyVehicles();
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
                          "... > ${translator.translate("Motors")} > ${translator.translate("Heavy Vehicles")}",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
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
                itemCount: heavyVehicles.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                    if (index == 5) gotoScreen(5);
                    if (index == 6) gotoScreen(6);
                    if (index == 7) gotoScreen(7);
                  },
                  title: Text(heavyVehicles[index],
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

class Trucks extends StatefulWidget {
  @override
  _TrucksState createState() => _TrucksState();
}

class _TrucksState extends State<Trucks> {
  int heavyVehiclesAPIChild = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {
    if (translator.currentLanguage == 'en') {
      if (_index2 == 1) heavyVehiclesAPIChild = 7713;
      if (_index2 == 2) heavyVehiclesAPIChild = 1631;
      if (_index2 == 3) heavyVehiclesAPIChild = 7727;
      if (_index2 == 4) heavyVehiclesAPIChild = 7735;
      if (_index2 == 5) heavyVehiclesAPIChild = 7743;
      if (_index2 == 6) heavyVehiclesAPIChild = 6332;
      if (_index2 == 7) heavyVehiclesAPIChild = 6338;
      if (_index2 == 8) heavyVehiclesAPIChild = 1633;
      if (_index2 == 9) heavyVehiclesAPIChild = 6342;
      if (_index2 == 10) heavyVehiclesAPIChild = 7749;
      if (_index2 == 11) heavyVehiclesAPIChild = 7757;
      if (_index2 == 13) heavyVehiclesAPIChild = 7761;
    }
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) heavyVehiclesAPIChild = 6330;
      if (_index2 == 1) heavyVehiclesAPIChild = 7719;
      if (_index2 == 2) heavyVehiclesAPIChild = 1637;
      if (_index2 == 3) heavyVehiclesAPIChild = 7731;
      if (_index2 == 4) heavyVehiclesAPIChild = 7737;
      if (_index2 == 5) heavyVehiclesAPIChild = 7747;
      if (_index2 == 6) heavyVehiclesAPIChild = 6334;
      if (_index2 == 7) heavyVehiclesAPIChild = 6340;
      if (_index2 == 8) heavyVehiclesAPIChild = 1635;
      if (_index2 == 9) heavyVehiclesAPIChild = 6344;
      if (_index2 == 10) heavyVehiclesAPIChild = 7753;
      if (_index2 == 11) heavyVehiclesAPIChild = 7759;
      if (_index2 == 13) heavyVehiclesAPIChild = 7763;
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: heavyVehiclesAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List trucks = [
      translator.translate("Cab-Chassis"),
      translator.translate("Cherry Picker"),
      translator.translate("Crane Truck"),
      translator.translate("Curtain Sider"),
      translator.translate("Dual Cab"),
      translator.translate("Fire Truck"),
      translator.translate("Prime Mover"),
      translator.translate("Refrigerated Truck"),
      translator.translate("Service Vehicle"),
      translator.translate("Tipper"),
      translator.translate("Tow & Tilt"),
      translator.translate("Wrecking"),
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
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate("Motors")} >${translator.translate("Heavy Vehicles")} > ${translator.translate("Trucks")}",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
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
                itemCount: trucks.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, trucks[index]);
                  },
                  title: Text(trucks[index], style: TextStyle(fontSize: 5.w)),
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

class Buses extends StatefulWidget {
  @override
  _BusesState createState() => _BusesState();
}

class _BusesState extends State<Buses> {
  int heavyVehiclesAPIChild = 0;
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
        heavyVehiclesAPIChild = 1657;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 1659;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 1661;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1663;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 1665;
      }
    }
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        heavyVehiclesAPIChild = 1669;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 1671;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 1673;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1675;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 1667;
      }
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: heavyVehiclesAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List buses = [
      translator.translate("City Bus"),
      translator.translate("Coach"),
      translator.translate("Coaster"),
      translator.translate("School Bus"),
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
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate("Motors")} >${translator.translate("Heavy Vehicles")} >${translator.translate("Buses")}",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
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
                itemCount: buses.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, buses[index]);
                  },
                  title: Text(buses[index], style: TextStyle(fontSize: 5.w)),
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

class Forklifts extends StatefulWidget {
  @override
  _ForkliftsState createState() => _ForkliftsState();
}

class _ForkliftsState extends State<Forklifts> {
  int heavyVehiclesAPIChild = 0;
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
        heavyVehiclesAPIChild = 6352;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 1692;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 6366;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1696;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 7777;
      }
    }
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        heavyVehiclesAPIChild = 6372;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 1694;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 6368;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1698;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 7779;
      }
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: heavyVehiclesAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List forklifts = [
      translator.translate("All Terrain"),
      translator.translate("Diesel"),
      translator.translate("Electric"),
      translator.translate("Side Loader"),
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
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate("Motors")} >${translator.translate("Heavy Vehicles")} >${translator.translate("Forklifts")}",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
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
                itemCount: forklifts.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, forklifts[index]);
                  },
                  title: Text(forklifts[index],
                      style: TextStyle(
                        fontSize: 5.w,
                      )),
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

class Trailers extends StatefulWidget {
  @override
  _TrailersState createState() => _TrailersState();
}

class _TrailersState extends State<Trailers> {
  int heavyVehiclesAPIChild = 0;
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
        heavyVehiclesAPIChild = 7791;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 6374;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 1639;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 7797;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 7801;
      }
      if (_index2 == 5) {
        heavyVehiclesAPIChild = 7805;
      }
      if (_index2 == 6) {
        heavyVehiclesAPIChild = 1641;
      }
      if (_index2 == 7) {
        heavyVehiclesAPIChild = 6390;
      }
      if (_index2 == 8) {
        heavyVehiclesAPIChild = 6398;
      }
      if (_index2 == 9) {
        heavyVehiclesAPIChild = 6402;
      }
      if (_index2 == 11) {
        heavyVehiclesAPIChild = 1643;
      }
    }
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        heavyVehiclesAPIChild = 7795;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 6384;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 1645;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 7799;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 7803;
      }
      if (_index2 == 5) {
        heavyVehiclesAPIChild = 7807;
      }
      if (_index2 == 6) {
        heavyVehiclesAPIChild = 1647;
      }
      if (_index2 == 7) {
        heavyVehiclesAPIChild = 6396;
      }
      if (_index2 == 8) {
        heavyVehiclesAPIChild = 6400;
      }
      if (_index2 == 9) {
        heavyVehiclesAPIChild = 6404;
      }
      if (_index2 == 11) {
        heavyVehiclesAPIChild = 1688;
      }
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: heavyVehiclesAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List trailers = [
      translator.translate("B Double"),
      translator.translate("Curtain Sider"),
      translator.translate("Dog Trailer"),
      translator.translate("Dolly Trailer"),
      translator.translate("Drop Decker"),
      translator.translate("Extendable Trailer"),
      translator.translate("Flat Deck"),
      translator.translate("Low Loader"),
      translator.translate("Refrigerated Trailer"),
      translator.translate("Tipper"),
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
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate("Motors")} >${translator.translate("Heavy Vehicles")} >${translator.translate("Trailers")}",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
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
                itemCount: trailers.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, trailers[index]);
                  },
                  title: Text(trailers[index],
                      style: TextStyle(
                        fontSize: 5.w,
                      )),
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

class Cranes extends StatefulWidget {
  @override
  _CranesState createState() => _CranesState();
}

class _CranesState extends State<Cranes> {
  int heavyVehiclesAPIChild = 0;
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
        heavyVehiclesAPIChild = 1677;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 7825;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 6406;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1679;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 1681;
      }
    }
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        heavyVehiclesAPIChild = 1685;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 7829;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 6408;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1683;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 1690;
      }
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: heavyVehiclesAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List cranes = [
      translator.translate("All Terrain Cranes"),
      translator.translate("Tower Cranes"),
      translator.translate("Tractor Cranes"),
      translator.translate("Truck Loading"),
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
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate("Motors")} >${translator.translate("Heavy Vehicles")} >${translator.translate("Cranes")}",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
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
                itemCount: cranes.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, cranes[index]);
                  },
                  title: Text(cranes[index],
                      style: TextStyle(
                        fontSize: 5.w,
                      )),
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

class Tankers extends StatefulWidget {
  @override
  _TankersState createState() => _TankersState();
}

class _TankersState extends State<Tankers> {
  int heavyVehiclesAPIChild = 0;
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
        heavyVehiclesAPIChild = 7845;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 1649;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 7863;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1651;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 7857;
      }
    }
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        heavyVehiclesAPIChild = 7855;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 1653;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 7865;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1655;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 7861;
      }
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: heavyVehiclesAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List tankers = [
      translator.translate("Fiberglass Tank"),
      translator.translate("Fuel Tank"),
      translator.translate("Stainless Steel Tank"),
      translator.translate("Water Tank"),
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
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate("Motors")} >${translator.translate("Heavy Vehicles")} >${translator.translate("Tankers")}",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
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
                itemCount: tankers.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, tankers[index]);
                  },
                  title: Text(tankers[index],
                      style: TextStyle(
                        fontSize: 5.w,
                      )),
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

class PartsEngines extends StatefulWidget {
  @override
  _PartsEnginesState createState() => _PartsEnginesState();
}

class _PartsEnginesState extends State<PartsEngines> {
  int heavyVehiclesAPIChild = 0;
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
        heavyVehiclesAPIChild = 7873;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 7879;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 7895;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 7899;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 7905;
      }
      if (_index2 == 5) {
        heavyVehiclesAPIChild = 7913;
      }
      if (_index2 == 6) {
        heavyVehiclesAPIChild = 6434;
      }
    }
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        heavyVehiclesAPIChild = 7875;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 7881;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 7897;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 7903;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 9157;
      }
      if (_index2 == 5) {
        heavyVehiclesAPIChild = 7915;
      }
      if (_index2 == 6) {
        heavyVehiclesAPIChild = 6436;
      }
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: heavyVehiclesAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List partsEngines = [
      translator.translate("Bus Parts"),
      translator.translate("Crane Parts"),
      translator.translate("Forklift Parts"),
      translator.translate("Tanker Parts"),
      translator.translate("Trailer Parts"),
      translator.translate("Truck Parts"),
      translator.translate("Other PartsEngines"),
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
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate("Motors")} >${translator.translate("Heavy Vehicles")} >${translator.translate("Parts & Engines")}",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
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
                itemCount: partsEngines.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, partsEngines[index]);
                  },
                  title: Text(partsEngines[index],
                      style: TextStyle(
                        fontSize: 5.w,
                      )),
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

class OtherHeavyVehicles extends StatefulWidget {
  @override
  _OtherHeavyVehiclesState createState() => _OtherHeavyVehiclesState();
}

class _OtherHeavyVehiclesState extends State<OtherHeavyVehicles> {
  int heavyVehiclesAPIChild = 0;
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
        heavyVehiclesAPIChild = 6410;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 1702;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 1704;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1706;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 1708;
      }
      if (_index2 == 5) {
        heavyVehiclesAPIChild = 7919;
      }
    }
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) {
        heavyVehiclesAPIChild = 6412;
      }
      if (_index2 == 1) {
        heavyVehiclesAPIChild = 1712;
      }
      if (_index2 == 2) {
        heavyVehiclesAPIChild = 1714;
      }
      if (_index2 == 3) {
        heavyVehiclesAPIChild = 1716;
      }
      if (_index2 == 4) {
        heavyVehiclesAPIChild = 1718;
      }
      if (_index2 == 5) {
        heavyVehiclesAPIChild = 7923;
      }
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: heavyVehiclesAPIChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List otherHeavyVehicles = [
      translator.translate("Agriculture Vehicles"),
      translator.translate("RVs & Motorhomes"),
      translator.translate("Site Dumpers"),
      translator.translate("Sweepers"),
      translator.translate("Tractors"),
      translator.translate("Winches"),
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
                  Row(
                    children: [
                      Text(
                          "... >${translator.translate("Motors")} >${translator.translate("Heavy Vehicles")} >${translator.translate("other Heavy Vehicles")}",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 3.5.w, color: Colors.grey[800])),
                    ],
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
                itemCount: otherHeavyVehicles.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, otherHeavyVehicles[index]);
                  },
                  title: Text(otherHeavyVehicles[index],
                      style: TextStyle(
                        fontSize: 5.w,
                      )),
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
