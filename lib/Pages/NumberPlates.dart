/*import 'package:flutter/material.dart';


class NumberPlates extends StatelessWidget {
  // final String message;
  //final int choice;
  //Test2({@required this.message, @required this.choice});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Boats(),
    );
  }
}

List numberPlates = [
 " Dubai plate",
"Abu Dhabi plate",
"Sharjah plate",
"Ajman plate",
"Fujairah plate",
"Umm al Quwain plate",
"Ras al Khaimah plate",
];

class Boats extends StatelessWidget {
  static const animationDuration = Duration(milliseconds: 520);

  @override
  Widget build(BuildContext context) {

    gotoScreen(int choice) {
      Navigator.push(
        context,
     MaterialPageRoute(builder: (context) {
          if (choice == 0) return Motorboats();
          if (choice == 1) return Sailboats();
          if (choice == 2) return RowPaddleBoats();

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
                  SizedBox(height: 15),
                  Text("Now choose the right",
                      style: new TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                  SizedBox(height: 9),
                  Text(" category for your ad :",
                      style: new TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: boats.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);

                  },
                  title: Text(boats[index],
                      style: TextStyle(fontSize: 17)),
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


class Dubaiplate extends StatelessWidget {
  List dubaiplate = [
   "Private car",
"Classic car",
 "Motorcycle",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Sport Bike',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Text("Now choose the right",
                      style: new TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold,color: Colors.grey[800])),
                  SizedBox(height: 9),
                  Text(" category for your ad :",
                      style: new TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold,color: Colors.grey[800])),
                  SizedBox(height: 30),
                  /* Text(
                    "choose the category that your ad fits into. ",
                    style: new TextStyle(fontSize: 12, color: Colors.black54),
                  ),*/
                  //SizedBox(height: 5),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: motorboats.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    //  if(index == 1 )
                    // gotoMotorCycleScreen();
                    /* gotoSecondScreen();
                      setState(() {
                        _selectedIndex = index;
                      });*/
                  },
                  title: Text(motorboats[index], style: TextStyle(fontSize: 17)),
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