import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../my_flutter_app_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:oxydu/constants.dart';
import 'Jobs/JobsMenu.dart';
import 'Motors/AutoAccessoriesInputForm.dart';
import 'Motors/CarsForRent.dart';
import 'Motors/HeavyVehiclesInputForm.dart';
import 'Motors/NumberPlatesInputForm.dart';
import 'Motors/PlaceMotorcycle.dart';
import 'Motors/PlaceUsedCarForSale.dart';
import 'Motors/boatsInputForm.dart';
import 'Property For Rent/ForRentInputForm.dart';
import 'PropertyForSale/ForSaleInputForm.dart';
import 'offers/offersMenu.dart';

class Placeyouradd extends StatefulWidget {
  @override
  _PlaceyouraddState createState() => _PlaceyouraddState();
}

class _PlaceyouraddState extends State<Placeyouradd>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: DashBoard(),
      ),
    );
  }
}

// ignore: must_be_immutable
class DashBoard extends StatelessWidget {
  bool flaag = false, flaag2 = false;
  bool flaag3 = false;
  double rotateI = 0, rotated = 0, iconSize = 0, rotate1 = 0, rotate2 = 0;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      translator.currentLanguage == 'en' ? rotate1 = 10.w : rotate1 = 7.w;
      translator.currentLanguage == 'en' ? rotate2 = 1.w : rotate2 = 0.1.w;
      rotateI = 7.w;
      // rotated = MediaQuery.of(context).size.height * 0.71;
      rotated = 100.w;
      //  rotateI = MediaQuery.of(context).size.height * 0.04;
      iconSize = 7.w;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotateI = 6.h;
      //   rotated = MediaQuery.of(context).size.height * 1.3;
      rotated = 72.h;
      iconSize = 35;
      //  rotateI = MediaQuery.of(context).size.height * 0.0975;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 10.w,
              ),
              SizedBox(
                child: Column(
                  children: [
                    SizedBox(height: rotate1),
                    Text(translator.translate('What_are_you_listing'),
                        style: new TextStyle(fontSize: 6.w)),
                    SizedBox(height: rotate2),
                    Text(
                      translator.translate('choose_the_category'),
                      style:
                          new TextStyle(fontSize: 3.5.w, color: Colors.black54),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              SizedBox(
                height: rotated,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 6.w),
                    // child: IgnorePointer(
                    child: GridView.count(
                      physics: new NeverScrollableScrollPhysics(),
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 3
                          : 4,
                      children: <Widget>[
                        createGridItem(
                            9,
                            translator.translate('Property For Rent'),
                            "",
                            false,
                            true,
                            false,
                            false),
                        createGridItem(
                            10,
                            translator.translate('Property For sale'),
                            "",
                            false,
                            true,
                            false,
                            false),
                        createGridItem(1, translator.translate('Motors'), "",
                            false, true, false, false),
                        /* createGridItem(2, translator.translate('Mobile Phones'),
                            "", false, true, false, false),
                        createGridItem(3, translator.translate('Furniture'), "",
                            false, true, false, false),
                        createGridItem(4, translator.translate('Classifieds'),
                            "", false, true, false, false),
                        createGridItem(5, translator.translate('Community '),
                            "", false, true, false, false),
                        createGridItem(6, translator.translate('Home '), "",
                            false, true, false, false),
                        createGridItem(7, translator.translate('Business '), "",
                            false, true, false, false),*/
                        createGridItem(8, translator.translate('Jobs'), "",
                            false, true, false, false),
                        createGridItem(8, translator.translate('Offers'), "",
                            false, true, false, false),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget createGridItem(int position, String text, String text2, bool flag,
      bool flag2, bool flag3, bool flag4) {
    var icondata2 = Icons.add;

    switch (position) {
      case 1:
        icondata2 = MyFlutterApp.motors;

        break;
      case 2:
        icondata2 = MyFlutterApp.mobiles;
        break;
      case 3:
        icondata2 = MyFlutterApp.furniture___garden;
        break;
      case 4:
        icondata2 = MyFlutterApp.classifieds;
        break;
      case 5:
        icondata2 = MyFlutterApp.community;
        break;
      case 6:
        icondata2 = MyFlutterApp.home_appliances;
        break;
      case 7:
        icondata2 = MyFlutterApp.business___industrial;
        break;

      case 8:
        icondata2 = MyFlutterApp.mobiles;

        break;
      case 9:
        icondata2 = MyFlutterApp.property_for_rent;
        break;
      case 10:
        icondata2 = MyFlutterApp.property_for_sale;
        break;
    }
    return Builder(builder: (context) {
      return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          //  side: BorderSide(color: Colors.black),
        ),
        child: InkWell(
          onTap: () {
            if (text == "Motors" || text == "المحركات") {
              if (id == null) {
                final snackBar = SnackBar(
                    content: Text(translator
                        .translate('You are not Logged in')));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (id != null)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Motors();
                    },
                  ),
                );
            }
            if (text == "\tProperty\n For Rent" || text == "عقارات للإيجار") {
             if (id == null) {
                final snackBar = SnackBar(
                    content: Text(translator
                        .translate('You are not Logged in')));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (id != null)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ForRentInputForm();
                  },
                ),
              );
            }
            if (text == "\tProperty\n For Sale" || text == "عقارات للبيع") {
             if (id == null) {
                final snackBar = SnackBar(
                    content: Text(translator
                        .translate('You are not Logged in')));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (id != null)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ForSaleInputForm();
                  },
                ),
              );
            }

            if (text == "Jobs" || text == "وظائف") {
              if (id == null) {
                final snackBar = SnackBar(
                    content: Text(translator
                        .translate('You are not Logged in')));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (id != null)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return JobsMenu();
                  },
                ),
              );
            }
            if (text == "Offers" || text == "العروض") {
              if (id == null) {
                final snackBar = SnackBar(
                    content: Text(translator
                        .translate('You are not Logged in')));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (id != null)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return OffersMenuInput();
                  },
                ),
              );
            }
          },
          child: Column(
            children: <Widget>[
              SizedBox(
                  height:
                      rotateI), //////////////////////////////////////////////////////
              Icon(
                icondata2,
                size: iconSize,
                color: Colors.orange,
              ),
              SizedBox(height: 1.h),
              Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 3.1.w),
              ),
            ],
          ),
        ),
      );
    });
    /* return Builder(builder: (BuildContext ctxt) {
      gotoMotorsScreen() {
        Navigator.push(
          ctxt,
          MaterialPageRoute(
            builder: (ctxt) => new Test3(),
          ),
        );
      }

 

      return Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 10),
        child: Card(
          elevation: 6,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.black),
          ),
          child: InkWell(
            onTap: () {
              if(text == "Motors")
              gotoMotorsScreen();
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    icondata2,
                    size: 40,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });*/
  }
}
/////////////////////////////////////////////////////////////////////////////////////
///

