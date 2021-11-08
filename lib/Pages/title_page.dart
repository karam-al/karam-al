import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:oxydu/Pages/Specialization_company.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xFFFFB74D);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text('Latest Deals '),
      ),
      body: Column(children: [
        SizedBox(
          height: 150,
          width: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:4.0, right: 8.0,top: 5),
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(20, (index) {
                return Container(
                  child: createGridItem(
                    6,
                    "Title",
                    "20/12/2020",
                  ),
                );
              }),
            ),
          ),
        ),
      ]),
    );
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

    
  Widget createGridItem(int position, String text, String text2) {
    var color = Colors.white;

    switch (position) {
      case 0:
        color = Colors.grey;

        break;
      case 1:
        color = Colors.grey;

        break;
      case 2:
        color = Colors.grey;

        break;
      case 3:
        color = Colors.grey;

        break;
      case 4:
        color = Colors.grey;

        break;
      case 5:
        color = Colors.grey;

        break;
      case 6:
        color = Colors.white;

        break;
      case 7:
        color = Colors.orange;

        break;
    }

    return Builder(builder: (context) {
      return Card(
        elevation: 4,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)), 
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SpecializationComp();
                },
              ),
            );
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      text2,
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
