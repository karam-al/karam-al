/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart'; 
import 'package:sizer/sizer.dart'; 
import '../MotorsMain/CarsModels.dart';

double rotate = 0, rotate2 = 0, leadingSize = 0;

 
class JobsMainn extends StatefulWidget {
  static var carsModels; 

  @override
  _JobsMainnState createState() => _JobsMainnState();
}

class _JobsMainnState extends State<JobsMainn> {
  @override
    void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }
  Widget build(BuildContext context) {
     if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    
   List jobs = [
      translator.translate("Accounting"),
      translator.translate("Architecture & Interior Design"),
      translator.translate("Automotive"),
      translator.translate("Beauty"),
      translator.translate("Business Development"),
      translator.translate("Construction2"),
      translator.translate("Customer Service"),
      translator.translate("Education2"),
      translator.translate("Engineering"),
      translator.translate("Fashion"),
      translator.translate("Food & Beverages"),
      translator.translate("Graphic Design"),
      translator.translate("Hospitality & Restaurants"),
      translator.translate("HR & Recruitment"),
      translator.translate("Industrial & Manufacturing"),
      translator.translate("Information Technology"),
      translator.translate("Internet"),
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
    //  translator.translate("Jobs Wanted"),
    //  translator.translate("I am a Recruiter"),
    ];
 

    gotoScreen(int choice, String s) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          if (choice == 0)
          {

          }
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: acura,
                index: 0,
                carModel: s); 
          else
            return Container(); 
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
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text("${translator.translate("choose_the_category2")}",
                      style: new TextStyle(
                          fontSize: 5.w, color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                            "... >${translator.translate('Motors')}> ${translator.translate('All')}",
                            style: new TextStyle(
                                fontSize: 3.5.w, color: Colors.grey[800])),
                      ),
                    ],
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
                itemCount: JobsMainn.carsModels.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0, JobsMainn.carsModels[index]);
                    if (index == 1) gotoScreen(1, JobsMainn.carsModels[index]);
                    if (index == 2) gotoScreen(2, JobsMainn.carsModels[index]);
                    if (index == 3) gotoScreen(3, JobsMainn.carsModels[index]);
                    if (index == 4) gotoScreen(4, JobsMainn.carsModels[index]);
                    if (index == 5) gotoScreen(5, JobsMainn.carsModels[index]);
                    if (index == 6) gotoScreen(6, JobsMainn.carsModels[index]);
                    if (index == 7) gotoScreen(7, JobsMainn.carsModels[index]);
                    if (index == 8) gotoScreen(8, JobsMainn.carsModels[index]);
                    if (index == 9) gotoScreen(9, JobsMainn.carsModels[index]);
                    if (index == 10) gotoScreen(10, JobsMainn.carsModels[index]);
                    if (index == 11) gotoScreen(11, JobsMainn.carsModels[index]);
                    if (index == 12) gotoScreen(12, JobsMainn.carsModels[index]);
                    if (index == 13) gotoScreen(13, JobsMainn.carsModels[index]);
                    if (index == 14) gotoScreen(14, JobsMainn.carsModels[index]);
                    if (index == 15) gotoScreen(15, JobsMainn.carsModels[index]);
                    if (index == 16) gotoScreen(16, JobsMainn.carsModels[index]);
                    if (index == 17) gotoScreen(17, JobsMainn.carsModels[index]);
                    if (index == 18) gotoScreen(18, JobsMainn.carsModels[index]);
                    if (index == 19) gotoScreen(19, JobsMainn.carsModels[index]);
                    if (index == 20) gotoScreen(20, JobsMainn.carsModels[index]);
                    if (index == 21) gotoScreen(21, JobsMainn.carsModels[index]);
                    if (index == 22) gotoScreen(22, JobsMainn.carsModels[index]);
                    if (index == 23) gotoScreen(23, JobsMainn.carsModels[index]);
                    if (index == 24) gotoScreen(24, JobsMainn.carsModels[index]);
                    if (index == 25) gotoScreen(25, JobsMainn.carsModels[index]);
                    if (index == 26) gotoScreen(26, JobsMainn.carsModels[index]);
                    if (index == 27) gotoScreen(27, JobsMainn.carsModels[index]);
                    if (index == 28) gotoScreen(28, JobsMainn.carsModels[index]);
                    if (index == 29) gotoScreen(29, JobsMainn.carsModels[index]);
                    if (index == 30) gotoScreen(30, JobsMainn.carsModels[index]);
                    if (index == 31) gotoScreen(31, JobsMainn.carsModels[index]);
                    if (index == 32) gotoScreen(32, JobsMainn.carsModels[index]);
                    if (index == 33) gotoScreen(33, JobsMainn.carsModels[index]);
                    if (index == 34) gotoScreen(34, JobsMainn.carsModels[index]);
                    if (index == 35) gotoScreen(35, JobsMainn.carsModels[index]);
                    if (index == 36) gotoScreen(36, JobsMainn.carsModels[index]);
                    if (index == 37) gotoScreen(37, JobsMainn.carsModels[index]);
                    if (index == 38) gotoScreen(38, JobsMainn.carsModels[index]);
                    if (index == 39) gotoScreen(39, JobsMainn.carsModels[index]);
                    if (index == 40) gotoScreen(40, JobsMainn.carsModels[index]);
                    if (index == 41) gotoScreen(41, JobsMainn.carsModels[index]);
                    if (index == 42) gotoScreen(42, JobsMainn.carsModels[index]);
                    if (index == 43) gotoScreen(43, JobsMainn.carsModels[index]);
                    if (index == 44) gotoScreen(44, JobsMainn.carsModels[index]);
                    if (index == 45) gotoScreen(45, JobsMainn.carsModels[index]);
                    if (index == 46) gotoScreen(46, JobsMainn.carsModels[index]);
                    if (index == 47) gotoScreen(47, JobsMainn.carsModels[index]);
                    if (index == 48) gotoScreen(48, JobsMainn.carsModels[index]);
                    if (index == 49) gotoScreen(49, JobsMainn.carsModels[index]);
                    if (index == 50) gotoScreen(50, JobsMainn.carsModels[index]);
                    if (index == 51) gotoScreen(51, JobsMainn.carsModels[index]);
                    if (index == 52) gotoScreen(52, JobsMainn.carsModels[index]);
                    if (index == 53) gotoScreen(53, JobsMainn.carsModels[index]);
                    if (index == 54) gotoScreen(54, JobsMainn.carsModels[index]);
                    if (index == 55) gotoScreen(55, JobsMainn.carsModels[index]);
                    if (index == 56) gotoScreen(56, JobsMainn.carsModels[index]);
                    if (index == 57) gotoScreen(57, JobsMainn.carsModels[index]);
                    if (index == 58) gotoScreen(58, JobsMainn.carsModels[index]);
                    if (index == 59) gotoScreen(59, JobsMainn.carsModels[index]);
                    if (index == 60) gotoScreen(60, JobsMainn.carsModels[index]);
                    if (index == 61) gotoScreen(61, JobsMainn.carsModels[index]);
                    if (index == 62) gotoScreen(62, JobsMainn.carsModels[index]);
                    if (index == 63) gotoScreen(63, JobsMainn.carsModels[index]);
                    if (index == 64) gotoScreen(64, JobsMainn.carsModels[index]);
                    if (index == 65) gotoScreen(65, JobsMainn.carsModels[index]);
                    if (index == 66) gotoScreen(66, JobsMainn.carsModels[index]);
                    if (index == 67) gotoScreen(67, JobsMainn.carsModels[index]);
                    if (index == 68) gotoScreen(68, JobsMainn.carsModels[index]);
                    if (index == 69) gotoScreen(69, JobsMainn.carsModels[index]);
                    if (index == 70) gotoScreen(70, JobsMainn.carsModels[index]);
                    if (index == 71) gotoScreen(71, JobsMainn.carsModels[index]);
                    if (index == 72) gotoScreen(72, JobsMainn.carsModels[index]);
                    if (index == 73) gotoScreen(73, JobsMainn.carsModels[index]);
                    if (index == 74) gotoScreen(74, JobsMainn.carsModels[index]);
                    if (index == 75) gotoScreen(75, JobsMainn.carsModels[index]);
                    if (index == 76) gotoScreen(76, JobsMainn.carsModels[index]);
                    if (index == 77) gotoScreen(77, JobsMainn.carsModels[index]);
                    if (index == 78) gotoScreen(78, JobsMainn.carsModels[index]);
                    if (index == 79) gotoScreen(79, JobsMainn.carsModels[index]);
                    if (index == 80) gotoScreen(80, JobsMainn.carsModels[index]);
                    if (index == 81) gotoScreen(81, JobsMainn.carsModels[index]);
                    if (index == 82) gotoScreen(82, JobsMainn.carsModels[index]);
                  },
                  title:
                      Text(JobsMainn.carsModels[index], style: TextStyle(fontSize: 5.w)),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'JobsWanted.dart';
