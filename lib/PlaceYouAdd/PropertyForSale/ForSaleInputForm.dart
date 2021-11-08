import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import 'CommercialforSale.dart';
import 'LandForSale.dart';
import 'MultipleUnits.dart';
import 'ResidentialBuilding.dart';

class ForSaleInputForm extends StatefulWidget {
  @override
  _ForSaleInputFormState createState() => _ForSaleInputFormState();
}

class _ForSaleInputFormState extends State<ForSaleInputForm> {
  double rotate = 0, rotate2 = 0, leadingSize;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  List forSale  ;

  @override
  Widget build(BuildContext context) {
    forSale = [
    translator.translate('Land for Sale'),
    translator.translate('Multiple Units for Sale'),
    translator.translate('Commercial for Sale'),
    translator.translate('Residential Building2'),
  ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.height * 0.62;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.height * 0.43;
    }

    gotoScreen(dynamic choice) {
      Navigator.of(context).push(
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          if (choice == 0) return LandForSale();
          if (choice == 1) return MultipleUnitsInputForm();
          if (choice == 2) return CommercialforSale();
          if (choice == 3) return ResidentialBuildingInput();
          //    if (choice == 2) return ShortTermDaily();
          //   if (choice == 3) return RoomsFlatMates();
          //      if (choice == 4) return CommercialforRent();
        }),
      );
    }

    // size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Transform.scale(
            scale: leadingSize,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp,
                ]);
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
                  Text(translator.translate('Property For salee'),
                      style: new TextStyle(fontSize: 6.w)),
                  SizedBox(height: 1.2.h),
                  Text("${translator.translate("choose_the_category")}",
                      style: new TextStyle(
                          fontSize: 4.w, color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(height: rotate2),
                ],
              ),
            ),
            Divider(height: 0, thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: forSale.length,
                itemBuilder: (BuildContext context, dynamic index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                  },
                  title: Text(forSale[index], style: TextStyle(fontSize: 5.w)),
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
