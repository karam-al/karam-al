import 'package:flutter/material.dart';

import 'HomeAppliances.dart';

class HomeAppliancesMain extends StatelessWidget {
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

List villa = ["Small Kitchen Appliances", "Large Appliances"];

class MotorCycle extends StatelessWidget {
  // final String choice;
  // MotorCycle({@required this.choice});

  @override
  Widget build(BuildContext context) {
    gotoScreen(int choice) {
      Navigator.of(context).push(
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
         if (choice == 0) return HomeAppliances();
         if (choice == 1) return HomeAppliances();     
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
