import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'Classifieds/ClassifiedsMain.dart';
import 'Community/CommunityMain.dart';
import 'Furniture/FurnitureMain.dart';
import 'Jobss/JobsMainn.dart';
import 'Mobile Phones/MobilePhonesMain.dart';
import 'MotorsMain/MotorsMain.dart';
import 'Offers/OffersMain.dart';
import 'PropertyForRent/PropertyMain.dart';
import 'itemPage/BuyItemPage.dart';
import 'my_flutter_app_icons.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> propertyForRent, propertyForSale, offers;

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<String> model = ['English', 'العربية'];
  double paddding5 = 0;

  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    /* propertyForRent = [
      translator.translate("Apartment/Flat for Rent"),
      translator.translate("Villa/House for Rent"),
      translator.translate("Rooms for rent"),
      translator.translate("Short Term (Monthly)"),
      translator.translate("Short Term (Daily)"),
      translator.translate("Townhouse"),
      translator.translate("Penthouse"),
      translator.translate("Residential Building2"),
      translator.translate("Villa Compound2"),
      translator.translate("Residential Floor"),
      translator.translate("Residential Plot"),
    ];*/
    offers = [
      translator.translate("Getaway"),
      translator.translate("Products"),
      translator.translate("Health and Beauty"),
      translator.translate("Fashion and Accessories"),
    ];
    propertyForRent = [
      translator.translate('Residential Units for Rent'),
      translator.translate('Short Term (Monthly)'),
      translator.translate('Short Term (Daily)'),
      translator.translate('Rooms For Rent (Flat Mates)'),
      translator.translate('Commercial For Rent'),
    ];

    /* propertyForSale = [
      translator.translate("Apartment for Sale"),
      translator.translate("Villa/House for Sale"),
      translator.translate("Land for Sale"),
      translator.translate("Multiple Units for Sale"),
      translator.translate("Townhouse"),
      translator.translate("Penthouse"),
      translator.translate("Residential Building"),
      translator.translate("Residential Floor"),
      translator.translate("Villa Compound2"),
    ];*/
    propertyForSale = [
      translator.translate('Land for Sale'),
      translator.translate('Multiple Units for Sale'),
      translator.translate('Commercial for Sale'),
      translator.translate('Residential Building2'),
    ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      paddding5 = 13.w;
    }
    const PrimaryColor = const Color(0xFFFFB74D);
    super.build(context);
    return Scaffold(
      //  backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: paddding5,
        backgroundColor: PrimaryColor,
        //  title: Image.asset('asset/oxydu.png', fit: BoxFit.contain,width : 50,height: 50,),
        title: Image.asset(
          'asset/oxyduu.png',
          fit: BoxFit.contain,
          width: 20.w,
          height: 20.w,
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
              padding: translator.currentLanguage == 'en'
                  ? EdgeInsets.only(right: 1.w)
                  : EdgeInsets.only(left: 1.w),
              onSelected: (item) => onSelected(context, item),
              icon: Icon(Icons.language, size: 6.w),
              itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        "English",
                        style: TextStyle(
                            fontSize: SizerUtil.deviceType == DeviceType.mobile
                                ? 5.w
                                : 4.5.w),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text(
                        "العربية",
                        style: TextStyle(
                            fontSize: SizerUtil.deviceType == DeviceType.mobile
                                ? 5.w
                                : 4.5.w),
                      ),
                    )
                  ]),
          SizerUtil.deviceType == DeviceType.tablet
              ? SizedBox(width: 30)
              : SizedBox(),
        ],
      ),
      // debugShowCheckedModeBanner: false,
      body: DashBoard(),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        translator.setNewLanguage(context,
            newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'en',
            restart: true);
        break;
      case 1:
        translator.setNewLanguage(context,
            newLanguage: translator.currentLanguage == 'en' ? 'ar' : 'ar',
            restart: true);
        break;
    }
  }
}

