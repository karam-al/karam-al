import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/MotorsMain/UsedCarForSale.dart';
import 'package:sizer/sizer.dart';

double rotate = 0, rotate2 = 0, leadingSize = 0;

class AutoAccessories extends StatefulWidget {
  @override
  _AutoAccessoriesState createState() => _AutoAccessoriesState();
}

class _AutoAccessoriesState extends State<AutoAccessories> {
  int api = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  Widget build(BuildContext context) {
    final List autoAccessories = [
      translator.translate('Car/4x4 Parts'),
      translator.translate('Apparel, Merchandise & Accessories'),
      translator.translate('Motorcycle Parts'),
      translator.translate('Automotive Tools'),
      translator.translate('Boat Parts'),
      translator.translate('NumberPlates'),
      translator.translate('Other Vehicle Parts'),
      translator.translate("Automotive Tools"),
      translator.translate("Apparel, Merchandise & Accessories"),
      translator.translate("Boat Parts"),
      translator.translate("Car/4x4 Parts"),
      translator.translate("Motorcycle Parts"),
      translator.translate("Other Vehicle Parts"),
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
          if (choice2 == 0) return AutomotiveTools();
          if (choice2 == 1) return Merchandise();
          if (choice2 == 4) return Car4x4();
          if (choice2 == 2) return MotorcycleParts();
          if (choice2 == 3) return BoatParts();
          if (choice2 == 5) {
            if (translator.currentLanguage == 'en') {
              api = 1556;
            }
            if (translator.currentLanguage == 'ar') {
              api = 1568;
            }
            Navigator.push(
              context,
              // ignore: missing_return
              MaterialPageRoute(builder: (context) {
                return UsedCarForSale(
                    choice: 5, carModelAPI: api, title: "Other Vehicle Parts");
              }),
            );
          }
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
                    "... > ${translator.translate('Motors')}>${translator.translate('Auto Accessories')}  ",
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
                itemCount: autoAccessories.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                    if (index == 5) gotoScreen(5);
                  },
                  title: Text(autoAccessories[index],
                      style: TextStyle(fontSize: 5.w)),
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

class Car4x4 extends StatefulWidget {
  @override
  _Car4x4State createState() => _Car4x4State();
}

class _Car4x4State extends State<Car4x4> {
  int autoAccessoriesApiChild = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {
    if (translator.currentLanguage == 'en') {
      if (_index2 == 0) autoAccessoriesApiChild = 1582;
      if (_index2 == 1) autoAccessoriesApiChild = 1592;
      if (_index2 == 2) autoAccessoriesApiChild = 1594;
      if (_index2 == 3) autoAccessoriesApiChild = 6278;
      if (_index2 == 4) autoAccessoriesApiChild = 6280;
      if (_index2 == 5) autoAccessoriesApiChild = 6282;
      if (_index2 == 6) autoAccessoriesApiChild = 6284;
      if (_index2 == 7) autoAccessoriesApiChild = 6286;
      if (_index2 == 8) autoAccessoriesApiChild = 6288;
      if (_index2 == 9) autoAccessoriesApiChild = 6290;
      if (_index2 == 10) autoAccessoriesApiChild = 6292;
    }

    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) autoAccessoriesApiChild = 1588;
      if (_index2 == 1) autoAccessoriesApiChild = 1590;
      if (_index2 == 2) autoAccessoriesApiChild = 1596;
      if (_index2 == 3) autoAccessoriesApiChild = 6294;
      if (_index2 == 4) autoAccessoriesApiChild = 6296;
      if (_index2 == 5) autoAccessoriesApiChild = 6298;
      if (_index2 == 6) autoAccessoriesApiChild = 6300;
      if (_index2 == 7) autoAccessoriesApiChild = 6302;
      if (_index2 == 8) autoAccessoriesApiChild = 6304;
      if (_index2 == 9) autoAccessoriesApiChild = 6306;
      if (_index2 == 10) autoAccessoriesApiChild = 6308;
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: autoAccessoriesApiChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List car4by4 = [
      translator.translate("A/C & Heating Parts"),
      translator.translate("Batteries"),
      translator.translate("Brakes"),
      translator.translate("Engine & Computer Parts"),
      translator.translate("Exhaust/Air lntake"),
      translator.translate("Exterior Parts"),
      translator.translate("Interior Parts"),
      translator.translate("Lighting"),
      translator.translate("Suspension"),
      translator.translate("Wheels/Tries"),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("choose_the_category2")}",
                style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              children: [
                Text(
                    "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate('Car/4x4 Parts')}",
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
                itemCount: car4by4.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  dense: true,
                  onTap: () {
                    gotoScreen(index, car4by4[index]);
                  },
                  title: Text(car4by4[index], style: TextStyle(fontSize: 5.w)),
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

class Merchandise extends StatefulWidget {
  @override
  _MerchandiseState createState() => _MerchandiseState();
}

class _MerchandiseState extends State<Merchandise> {
  int autoAccessoriesApiChild = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {
    //ar
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) autoAccessoriesApiChild = 6322;
      if (_index2 == 1) autoAccessoriesApiChild = 7653;
      if (_index2 == 2) autoAccessoriesApiChild = 6324;
      if (_index2 == 3) autoAccessoriesApiChild = 6326;
      if (_index2 == 4) autoAccessoriesApiChild = 6328;
      if (_index2 == 5) autoAccessoriesApiChild = 6336;
    }
    //en
    if (translator.currentLanguage == 'en') {
      if (_index2 == 0) autoAccessoriesApiChild = 6312;
      if (_index2 == 1) autoAccessoriesApiChild = 7649;
      if (_index2 == 2) autoAccessoriesApiChild = 6314;
      if (_index2 == 3) autoAccessoriesApiChild = 6316;
      if (_index2 == 4) autoAccessoriesApiChild = 6318;
      if (_index2 == 5) autoAccessoriesApiChild = 6320;
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
            choice: 5, carModelAPI: autoAccessoriesApiChild, title: carModel);
      }),
    );
  }

