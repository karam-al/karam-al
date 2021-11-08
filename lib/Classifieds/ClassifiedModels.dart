import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/Classifieds/ClassifiedsMainBuyPages/Jewelry.dart';

double rotate = 0, rotate2 = 0;

class ClassifiedModels extends StatelessWidget {
  final int index;
  final bool choice;
  final List<String> clasiList;
  final String clasiModel, clasiModelchild;
  //Test2({@required this.message, @required this.choice});
//NameViewList({List<String> names}) : this.names = names ?? [];

  ClassifiedModels(
      {@required this.choice,
      @required this.clasiList,
      @required this.index,
      @required this.clasiModel,
      @required this.clasiModelchild});

  @override
  Widget build(BuildContext context) {
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
          if (choice == false) {}
          if (choice == true) {
             if (choice2 == 1 ) return Jewelry();
            // if (choice2 == 5 ) return UsedCarForSale();
          }
          return Container();
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        /*  title: Text(
          'Auto Accessories',
          style: TextStyle(color: Colors.black),
        ),*/
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            if (choice == false)
              Text("${translator.translate("Now_choose_the_right")}",
                  style: new TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            if (choice == false)
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            if (choice == false)
              Text("${translator.translate("category_for_your_ad")}",
                  style: new TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            if (choice == true)
              Text("${translator.translate("choose_the_category2")}",
                  style: new TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            SizedBox(
              width: rotate,
              child: Text(
                  "... > ${translator.translate('Classifieds')} > ${translator.translate('$clasiModel')} > ${translator.translate('$clasiModelchild')} ",
                  style: new TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
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
                itemCount: clasiList.length,
                itemBuilder: (BuildContext context, int index2) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    if (index == 68||index == 69||index == 70||index == 71) gotoScreen(1); 
                  },
                  title: Text(clasiList[index2], style: TextStyle(fontSize: 17)),
                ),
                separatorBuilder: (context, index2) {
                  return Divider(height: 5);
                },
              ),
            )
          ]),
    );
  }
}