// ignore: must_be_immutable
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with AutomaticKeepAliveClientMixin {
  bool flaag = false, flaag2 = false;

  bool flaag3 = false;

  double padding = 0;

  double rotateb = 0,
      rotatec = 0,
      rotated = 0,
      rotateE = 0,
      rotateF = 0,
      rotateG = 0,
      rotateH = 0,
      rotateI = 0,
      iconSize = 0,
      textSize = 0;

  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    super.build(context);
    if (translator.currentLanguage == 'en') {
      padding = 10;
    }
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      iconSize = 7.w;
      // rotateI= MediaQuery.of(context).size.height * 0.04;
      rotateI = 8.w;
      //  rotateb = 180;
      //  rotatec = 175;rotateH
      rotateH = 18;
      // rotated = MediaQuery.of(context).size.height * 0.8;
      rotated = 80.w;
      /*  translator.currentLanguage == 'en'
          ? rotatec = MediaQuery.of(context).size.width * 0.52
          : rotatec = MediaQuery.of(context).size.width * 0.665;*/
      translator.currentLanguage == 'en' ? rotatec = 52.w : rotatec = 66.5.w;
      /*  translator.currentLanguage == 'en'
          ? rotateE = 0
          : rotateE = MediaQuery.of(context).size.width * 0.08;*/
      translator.currentLanguage == 'en' ? rotateE = 0 : rotateE = 8.w;
      /*  translator.currentLanguage == 'en'
          ? rotateF = MediaQuery.of(context).size.width * 0.03
          : rotateF = MediaQuery.of(context).size.width * 0.04;*/
      translator.currentLanguage == 'en' ? rotateF = 3.w : rotateF = 4.w;

      /*  translator.currentLanguage == 'en'
          ? rotateG = MediaQuery.of(context).size.width * 0.50
          : rotateG = MediaQuery.of(context).size.width * 0.551;*/
      translator.currentLanguage == 'en' ? rotateG = 50.5.w : rotateG = 55.1.w;

      /*translator.currentLanguage == 'en'
          ? rotateb = MediaQuery.of(context).size.width * 0.53
          : rotateb = MediaQuery.of(context).size.width * 0.555;*/
      translator.currentLanguage == 'en' ? rotateb = 53.w : rotateb = 55.5.w;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      iconSize = 35;
      //  rotateb = 405;
      //  rotatec = 400; c b g
      // rotated = 780;
      // rotateE = MediaQuery.of(context).size.width * 0.08;
      //rotateI= MediaQuery.of(context).size.height * 0.0975;
      rotateI = 6.h;
      //    rotated = MediaQuery.of(context).size.height * 1.3;
      rotated = 85.h;
      /* translator.currentLanguage == 'en'
          ? rotatec = MediaQuery.of(context).size.width * 0.6954
          : rotatec = MediaQuery.of(context).size.width * 0.73;*/

      translator.currentLanguage == 'en' ? rotatec = 113.w : rotatec = 114.w;

      translator.currentLanguage == 'en'
          ? rotateE = 0
          : rotateE = MediaQuery.of(context).size.width * 0.08;
      translator.currentLanguage == 'en'
          ? rotateF = MediaQuery.of(context).size.width * 0.03
          : rotateF = MediaQuery.of(context).size.width * 0.04;

      /*  translator.currentLanguage == 'en'
          ? rotateG = MediaQuery.of(context).size.width * 0.68
          : rotateG = MediaQuery.of(context).size.width * 0.66;*/
      translator.currentLanguage == 'en' ? rotateG = 110.w : rotateG = 100.w;

      /*translator.currentLanguage == 'en'
          ? rotateb = MediaQuery.of(context).size.width * 0.697
          : rotateb = MediaQuery.of(context).size.width * 0.663;*/
      translator.currentLanguage == 'en'
          ? rotateb = 113.w
          : rotateb = MediaQuery.of(context).size.width * 0.663;
    }
    /* return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.orange,
      ),*/
    /* return Scaffold(
      body:*/
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _carousel(),
            SizedBox(
              height: rotated,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.h),
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

                      /*createGridItem(2, translator.translate('Mobile Phones'),
                          "", false, true, false, false),
                      createGridItem(3, translator.translate('Furniture'), "",
                          false, true, false, false),
                      createGridItem(4, translator.translate('Classifieds'), "",
                          false, true, false, false),
                      createGridItem(5, translator.translate('Community '), "",
                          false, true, false, false),
                      createGridItem(6, translator.translate('Home '), "",
                          false, true, false, false),
                      createGridItem(7, translator.translate('Business '), "",
                          false, true, false, false),*/
                      createGridItem(8, translator.translate('Jobs'), "", false,
                          true, false, false),
                      createGridItem(1, translator.translate('Offers'), "",
                          false, true, false, false),
                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            SizedBox(
              height: 10,
            ),
            _clickText("Companies", 'ViewMore', rotatec),
            SizedBox(
              height: 65.w,
              child: Container(
                //   width: 600,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  children: <Widget>[
                    createGridItem(6, "Company Name 1", "Specialization", true,
                        false, false, false),
                    createGridItem(6, "Company Name 2", "Specialization", true,
                        false, false, false),
                    createGridItem(6, "Company Name 3", "Specialization", true,
                        false, false, false),
                    createGridItem(6, "Company Name 4", "Specialization", true,
                        false, false, false),
                    createGridItem(6, "Company Name 5", "Specialization", true,
                        false, false, false),
                    createGridItem(6, "Company Name 6", "Specialization", true,
                        false, false, false),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Transform.scale(
                            scale: 1,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: const Icon(
                                CupertinoIcons.arrow_right,
                                size: 30,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(fontSize: 11.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _clickText("Best_Deals", 'ViewMore', rotateb)),
            SizedBox(
              height: 65.w,
              child: Container(
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  children: <Widget>[
                    createGridItem(6, "Company Name 1", "Custom Description",
                        false, false, true, false),
                    createGridItem(6, "Company Name 2", "Custom Description",
                        false, false, true, false),
                    createGridItem(6, "Company Name 3", "Custom Description",
                        false, false, true, false),
                    createGridItem(6, "Company Name 4", "Custom Description",
                        false, false, true, false),
                    createGridItem(6, "Company Name 5", "Custom Description",
                        false, false, true, false),
                    createGridItem(6, "Company Name 6", "Custom Description",
                        false, false, true, false),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Transform.scale(
                            scale: 1,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: const Icon(
                                CupertinoIcons.arrow_right,
                                size: 30,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(fontSize: 11.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _clickText("Latest_Deals", 'ViewMore', rotateG)),
            SizedBox(
              height: 65.w,
              child: Container(
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  children: <Widget>[
                    createGridItem(
                        6, "Title", "20/12/2020", false, false, false, true),
                    createGridItem(
                        6, "Title", "20/12/2020", false, false, false, true),
                    createGridItem(
                        6, "Title", "20/12/2020", false, false, false, true),
                    createGridItem(
                        6, "Title", "20/12/2020", false, false, false, true),
                    createGridItem(
                        6, "Title", "20/12/2020", false, false, false, true),
                    createGridItem(
                        6, "Title", "20/12/2020", false, false, false, true),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Transform.scale(
                            scale: 1,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: const Icon(
                                CupertinoIcons.arrow_right,
                                size: 30,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(fontSize: 11.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: rotateE),
                  child: Text(
                    translator.translate("Sponsers"),
                    style: TextStyle(color: Colors.black87, fontSize: 4.5.w),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 52.w,
              child: Carousel(
                borderRadius: true,
                boxFit: BoxFit.cover,
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 6.0,
                dotIncreasedColor: Color(0xFFFF9800),
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  NetworkImage(
                      'https://thumbs.dreamstime.com/b/real-sunset-gradient-color-background-simple-nature-backdrop-products-design-taken-sky-view-airplane-window-149126064.jpg'),
                  NetworkImage(
                      'https://thumbs.dreamstime.com/b/real-sunset-gradient-color-background-simple-nature-backdrop-products-design-taken-sky-view-airplane-window-149126064.jpg'),
                  ExactAssetImage("asset/google.jpg"),
                ],
              ),
            ),
            SizedBox(
              height: 10.w,
            )
          ]),
    );
    // );
  }

  Widget _clickText(String x1, String x2, double rotation) {
    return SizedBox(
      height: 5.h,
      child: Row(children: <Widget>[
        SizedBox(width: rotateF),
        Padding(
          padding: EdgeInsets.only(left: rotateE),
          child: Text(
            translator.translate(x1),
            style: TextStyle(color: Colors.black87, fontSize: 4.5.w),
          ),
        ), //175 p
        //
        Spacer(),
        GestureDetector(
            onTap: () {
              /* print(translator.currentLanguage);
                      translator.setNewLanguage(context,
                          newLanguage:
                              translator.currentLanguage == 'ar' ? 'en' : 'ar',
                          restart: true);
                      print(translator.currentLanguage);*/
            },
            child: Text(translator.translate(x2),
                style: TextStyle(color: Colors.black87, fontSize: 4.w))),
        SizedBox(
          width: 5,
        )
      ]),
    );
  }

  Widget _carousel() {
    return Padding(
      padding: EdgeInsets.only(top: 1.w),
      child: SizedBox(
        height: 52.w,
        child: Carousel(
          borderRadius: true,
          boxFit: BoxFit.cover,
          autoplay: false,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 6.0,
          dotIncreasedColor: Color(0xFFFF9800),
          dotBgColor: Colors.transparent,
          dotPosition: DotPosition.bottomCenter,
          dotVerticalPadding: 10.0,
          showIndicator: true,
          indicatorBgPadding: 7.0,
          images: [
            NetworkImage(
                'https://thumbs.dreamstime.com/b/real-sunset-gradient-color-background-simple-nature-backdrop-products-design-taken-sky-view-airplane-window-149126064.jpg'),
            NetworkImage(
                'https://thumbs.dreamstime.com/b/real-sunset-gradient-color-background-simple-nature-backdrop-products-design-taken-sky-view-airplane-window-149126064.jpg'),
            ExactAssetImage("asset/google.jpg"),
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  Widget createGridItem(int position, String text, String text2, bool flag,
      bool flag2, bool flag3, bool flag4) {
    var color = Colors.white;
    var icondata2 = MyFlutterApp.motors;

    switch (position) {
      case 1:
        color = Colors.grey;
        icondata2 = MyFlutterApp.motors;

        break;
      case 2:
        color = Colors.grey;
        icondata2 = MyFlutterApp.mobiles;
        break;
      case 3:
        color = Colors.grey;
        icondata2 = MyFlutterApp.furniture___garden;
        break;
      case 4:
        color = Colors.grey;
        icondata2 = MyFlutterApp.classifieds;
        break;
      case 5:
        color = Colors.grey;
        icondata2 = MyFlutterApp.community;
        break;
      case 6:
        color = Colors.white;
        icondata2 = MyFlutterApp.home_appliances;
        break;
      case 7:
        color = Colors.orange;
        icondata2 = MyFlutterApp.business___industrial;
        break;

      case 8:
        color = Colors.orange;
        icondata2 = MyFlutterApp.mobiles;

        break;
      case 9:
        color = Colors.orange;
        icondata2 = MyFlutterApp.property_for_rent;
        break;
      case 10:
        color = Colors.orange;
        icondata2 = MyFlutterApp.property_for_sale;
        break;
    }

    if (flag == true) {
      return Builder(builder: (context) {
        return Card(
          margin: EdgeInsets.all(3.w),
          elevation: 3,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: InkWell(
            onTap: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Specialization();
                  },
                ),
              );*/
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 37.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: Image.network(
                        'http://oxydu.linkgroupsy.com/linkgroupsy/Oxydusub/wp-content/uploads/2021/04/image-3.png?v=1621775342',
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            heightFactor: 2,
                            widthFactor: 2,
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.orange[300]),
                              ),
                            ),
                          );
                          // You can use LinearProgressIndicator or CircularProgressIndicator instead
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            Text('Some errors occurred!'),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.w),
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.orange,
                          //  fontWeight: FontWeight.bold,
                          fontSize: 4.w),
                    ),
                  ),
                  SizedBox(height: 1.5.w),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        text2,
                        style: TextStyle(color: Colors.grey, fontSize: 3.5.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    } else if (flag2 == true) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MotorsMain();
                    },
                  ),
                );
              }
              if (text == "\tProperty\n For Rent" || text == "عقارات للإيجار") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PropertyMain(choice2: true, car: propertyForRent);
                    },
                  ),
                );
              }
              if (text == "Mobile Phones\n \t\t\t& Tablets" ||
                  text == "\t\tالهواتف المحمولة\n \tوالأجهزة اللوحية ") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MobileMain();
                    },
                  ),
                );
              }
              if (text == "\tFurniture\n &\tGarden" || text == "أثاث وحدائق") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FurnitureMain();
                    },
                  ),
                );
              }
              if (text == "Classifieds" || text == "التصنيفات") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Classifieds(
                        choice2: true,
                      );
                    },
                  ),
                );
              }
              if (text == "Community" || text == "المجتمع") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CommunityMain();
                    },
                  ),
                );
              }
              if (text == "\tProperty\n For Sale" || text == "عقارات للبيع") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PropertyMain(choice2: false, car: propertyForSale);
                    },
                  ),
                );
              }
              if (text == "\t\t\t\t\tHome\nAppliances" ||
                  text == "\tاكسسوارات \n \t\t\tمنزلية") {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       //   return HomeAppliancesMain();

                //     },
                //   ),
                // );
              }
              if (text == "Jobs" || text == "وظائف") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return JobsMain();
                    },
                  ),
                );
              }
              if (text == "Offers" || text == "العروض") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OffersMain(offerList: offers);
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
                //SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                SizedBox(height: 1.h),
                Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 3.3.w),
                ),
              ],
            ),
          ),
        );
      });
    } else if (flag3 == true) {
      return Builder(builder: (context) {
        return Card(
          margin: EdgeInsets.all(3.w),
          elevation: 3,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: InkWell(
            onTap: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BuyItem();
                  },
                ),
              );*/
            },
            //  child: Center

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    height: 37.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: Image.network(
                        'https://surlybikes.com/uploads/bikes/_medium_image/Troll_BK0337.jpg',
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Center(
                              heightFactor: 2,
                              widthFactor: 2,
                              child: SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.orange[300]),
                                ),
                              ),
                            ),
                          );
                          // You can use LinearProgressIndicator or CircularProgressIndicator instead
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            Text('Some errors occurred!'),
                      ),
                    )),
                SizedBox(height: 1.5.w),
                Padding(
                  padding: EdgeInsets.all(1.w),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.orange,
                        // fontWeight: FontWeight.bold,
                        fontSize: 3.5.w),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 0, 0, 0),
                  child: Text(
                    text2,
                    style: TextStyle(color: Colors.grey, fontSize: 3.w),
                  ),
                ),
                SizedBox(height: 1.5.w),
                SizedBox(
                    child: Container(
                  alignment: Alignment.bottomRight,
                  width: 22.w,
                  height: 5.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: StrikeThroughWidget(
                            child:
                                Text("250", style: TextStyle(fontSize: 3.5.w))),
                      ),
                      Container(
                        child: Text("  150", style: TextStyle(fontSize: 3.5.w)),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            //  ),
          ),
        );
      });
    }

    if (flag4 == true) {
      return Builder(builder: (context) {
        return Card(
          margin: EdgeInsets.all(3.w),
          elevation: 3,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: InkWell(
            onTap: () {
              /*  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TitlePage();
                  },
                ),
              );*/
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                      height: 37.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8RBlosb6WRGkVcmEs9HsBHkeiVz3ktwocRw&usqp=CAU',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              heightFactor: 2,
                              widthFactor: 2,
                              child: SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.orange[300]),
                                ),
                              ),
                            );
                            // You can use LinearProgressIndicator or CircularProgressIndicator instead
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              Text('Some errors occurred!'),
                        ),
                      )),
                  SizedBox(height: 3.w),
                  Padding(
                    padding: EdgeInsets.all(1.w),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.orange,
                          //fontWeight: FontWeight.bold,
                          fontSize: 4.5.w),
                    ),
                  ),
                  SizedBox(height: 1.5.w),
                  SizedBox(
                    child: Text(
                      text2,
                      style: TextStyle(color: Colors.grey, fontSize: 3.5.w),
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
}

class StrikeThroughWidget extends StatelessWidget {
  final Widget _child;

  StrikeThroughWidget({Key key, @required Widget child})
      : this._child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _child,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/strikethrough.png'), fit: BoxFit.fitWidth),
      ),
    );
  }
}