  Widget build(BuildContext context) {
    final List merchandiseAndAccessories = [
      translator.translate("Apparel"),
      translator.translate("Boat Accessories"),
      translator.translate("Car/4x4 Accessories"),
      translator.translate("Merchandise"),
      translator.translate("Motorcycle Accessories"),
      translator.translate("other"),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("choose_the_category2")}",
                style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              children: [
                Text(
                    "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} >${translator.translate("Merchandise")}",
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
                itemCount: merchandiseAndAccessories.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    gotoScreen(index, merchandiseAndAccessories[index]);
                  },
                  title: Text(merchandiseAndAccessories[index],
                      style: TextStyle(fontSize: 5.w)),
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

class MotorcycleParts extends StatefulWidget {
  @override
  _MotorcyclePartsState createState() => _MotorcyclePartsState();
}

class _MotorcyclePartsState extends State<MotorcycleParts> {
  int autoAccessoriesApiChild = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {
//ar
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) autoAccessoriesApiChild = 6370;
      if (_index2 == 1) autoAccessoriesApiChild = 6364;
      if (_index2 == 2) autoAccessoriesApiChild = 7683;
      if (_index2 == 3) autoAccessoriesApiChild = 6362;
      if (_index2 == 4) autoAccessoriesApiChild = 6360;
      if (_index2 == 5) autoAccessoriesApiChild = 7695;
      if (_index2 == 6) autoAccessoriesApiChild = 6358;
    }
//en
    if (translator.currentLanguage == 'en') {
      if (_index2 == 0) autoAccessoriesApiChild = 6346;
      if (_index2 == 1) autoAccessoriesApiChild = 6348;
      if (_index2 == 2) autoAccessoriesApiChild = 7679;
      if (_index2 == 3) autoAccessoriesApiChild = 6350;
      if (_index2 == 4) autoAccessoriesApiChild = 6350;
      if (_index2 == 5) autoAccessoriesApiChild = 7689;
      if (_index2 == 6) autoAccessoriesApiChild = 6356;
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: autoAccessoriesApiChild,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List motorcycleParts = [
      translator.translate("Accessories"),
      translator.translate("Body & Frame"),
      translator.translate("Brakes & Suspension"),
      translator.translate("Engines & Components"),
      translator.translate("Lighting"),
      translator.translate("Wheels Tires"),
      translator.translate("Otheer")
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("choose_the_category2")}",
                style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              children: [
                Text(
                    "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate('Motorcycle Parts')}",
                    style: new TextStyle(
                        fontSize: 3.2.w, color: Colors.grey[800])),
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
                itemCount: motorcycleParts.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    gotoScreen(index, motorcycleParts[index]);
                  },
                  title: Text(motorcycleParts[index],
                      style: TextStyle(fontSize: 5.w)),
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

class AutomotiveTools extends StatefulWidget {
  @override
  _AutomotiveToolsState createState() => _AutomotiveToolsState();
}

class _AutomotiveToolsState extends State<AutomotiveTools> {
  int autoAccessoriesApiChild = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {
    //ar
    if (translator.currentLanguage == 'ar') {
      if (_index2 == 0) autoAccessoriesApiChild = 6382;
      if (_index2 == 1) autoAccessoriesApiChild = 6380;
    }

    //en
    if (translator.currentLanguage == 'en') {
      if (_index2 == 0) autoAccessoriesApiChild = 6376;
      if (_index2 == 1) autoAccessoriesApiChild = 6378;
    }
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
            choice: 5, carModelAPI: autoAccessoriesApiChild, title: carModel);
      }),
    );
  }