import 'JobsIAmHiring.dart';

class JobsMain extends StatefulWidget {
  // final String message;
  //final int choice;
  //Test2({@required this.message, @required this.choice});
  @override
  _JobsMainState createState() => _JobsMainState();
}

class _JobsMainState extends State<JobsMain> {
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  double leadingSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: JobType(),
    );
  }
}

// ignore: must_be_immutable
class JobType extends StatefulWidget {
  @override
  _JobTypeState createState() => _JobTypeState();
}

class _JobTypeState extends State<JobType> {
  BuildContext context;

  Widget details(String text1) {
    return Center(
      child: SizedBox(
        height: 25.w,
        width: 70.w,
        child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            elevation: 2,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (text1 == "Jobs" || text1 == "الوظائف")
                Icon(
                  CupertinoIcons.person_badge_plus,
                  color: Colors.orange,
                  size: 15.w,
                ),
              if (text1 == "Jobs Wanted" || text1 == "الوظائف المطلوبة")
                Icon(
                  CupertinoIcons.person_badge_plus,
                  color: Colors.orange,
                  size: 15.w,
                ),
              SizedBox(width: 4.w),
              Text(text1,
                  style: TextStyle(fontSize: 6.w, color: Colors.black45)),
            ])),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.w),
            Text(translator.translate("Please Choose"),
                style: new TextStyle(
                    fontSize: 6.w,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            Padding(
              padding: EdgeInsets.only(top: 15.w),
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            //   return Jobs();
                            return JobesInerMain(choice: 1);
                          }),
                        );
                      },
                      child: details(translator.translate("jobs2"))),
                  SizedBox(height: 7.w),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            //   return Jobs();
                            return JobesInerMain(choice: 2);
                          }),
                        );
                      },
                      child: details(translator.translate("jobsWanted2"))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double rotate = 0, rotate2 = 0;

