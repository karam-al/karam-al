import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import 'iAmhiring.dart';
import 'jobsWanted.dart';

class JobsMenu extends StatefulWidget {
  @override
  _JobsMenuState createState() => _JobsMenuState();
}

class _JobsMenuState extends State<JobsMenu> {
  double rotate = 0, rotate2 = 0, leadingSize;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  final List forSale = [
    translator.translate("I'm hiring"),
    translator.translate("I want a job"),
  ];

  @override
  Widget build(BuildContext context) {
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
          if (choice == 0) return JobsMenuIamHiring();
          if (choice == 1) return JobsMenuJobsWanted();
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
                  Text(translator.translate('Jobs'),
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
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
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

class JobsMenuIamHiring extends StatefulWidget {
  @override
  _JobsMenuIamHiringState createState() => _JobsMenuIamHiringState();
}

class _JobsMenuIamHiringState extends State<JobsMenuIamHiring> {
  double rotate = 0, rotate2 = 0, leadingSize;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

    List forSale;

  @override
  Widget build(BuildContext context) {
     forSale = [
    translator.translate("Accounting"),
    translator.translate("Architecture & Interior Design"),
    translator.translate("Automotive"),
    translator.translate("Beauty"),
    translator.translate("Business Development"),
    translator.translate("Construction"),
    translator.translate("Customer Service"),
    translator.translate("Education"),
    translator.translate("Engineering"),
    translator.translate("Fashion"),
    translator.translate("Food & Beverages"),
    translator.translate("Graphic Design"),
    translator.translate("Hospitality & Restaurants"),
    translator.translate("HR & Recruitment"),
    translator.translate("Legal Services"),
    translator.translate("Logistics & Distribution"),
    translator.translate("Marketing & Advertising"),
    translator.translate("Media"),
    translator.translate("Medical & Healthcare"),
    translator.translate("Online Media"),
    translator.translate("Real Estate"),
    translator.translate("Retail & Consumer Goods"),
    translator.translate("Safety & Security"),
    translator.translate("Sales"),
    translator.translate("Secretarial"),
    translator.translate("Sports & Fitness"),
    translator.translate("Transportation"),
    translator.translate("Travel & Tourism"),
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
          if (translator.currentLanguage == 'en') {
            if (choice == 0) return IamHiringInput(choiceAPI: 8961);
            if (choice == 1) return IamHiringInput(choiceAPI: 8963);
            if (choice == 2) return IamHiringInput(choiceAPI: 8965);
            if (choice == 3) return IamHiringInput(choiceAPI: 8967);
            if (choice == 4) return IamHiringInput(choiceAPI: 8969);
            if (choice == 5) return IamHiringInput(choiceAPI: 8971);
            if (choice == 6) return IamHiringInput(choiceAPI: 8973);
            if (choice == 7) return IamHiringInput(choiceAPI: 8975);
            if (choice == 8) return IamHiringInput(choiceAPI: 8977);
            if (choice == 9) return IamHiringInput(choiceAPI: 8979);
            if (choice == 10) return IamHiringInput(choiceAPI: 8981);
            if (choice == 11) return IamHiringInput(choiceAPI: 8983);
            if (choice == 12) return IamHiringInput(choiceAPI: 8985);
            if (choice == 13) return IamHiringInput(choiceAPI: 8987);
            if (choice == 14) return IamHiringInput(choiceAPI: 8989);
            if (choice == 15) return IamHiringInput(choiceAPI: 8991);
            if (choice == 16) return IamHiringInput(choiceAPI: 8993);
            if (choice == 17) return IamHiringInput(choiceAPI: 8995);
            if (choice == 18) return IamHiringInput(choiceAPI: 8997);
            if (choice == 19) return IamHiringInput(choiceAPI: 8999);
            if (choice == 20) return IamHiringInput(choiceAPI: 9001);
            if (choice == 21) return IamHiringInput(choiceAPI: 9003);
            if (choice == 22) return IamHiringInput(choiceAPI: 9005);
            if (choice == 23) return IamHiringInput(choiceAPI: 9007);
            if (choice == 24) return IamHiringInput(choiceAPI: 9009);
            if (choice == 25) return IamHiringInput(choiceAPI: 9011);
            if (choice == 26) return IamHiringInput(choiceAPI: 9013);
            if (choice == 27) return IamHiringInput(choiceAPI: 9015);
          }
          if (translator.currentLanguage == 'ar') {
            if (choice == 0) return IamHiringInput(choiceAPI: 9017);
            if (choice == 1) return IamHiringInput(choiceAPI: 9019);
            if (choice == 2) return IamHiringInput(choiceAPI: 8965);
            if (choice == 3) return IamHiringInput(choiceAPI: 9023);
            if (choice == 4) return IamHiringInput(choiceAPI: 9025);
            if (choice == 5) return IamHiringInput(choiceAPI: 9027);
            if (choice == 6) return IamHiringInput(choiceAPI: 9029);
            if (choice == 7) return IamHiringInput(choiceAPI: 9031);
            if (choice == 8) return IamHiringInput(choiceAPI: 9033);
            if (choice == 9) return IamHiringInput(choiceAPI: 9035);
            if (choice == 10) return IamHiringInput(choiceAPI: 9037);
            if (choice == 11) return IamHiringInput(choiceAPI: 9039);
            if (choice == 12) return IamHiringInput(choiceAPI: 9041);
            if (choice == 13) return IamHiringInput(choiceAPI: 9043);
            if (choice == 14) return IamHiringInput(choiceAPI: 9045);
            if (choice == 15) return IamHiringInput(choiceAPI: 9047);
            if (choice == 16) return IamHiringInput(choiceAPI: 9049);
            if (choice == 17) return IamHiringInput(choiceAPI: 9051);
            if (choice == 18) return IamHiringInput(choiceAPI: 9053);
            if (choice == 19) return IamHiringInput(choiceAPI: 9055);
            if (choice == 20) return IamHiringInput(choiceAPI: 9112);
            if (choice == 21) return IamHiringInput(choiceAPI: 9110);
            if (choice == 22) return IamHiringInput(choiceAPI: 9108);
            if (choice == 23) return IamHiringInput(choiceAPI: 9106);
            if (choice == 24) return IamHiringInput(choiceAPI: 9104);
            if (choice == 25) return IamHiringInput(choiceAPI: 9102);
            if (choice == 26) return IamHiringInput(choiceAPI: 9100);
            if (choice == 27) return IamHiringInput(choiceAPI: 9098);
          }
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
                  Text(translator.translate('Jobs'),
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
                itemBuilder: (BuildContext context, int index) => ListTile(
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

class JobsMenuJobsWanted extends StatefulWidget {
  @override
  _JobsMenuJobsWantedState createState() => _JobsMenuJobsWantedState();
}

class _JobsMenuJobsWantedState extends State<JobsMenuJobsWanted> {
  double rotate = 0, rotate2 = 0, leadingSize;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

    List forSale ;

  @override
  Widget build(BuildContext context) {
    forSale = [
    translator.translate("Accounting"),
    translator.translate("Architecture/Eng2"),
    translator.translate("Art/Design2"),
    translator.translate("Bank/Finance2"),
    translator.translate("Business Development"),
    translator.translate("Construction"),
    translator.translate("Consulting2"),
    translator.translate("Education"),
    translator.translate("Executive"),
    translator.translate("Hospitality2"),
    translator.translate("HR/Recruiting2"),
    translator.translate("IT/Telecom2"),
    translator.translate("Marketing/PR2"),
    translator.translate("Media"),
    translator.translate("Medical/Health2"),
    translator.translate("Oil/Gas2"),
    translator.translate("Other"),
    translator.translate("Retail"),
    translator.translate("Sales"),
    translator.translate("Secretaria"),
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
          if (translator.currentLanguage == 'en') {
            if (choice == 0) return JbosWantedInput(choiceAPI: 8881);
            if (choice == 1) return JbosWantedInput(choiceAPI: 8882);
            if (choice == 2) return JbosWantedInput(choiceAPI: 8883);
            if (choice == 3) return JbosWantedInput(choiceAPI: 8884);
            if (choice == 4) return JbosWantedInput(choiceAPI: 8885);
            if (choice == 5) return JbosWantedInput(choiceAPI: 8886);
            if (choice == 6) return JbosWantedInput(choiceAPI: 8887);
            if (choice == 7) return JbosWantedInput(choiceAPI: 8888);
            if (choice == 8) return JbosWantedInput(choiceAPI: 8889);
            if (choice == 9) return JbosWantedInput(choiceAPI: 8890);
            if (choice == 10) return JbosWantedInput(choiceAPI: 8891);
            if (choice == 11) return JbosWantedInput(choiceAPI: 8892);
            if (choice == 12) return JbosWantedInput(choiceAPI: 8893);
            if (choice == 13) return JbosWantedInput(choiceAPI: 8894);
            if (choice == 14) return JbosWantedInput(choiceAPI: 8895);
            if (choice == 15) return JbosWantedInput(choiceAPI: 8896);
            if (choice == 16) return JbosWantedInput(choiceAPI: 8900);
            if (choice == 17) return JbosWantedInput(choiceAPI: 8897);
            if (choice == 18) return JbosWantedInput(choiceAPI: 8898);
            if (choice == 19) return JbosWantedInput(choiceAPI: 8899);
          }
          if (translator.currentLanguage == 'ar') {
            if (choice == 0) return JbosWantedInput(choiceAPI: 8921);
            if (choice == 1) return JbosWantedInput(choiceAPI: 8925);
            if (choice == 2) return JbosWantedInput(choiceAPI: 8923);
            if (choice == 3) return JbosWantedInput(choiceAPI: 8927);
            if (choice == 4) return JbosWantedInput(choiceAPI: 8929);
            if (choice == 5) return JbosWantedInput(choiceAPI: 8931);
            if (choice == 6) return JbosWantedInput(choiceAPI: 8933);
            if (choice == 7) return JbosWantedInput(choiceAPI: 8935);
            if (choice == 8) return JbosWantedInput(choiceAPI: 8937);
            if (choice == 9) return JbosWantedInput(choiceAPI: 8939);
            if (choice == 10) return JbosWantedInput(choiceAPI: 8941);
            if (choice == 11) return JbosWantedInput(choiceAPI: 8943);
            if (choice == 12) return JbosWantedInput(choiceAPI: 8945);
            if (choice == 13) return JbosWantedInput(choiceAPI: 8947);
            if (choice == 14) return JbosWantedInput(choiceAPI: 8949);
            if (choice == 15) return JbosWantedInput(choiceAPI: 8951);
            if (choice == 16) return JbosWantedInput(choiceAPI: 8953);
            if (choice == 17) return JbosWantedInput(choiceAPI: 8955);
            if (choice == 18) return JbosWantedInput(choiceAPI: 8957);
            if (choice == 19) return JbosWantedInput(choiceAPI: 8959);
          }
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
                  Text(translator.translate('Jobs'),
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
                itemBuilder: (BuildContext context, int index) => ListTile(
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