  Widget build(BuildContext context) {
    final List automotiveTools = [
      translator.translate("Tool Accessories"),
      translator.translate("Tools"),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("choose_the_category2")}",
                style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              children: [
                Text(
                    "... >${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate("AutomotiveTools")}",
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
                itemCount: automotiveTools.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    gotoScreen(index, automotiveTools[index]);
                  },
                  title: Text(automotiveTools[index],
                      style: TextStyle(fontSize: 5.w)),
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

class BoatParts extends StatefulWidget {
  @override
  _BoatPartsState createState() => _BoatPartsState();
}

class _BoatPartsState extends State<BoatParts> {
  int autoAccessoriesApiChild = 0;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {
    //en
    if (_index2 == 0) autoAccessoriesApiChild = 6386;
    if (_index2 == 1) autoAccessoriesApiChild = 6388;

    //ar
    if (_index2 == 0) autoAccessoriesApiChild = 6392;
    if (_index2 == 1) autoAccessoriesApiChild = 6394;
    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
            choice: 5, carModelAPI: autoAccessoriesApiChild, title: carModel);
      }),
    );
  }

  Widget build(BuildContext context) {
    final List boatParts = [
      translator.translate("Electronic Parts"),
      translator.translate("Engine Parts"),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("choose_the_category2")}",
                style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              children: [
                Text(
                    "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate('Boat Parts')}",
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
                itemCount: boatParts.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    gotoScreen(index, boatParts[index]);
                  },
                  title:
                      Text(boatParts[index], style: TextStyle(fontSize: 5.w)),
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
/*
class OtherVehicleParts extends StatefulWidget {
  @override
  _OtherVehiclePartsState createState() => _OtherVehiclePartsState();
}

class _OtherVehiclePartsState extends State<OtherVehicleParts> {
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  gotoScreen(int _index2, String carModel) {

    Navigator.push(
      context,
      // ignore: missing_return
      MaterialPageRoute(builder: (context) {
        return UsedCarForSale(
          carModelAPI: api,
          choice: 5,
          title: carModel,
        );
      }),
    );
  }

  Widget build(BuildContext context) {
    final List numberPlates = [
      translator.translate("Dubai Plate"),
      translator.translate("Abu Dhabi Plate"),
      translator.translate("Ajman Plate"),
      translator.translate("Al Ain Plate"),
      translator.translate("Fujairah Plate"),
      translator.translate("Ras al Khaimah Plate"),
      translator.translate("Sharjah Plate"),
      translator.translate("Umm al Quwain Plate")
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
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
              Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Text("${translator.translate("choose_the_category2")}",
            style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
        ),
        Row(
          children: [
            Text(
                "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate("NumberPlates")}",
                style: new TextStyle(fontSize: 3.5.w, color: Colors.grey[800])),
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
            itemCount: numberPlates.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              onTap: () {
                gotoScreen(index, translator.translate('NumberPlates'),
                    numberPlates[index]);
              },
              title: Text(numberPlates[index], style: TextStyle(fontSize: 5.w)),
            ),
            separatorBuilder: (context, index) {
              return Divider(height: 5);
            },
          ),
        )
      ]),
    );
  }
}*/
