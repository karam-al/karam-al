import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart'; 

class MotorCycleMain extends StatelessWidget {
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
    List motor = [
      translator.translate('Trailer'),
      translator.translate('Standard'),
      translator.translate('Sport Bike'),
      translator.translate('Scooter'),
      translator.translate('Otheer'),
      translator.translate('Off-Road'),
      translator.translate('Karting'),
      translator.translate('Cruiser'),
      translator.translate('Café racer'),
      translator.translate('Adventure'), 
    ];

    gotoScreen(int choice) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          print(choice);
         /* if (choice == 0) return UsedCarForSale();
          if (choice == 1) return UsedCarForSale();
          if (choice == 2) return UsedCarForSale();
          if (choice == 3) return UsedCarForSale();
          if (choice == 4) return UsedCarForSale();
          if (choice == 5) return UsedCarForSale();
          if (choice == 6)
            return UsedCarForSale();*/
          //    if (choice == 1) return SearchList();
      //    else
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
                    if (index == 1) gotoScreen(0);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(0);
                    if (index == 4) gotoScreen(0);
                    if (index == 5) gotoScreen(0);
                    if (index == 6) gotoScreen(0);
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
