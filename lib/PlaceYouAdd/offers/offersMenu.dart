import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import 'FashionAndAccessories/ClothingInput.dart';
import 'FashionAndAccessories/offers_accessories.dart';
import 'FashionAndAccessories/offers_jewellery.dart';
import 'FashionAndAccessories/offers_watches.dart';
import 'GetAway/Bungalows.dart';
import 'GetAway/Hotels.dart';
import 'GetAway/Resorts.dart';
import 'GetAway/offers_beaches.dart';
import 'GetAway/offers_camping.dart';
import 'GetAway/offers_chalets.dart';
import 'GetAway/offers_resturant.dart';
import 'GetAway/offers_waterparks.dart';
import 'HealthAndBeauty/Clinic.dart';
import 'HealthAndBeauty/Fitness.dart';
import 'HealthAndBeauty/Salons.dart';
import 'HealthAndBeauty/Spa.dart';
import 'Products/offers.camping_outdoor.dart';
import 'Products/offers_baby_toys.dart';
import 'Products/offers_game.dart';
import 'Products/offers_health_beauty.dart';
import 'Products/offers_home_kitchen.dart';
import 'Products/offers_organic.dart';
import 'Products/offers_phone_tap.dart';
import 'Products/offers_sport_fitness.dart';

class OffersMenuInput extends StatefulWidget {
  @override
  _OffersMenuInputState createState() => _OffersMenuInputState();
}

class _OffersMenuInputState extends State<OffersMenuInput> {
  double rotate = 0, rotate2 = 0, leadingSize;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  List offers;

  @override
  Widget build(BuildContext context) {
    offers = [
      translator.translate("Getaway"),
      translator.translate("Products"),
      translator.translate("Health and Beauty"),
      translator.translate("Fashion and Accessories"),
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
          return OffersMenuInput2(
            index: choice,
          );
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
                  Text(translator.translate('Offers'),
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
                itemCount: offers.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                  },
                  title: Text(offers[index], style: TextStyle(fontSize: 5.w)),
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

class OffersMenuInput2 extends StatefulWidget {
  final int index;
  OffersMenuInput2({@required this.index});
  @override
  _OffersMenuInput2State createState() => _OffersMenuInput2State();
}

class _OffersMenuInput2State extends State<OffersMenuInput2> {
  double rotate = 0, rotate2 = 0, leadingSize;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  List menu;

  @override
  Widget build(BuildContext context) {
    if (widget.index == 0)
      menu = [
        translator.translate("Restaurants"),
        translator.translate("Chalets"),
        translator.translate("Bungalows"),
        translator.translate("Hotels"),
        translator.translate("Beaches"),
        translator.translate("Waterparks"),
        translator.translate("Resorts"),
        translator.translate("Camping"),
      ];
    if (widget.index == 1)
      menu = [
        translator.translate("Home and Kitchen"),
        translator.translate("Sport and Fitness"),
        translator.translate("Games"),
        translator.translate("Phone, Tab, PC"),
        translator.translate("Organic Products"),
        translator.translate("Camping and Outdoor"),
        translator.translate("Health and Beauty"),
        translator.translate("Baby Accs and Toys"),
      ];
    if (widget.index == 2)
      menu = [
        translator.translate("Salons"),
        translator.translate("Fitness"),
        translator.translate("SPA"),
        translator.translate("Clinic"),
      ];
    if (widget.index == 3)
      menu = [
        translator.translate("Women's Clothing"),
        translator.translate("Watches"),
        translator.translate("Men's Clothing"),
        translator.translate("Accessories"),
        translator.translate("Kids Clothing"),
        translator.translate("Jewellery"),
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
          if (widget.index == 0 && choice == 0) return OffersGetaAwayResturnInput();
          if (widget.index == 0 && choice == 1) return OffersGetaAwayChaletsInput();
          if (widget.index == 0 && choice == 2) return BungalowsInput();
          if (widget.index == 0 && choice == 3) return GetaawayHotels();
          if (widget.index == 0 && choice == 4) return OffersGetaAwayBeachesInput();
          if (widget.index == 0 && choice == 5) return OffersGetaAwayWaterparksInput();
          if (widget.index == 0 && choice == 6) return ResortsInput();
          if (widget.index == 0 && choice == 7) return OffersGetaAwayCampingInput();
          if (widget.index == 1 && choice == 0) return OffersProductsHomeKitchenInput();
          if (widget.index == 1 && choice == 1) return OffersProductsSportFitnessInput();
          if (widget.index == 1 && choice == 2) return OffersProductsGameInput();
          if (widget.index == 1 && choice == 3) return OffersProductsPhoneTabPCInput();
          if (widget.index == 1 && choice == 4) return OffersProductsOrganicInput();
          if (widget.index == 1 && choice == 5) return OffersProductsCampingOutdoorInput();
          if (widget.index == 1 && choice == 6) return OffersProductsHealthBeautyInput();
          if (widget.index == 1 && choice == 7) return OffersProductsBabyToysInput();
          if (widget.index == 2 && choice == 0) return SalonsInput();
          if (widget.index == 2 && choice == 2) return SpaInput();
          if (widget.index == 2 && choice == 1) return FitnessInput();
          if (widget.index == 2 && choice == 3) return ClinicInput();
          if (widget.index == 3 && choice == 0)
            return ClothingInput(
              choice: 1,
              name: "Add Women's Clothing",
            );
          if (widget.index == 3 && choice == 2)
            return ClothingInput(choice: 2, name: "Add Men's Clothing");
          if (widget.index == 3 && choice == 4)
            return ClothingInput(choice: 3, name: "Add Kids Clothing");
            if (widget.index == 3 && choice == 1)
            return OffersFashionAccessoriesWatchesInput();
            if (widget.index == 3 && choice == 3)
            return OffersFashionAccessoriesAccessoriesInput();
            if (widget.index == 3 && choice == 5)
            return OffersFashionAccessoriesJewelleryInput();
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
                  Text(translator.translate('Offers'),
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
                itemCount: menu.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (widget.index == 0) {
                      if (index == 0) gotoScreen(0);
                      if (index == 1) gotoScreen(1);
                      if (index == 2) gotoScreen(2);
                      if (index == 3) gotoScreen(3);
                      if (index == 4) gotoScreen(4);
                      if (index == 5) gotoScreen(5);
                      if (index == 6) gotoScreen(6);
                      if (index == 7) gotoScreen(7);
                    }

                    if (widget.index == 1) {
                      if (index == 0) gotoScreen(0);
                      if (index == 1) gotoScreen(1);
                      if (index == 2) gotoScreen(2);
                      if (index == 3) gotoScreen(3);
                      if (index == 4) gotoScreen(4);
                      if (index == 5) gotoScreen(5);
                      if (index == 6) gotoScreen(6);
                      if (index == 7) gotoScreen(7);
                    }

                    if (widget.index == 2) {
                      if (index == 0) gotoScreen(0);
                      if (index == 1) gotoScreen(1);
                      if (index == 2) gotoScreen(2);
                      if (index == 3) gotoScreen(3);
                    }
                    if (widget.index == 3) {
                      if (index == 0) gotoScreen(0);
                      if (index == 1) gotoScreen(1);
                      if (index == 2) gotoScreen(2);
                      if (index == 3) gotoScreen(3);
                      if (index == 4) gotoScreen(4);
                      if (index == 5) gotoScreen(5);
                    }
                  },
                  title: Text(menu[index], style: TextStyle(fontSize: 5.w)),
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