class Motors extends StatefulWidget {
  @override
  _MotorsState createState() => _MotorsState();
}

class _MotorsState extends State<Motors> {
  double rotate = 0, rotate2 = 0, leadingSize;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  List motor;

  @override
  Widget build(BuildContext context) {
    motor = [
      translator.translate('All'),
      translator.translate('CarForRent'),
      translator.translate('Motorcycles'),
      translator.translate('Auto Accessories'),
      translator.translate('Heavy Vehicles'),
      translator.translate('Boats'),
      translator.translate('NumberPlates')
    ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.height * 0.62;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.height * 0.43;
    }

    gotoScreen(int choice) {
      Navigator.of(context).push(
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          // if (choice == 0) return Imagee();
          if (choice == 0) return PlaceUsedCarForSaleInputForm();
          if (choice == 1) return CarsForRent();
          if (choice == 2) return MotorcycleInputForm();
          // if (choice == 2) return AutoAccessories(choice: false);
          if (choice == 3) return AutoAccessoriesInputForm();
          //if (choice == 3) return HeavyVehiclesMain(choice: false);
          if (choice == 4) return HeavyVehiclesInputForm();
          //  if (choice == 4) return BoatsMain(choice: false);
          if (choice == 5) return BoatsInputForm();
          if (choice == 6) return NumberPlateInputForm();
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
                  Text(translator.translate('Motors'),
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
                itemCount: motor.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                    if (index == 5) gotoScreen(5);
                    if (index == 6) gotoScreen(6);
                  },
                  title: Text(motor[index], style: TextStyle(fontSize: 5.w)),
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