class JobesInerMain extends StatefulWidget {
  // final String message;
  final int choice;
  JobesInerMain({@required this.choice});
  @override
  _JobesInerMainState createState() => _JobesInerMainState();
}

double leadingSize = 0;

class _JobesInerMainState extends State<JobesInerMain> {
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  int api = 0;
  static var jobsModels;
  @override
  Widget build(BuildContext context) {
    gotoScreen(int choice, String title) {
      if (widget.choice == 1) {
        if (translator.currentLanguage == 'en') {
          if (choice == 0) api = 8961;
          if (choice == 1) api = 8963;
          if (choice == 2) api = 8965;
          if (choice == 3) api = 8967;
          if (choice == 4) api = 8969;
          if (choice == 5) api = 8971;
          if (choice == 6) api = 8973;
          if (choice == 7) api = 8975;
          if (choice == 8) api = 8977;
          if (choice == 9) api = 8979;
          if (choice == 10) api = 8981;
          if (choice == 11) api = 8983;
          if (choice == 12) api = 8985;
          if (choice == 13) api = 8987;
          if (choice == 14) api = 8989;
          if (choice == 15) api = 8991;
          if (choice == 16) api = 8993;
          if (choice == 17) api = 8995;
          if (choice == 18) api = 8997;
          if (choice == 19) api = 8999;
          if (choice == 20) api = 9001;
          if (choice == 21) api = 9003;
          if (choice == 22) api = 9005;
          if (choice == 23) api = 9007;
          if (choice == 24) api = 9009;
          if (choice == 25) api = 9011;
          if (choice == 26) api = 9013;
          if (choice == 27) api = 9015;
        }
        if (translator.currentLanguage == 'ar') {
          if (choice == 0) api = 9017;
          if (choice == 1) api = 9019;
          if (choice == 2) api = 8965;
          if (choice == 3) api = 9023;
          if (choice == 4) api = 9025;
          if (choice == 5) api = 9027;
          if (choice == 6) api = 9029;
          if (choice == 7) api = 9031;
          if (choice == 8) api = 9033;
          if (choice == 9) api = 9035;
          if (choice == 10) api = 9037;
          if (choice == 11) api = 9039;
          if (choice == 12) api = 9041;
          if (choice == 13) api = 9043;
          if (choice == 14) api = 9045;
          if (choice == 15) api = 9047;
          if (choice == 16) api = 9049;
          if (choice == 17) api = 9051;
          if (choice == 18) api = 9053;
          if (choice == 19) api = 9055;
          if (choice == 20) api = 9112;
          if (choice == 21) api = 9110;
          if (choice == 22) api = 9108;
          if (choice == 23) api = 9106;
          if (choice == 24) api = 9104;
          if (choice == 25) api = 9102;
          if (choice == 26) api = 9100;
          if (choice == 27) api = 9098;
        }
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return JobsIamHiring(jobType: title, api: api);
          }),
        );
      }
      if (widget.choice == 2) {
        if (translator.currentLanguage == 'en') {
          if (choice == 0) api = 8881;
          if (choice == 1) api = 8882;
          if (choice == 2) api = 8883;
          if (choice == 3) api = 8884;
          if (choice == 4) api = 8885;
          if (choice == 5) api = 8886;
          if (choice == 6) api = 8887;
          if (choice == 7) api = 8888;
          if (choice == 8) api = 8889;
          if (choice == 9) api = 8890;
          if (choice == 10) api = 8891;
          if (choice == 11) api = 8892;
          if (choice == 12) api = 8893;
          if (choice == 13) api = 8894;
          if (choice == 14) api = 8895;
          if (choice == 15) api = 8896;
          if (choice == 16) api = 8900;
          if (choice == 17) api = 8897;
          if (choice == 18) api = 8898;
          if (choice == 19) api = 8899;
        }
        if (translator.currentLanguage == 'ar') {
          if (choice == 0) api = 8921;
          if (choice == 1) api = 8925;
          if (choice == 2) api = 8923;
          if (choice == 3) api = 8927;
          if (choice == 4) api = 8929;
          if (choice == 5) api = 8931;
          if (choice == 6) api = 8933;
          if (choice == 7) api = 8935;
          if (choice == 8) api = 8937;
          if (choice == 9) api = 8939;
          if (choice == 10) api = 8941;
          if (choice == 11) api = 8943;
          if (choice == 12) api = 8945;
          if (choice == 13) api = 8947;
          if (choice == 14) api = 8949;
          if (choice == 15) api = 8951;
          if (choice == 16) api = 8953;
          if (choice == 17) api = 8955;
          if (choice == 18) api = 8957;
          if (choice == 19) api = 8959;
        }
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return JobsWanted(jobType: title, api: api);
          }),
        );
      }
    }

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    if (widget.choice == 1) {
      jobsModels = [
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
    }

    if (widget.choice == 2) {
      jobsModels = [
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
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text("${translator.translate("choose_the_category2")}",
                      style: new TextStyle(
                          fontSize: 5.w,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 3.w),
                      SizedBox(
                        child: Text("... > ${translator.translate('Jobs')}",
                            style: new TextStyle(
                                fontSize: 3.5.w,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800])),
                      ),
                    ],
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
                itemCount: jobsModels.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    gotoScreen(index, jobsModels[index]);
                  },
                  title:
                      Text(jobsModels[index], style: TextStyle(fontSize: 5.w)),
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
