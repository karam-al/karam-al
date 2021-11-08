import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart'; 
import 'UsedCarForSale.dart';

class AutoAccessories extends StatelessWidget {
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
      body: AutoAccessoriesMain(),
    );
  }
}

class AutoAccessoriesMain extends StatelessWidget {
  // final String choice;
  // MotorCycle({@required this.choice});

  @override
  Widget build(BuildContext context) {
    List motor = [
    translator.translate('Car/4x4 Parts'),
    translator.translate('Apparel, Merchandise & Accessories'),
    translator.translate('Motorcycle Parts'),
    translator.translate('Automotive Tools'),
    translator.translate('Boat Parts'),
    translator.translate('NumberPlates'),
    translator.translate('Other Vehicle Parts'),
    ];

    gotoScreen(int choice) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          if (choice == 0) return Car4x4M();
          if (choice == 1) return MerchandiseM();
          if (choice == 2) return MotorcyclePartsM();
          if (choice == 3) return AutomotiveToolsM();
          if (choice == 4) return BoatPartsM();
          if (choice == 5) return NumberPlatesM();
          //    if (choice == 1) return SearchList();
          else
            return Container();
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
            Divider(),
            Expanded(
              child: ListView.separated(
                itemCount: motor.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                    if (index == 5) gotoScreen(5);
                  },
                  title: Text(motor[index], style: TextStyle(fontSize: 17)),
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
class Car4x4M extends StatelessWidget {
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
    translator.translate("Other")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        /* title: Text(
          'Car4x4 Parts',
          style: TextStyle(color: Colors.black),
        ),*/
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("Now_choose_the_right")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text("${translator.translate("category_for_your_ad")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            SizedBox(
        //      width: rotate,
              child: Text(
                  "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate('Car/4x4 Parts')}",
                  style: new TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            ),
          //  SizedBox(height: rotate2),
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
                  onTap: () {},
                  title: Text(car4by4[index], style: TextStyle(fontSize: 17)),
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

class MerchandiseM extends StatelessWidget {
  final List merchandiseAndAccessories = [
    translator.translate("Apparel"),
    translator.translate("Boat Accessories"),
    translator.translate("Car/4x4 Accessories"),
    translator.translate("Merchandise"),
    translator.translate("Motorcycle Accessories"),
    translator.translate("Other")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("Now_choose_the_right")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text("${translator.translate("category_for_your_ad")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            SizedBox(
            //  width: rotate,
              child: Text(
                  "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} >${translator.translate("Merchandise")}",
                  style: new TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            ),
          //  SizedBox(height: rotate2),
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
                  onTap: () {},
                  title: Text(merchandiseAndAccessories[index],
                      style: TextStyle(fontSize: 17)),
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

class MotorcyclePartsM extends StatelessWidget {
  final List motorcycleParts = [
    translator.translate("Accessories"),
    translator.translate("Body & Frame"),
    translator.translate("Brakes & Suspension"),
    translator.translate("Engines & Components"),
    translator.translate("Lighting"),
    translator.translate("Wheels Tires"),
    translator.translate("Otheer")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("Now_choose_the_right")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text("${translator.translate("category_for_your_ad")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            SizedBox(
            //  width: rotate,
              child: Text(
                  "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate('Motorcycle Parts')}",
                  style: new TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            ),
           // SizedBox(height: rotate2),
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
                  onTap: () {},
                  title: Text(motorcycleParts[index],
                      style: TextStyle(fontSize: 17)),
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

class AutomotiveToolsM extends StatelessWidget {
  final List automotiveTools = [
    translator.translate("Tool Accessories"),
    translator.translate("Tool Sets"),
    translator.translate("Tools")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("Now_choose_the_right")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text("${translator.translate("category_for_your_ad")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            SizedBox(
            //  width: rotate,
              child: Text(
                  "... >${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate("AutomotiveTools")}",
                  style: new TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            ),
           // SizedBox(height: rotate2),
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
                  onTap: () {},
                  title: Text(automotiveTools[index],
                      style: TextStyle(fontSize: 17)),
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

class BoatPartsM extends StatelessWidget {
  final List boatParts = [
    translator.translate("Body Parts & Accessories"),
    translator.translate("Electronic Parts"),
    translator.translate("Engine Parts"),
    translator.translate("plumbing & Ventilation"),
    translator.translate("Sailing Gear"),
    translator.translate("Other")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("Now_choose_the_right")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text("${translator.translate("category_for_your_ad")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            SizedBox(
              //width: rotate,
              child: Text(
                  "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate('Boat Parts')}",
                  style: new TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            ),
           // SizedBox(height: rotate2),
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
                  onTap: () {},
                  title: Text(boatParts[index], style: TextStyle(fontSize: 17)),
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

class NumberPlatesM extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("Now_choose_the_right")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text("${translator.translate("category_for_your_ad")}",
                style: new TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            SizedBox(
           //   width: rotate,
              child: Text(
                  "... > ${translator.translate("Motors")} > ${translator.translate("Auto Accessories")} > ${translator.translate("NumberPlates")}",
                  style: new TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            ),
            //SizedBox(height: rotate2),
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
                  onTap: () {},
                  title:
                      Text(numberPlates[index], style: TextStyle(fontSize: 17)),
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