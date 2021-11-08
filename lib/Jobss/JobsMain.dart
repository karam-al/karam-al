/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import 'Jobs.dart';

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
    isEnglish = false;
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
    print("tex$text1");
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
                  CupertinoIcons.person_crop_circle_fill_badge_exclam,
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

          /*  SizedBox(height: 20.w),
            Text(translator.translate("Please Choose"),
                style: new TextStyle(
                    fontSize: 6.w,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
            Padding(
           padding: EdgeInsets.only(top: 5.w),
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            //   return Jobs();
                            return JobesInerMain();
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
                            return JobesInerMain();
                          }),
                        );
                      },
                      child: details(translator.translate("jobsWanted2"))),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

double rotate = 0, rotate2 = 0;

class JobesInerMain extends StatelessWidget {
  static var jobsModels;
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
    jobsModels = [
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
    ];

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
                    // if (index == 82) gotoScreen(82);

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        /*  if (choice == 82)
            return CarsModels(
                choice: true, car:  , index: 82, carModel: "W Motors");
          else*/
                        return Jobs();
                      }),
                    );
                  },
                  title:
                      Text(jobsModels[index], style: TextStyle(fontSize: 17)),
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