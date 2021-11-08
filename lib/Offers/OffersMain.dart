 

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/Offers/Offers.dart';
import 'package:sizer/sizer.dart';

double rotate = 0, rotate2 = 0;

class OffersMain extends StatefulWidget {
  final List<String> offerList;

  //Test2({@required this.message, @required this.choice});
  //NameViewList({List<String> names}) : this.names = names ?? [];

  OffersMain({@required this.offerList});

  @override
  _OffersMainState createState() => _OffersMainState();
}

class _OffersMainState extends State<OffersMain> {
  double rotate = 0, rotate2 = 0, leadingSize;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

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
    gotoScreen(String carModel, int index) {
      Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          return OfferMainInner(
              choice: carModel,
              title: "Offers",
              index: index, );
        }),
      );
    }

    return Scaffold(
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("choose_the_category2")}",
                style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
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
                itemCount: widget.offerList.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    gotoScreen(widget.offerList[index], index);
                  },
                  title: Text(widget.offerList[index],
                      style: TextStyle(fontSize: 5.w)),
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

class OfferMainInner extends StatefulWidget {
  final String choice;
  final String title;
  final int index; 
  //Test2({@required this.message, @required this.choice});
  //NameViewList({List<String> names}) : this.names = names ?? [];

  OfferMainInner(
      {@required this.choice,
      @required this.title,
      @required this.index });

  @override
  _OfferMainInnerState createState() => _OfferMainInnerState();
}

class _OfferMainInnerState extends State<OfferMainInner> {
  double rotate = 0, rotate2 = 0, leadingSize;
  int api;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  List<String> array;
  @override
  Widget build(BuildContext context) {
    if (widget.index == 0)
      array = [
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
      array = [
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
      array = [
        translator.translate("Salons"),
        translator.translate("Fitness"),
        translator.translate("SPA"),
        translator.translate("Clinic"),
      ];
    if (widget.index == 3)
      array = [
        translator.translate("Women's Clothing"),
        translator.translate("Watches"),
        translator.translate("Men's Clothing"),
        translator.translate("Accessories"),
        translator.translate("Kids Clothing"),
        translator.translate("Jewellery"),
      ];

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    gotoScreen(String car , int _index) { 
        if (widget.index == 0) {
          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 8658; //"Restaurants"
            if (_index == 1) api = 8664; //"Chalets"
            if (_index == 2) api = 8670; //"Bungalows"
            if (_index == 3) api = 8660; //"Hotels"
            if (_index == 4) api = 8666; //"Beaches"
            if (_index == 5) api = 8672; //"Waterparks"
            if (_index == 6) api = 8662; //"Resorts"
            if (_index == 7) api = 8668; //"Camping"
          }

          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 8674; //"Restaurants"
            if (_index == 1) api = 8680; //"Chalets"
            if (_index == 2) api = 8684; //"Bungalows"
            if (_index == 3) api = 8678; //"Hotels"
            if (_index == 4) api = 8686; //"Beaches"
            if (_index == 5) api = 8688; //"Waterparks"
            if (_index == 6) api = 8676; //"Resorts"
            if (_index == 7) api = 8682; //"Camping"
          }
        }
        if (widget.index == 1) {
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 8746; //"Home and Kitchen"
            if (_index == 1) api = 8752; //"Sport and Fitness"
            if (_index == 2) api = 8758; //"Games"
            if (_index == 3) api = 8748; //"Phone, Tab, PC"
            if (_index == 4) api = 8754; //"Organic Products"
            if (_index == 5) api = 8760; //"Camping and Outdoor"
            if (_index == 6) api = 8750; //"Health and Beauty"
            if (_index == 7) api = 8756; //"Baby Accs and Toys"
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 8730; //"Home and Kitchen"
            if (_index == 1) api = 8736; //"Sport and Fitness"
            if (_index == 2) api = 8742; //"Games"
            if (_index == 3) api = 8732; //"Phone, Tab, PC"
            if (_index == 4) api = 8738; //"Organic Products"
            if (_index == 5) api = 8744; //"Camping and Outdoor"
            if (_index == 6) api = 8734; //"Health and Beauty"
            if (_index == 7) api = 8740; //"Baby Accs and Toys"
          }
        }
        if (widget.index == 2) {
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 8702; //"Salons"),
            if (_index == 1) api = 8700; //"Fitness"),
            if (_index == 2) api = 8704; //"SPA"),
            if (_index == 3) api = 8698; //"Clinic"),
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 8690; //"Salons"),
            if (_index == 1) api = 8694; //"Fitness"),
            if (_index == 2) api = 8692; //"SPA"),
            if (_index == 3) api = 8696; //"Clinic"),
          }
        }
        if (widget.index == 3) {
          if (translator.currentLanguage == 'ar') {
            if (_index == 0) api = 8714; //"Women's Clothing"),
            if (_index == 1) api = 8716; //"Watches"),
            if (_index == 2) api = 8718; //"Men's Clothing"),
            if (_index == 3) api = 8728; //"Accessories"),
            if (_index == 4) api = 8720; //"Kids Clothing"),
            if (_index == 5) api = 8726; //"Jewellery"),
          }

          if (translator.currentLanguage == 'en') {
            if (_index == 0) api = 8706; //"Women's Clothing"),
            if (_index == 1) api = 8712; //"Watches"),
            if (_index == 2) api = 8708; //"Men's Clothing"),
            if (_index == 3) api = 8722; //"Accessories"),
            if (_index == 4) api = 8710; //"Kids Clothing"),
            if (_index == 5) api = 8724; //"Jewellery"),
          }
        } 
      Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
        return  Offers(api: api, carModel: car);
        }),
      );
    }

    return Scaffold(
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text("${translator.translate("choose_the_category2")}",
                style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              children: [
                Text(
                    //  "... > ${translator.translate('${widget.title}')} > ${translator.translate('${widget.choice}')} > ${translator.translate('${widget.carModel}')}  ",
                    "... > ${translator.translate('${widget.title}')} > ${translator.translate('${widget.choice}')} ",
                    style: new TextStyle(
                        fontSize: 3.5.w, color: Colors.grey[800])),
              ],
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
                itemCount: array.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    gotoScreen( widget.choice,  index); 
                  },
                  title: Text(array[index], style: TextStyle(fontSize: 5.w)),
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
