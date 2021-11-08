import 'package:flutter/material.dart';
import 'dart:ui';

class Specialization extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavoritesScreenState();
  }
}

class FavoritesScreenState extends State<Specialization> {
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xFFFFB74D);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text('Latest Deals '),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(20, (index) {
            return Padding(
              padding: const EdgeInsets.only(left:4.0, right: 8.0),
              child: Container(
                child: createGridItem(6, "Company Name 1", "Specialization"),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget createGridItem(int position, String text, String text2) {
    var color = Colors.white;
    // ignore: unused_local_variable
    var icondata = Icons.add;

    switch (position) {
      case 0:
        color = Colors.grey;
        icondata = Icons.home;

        break;
      case 1:
        color = Colors.grey;
        icondata = Icons.directions_car;

        break;
      case 2:
        color = Colors.grey;
        icondata = Icons.phone_android;

        break;
      case 3:
        color = Colors.grey;
        icondata = Icons.check_box_outline_blank;

        break;
      case 4:
        color = Colors.grey;
        icondata = Icons.local_laundry_service;

        break;
      case 5:
        color = Colors.grey;
        icondata = Icons.tag_faces;

        break;
      case 6:
        color = Colors.white;
        icondata = Icons.business;

        break;
      case 7:
        color = Colors.orange;
        icondata = Icons.text_fields;

        break;
    }
    Widget frostedText(Widget child) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Container(
                  width: 60.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: child)));
    }

    return Builder(builder: (context) {
      return Card(
        elevation: 4,
        color: color,
        /* shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.black),
        ),*/
        child: InkWell(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Stack(children: [
                SizedBox(
                    height: 120,
                    child: ClipRRect( 
                      child: Image.network(
                        'http://oxydu.linkgroupsy.com/linkgroupsy/Oxydusub/wp-content/uploads/2021/04/image-3.png?v=1621775342',
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )),
                Container(
                    child: frostedText(Center(
                  child: Text("25000",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ))),
              ]),  
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.orange, fontSize: 13),
                ),
              ),
              Text(
                text2,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
      );
    });
  }
}
