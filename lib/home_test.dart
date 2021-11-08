import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'Pages/specialization_page.dart';
import 'dart:developer' as developer;


class HomeTest extends StatefulWidget {
  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  Size size;
  bool flaag = false, flaag2 = false;
  bool flaag3 = false;
    int _pageIndex = 0;

  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    /* return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),*/

    /* return Navigator(
      //  key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {*/

    return WillPopScope(
      onWillPop: () async {
            developer.log(
                'On Will called ${navigatorKeys[_pageIndex].currentState.context.widget}');
            // return !await navigatorKeys[_pageIndex].currentState.context;
            return !await Navigator.maybePop(
                navigatorKeys[_pageIndex].currentState.context);
            // Navigator.pop(navigatorKeys[_pageIndex].currentState.context);
          },
          child: IndexedStack(
             index: _pageIndex,
             children: <Widget>[
        /*Scaffold(
          /* appBar: AppBar(
                    //title: widget.child,
                    centerTitle: true,
                  ),*/
          body: */
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Carousel(
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
                        'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                    NetworkImage(
                        'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                    ExactAssetImage("asset/google.jpg"),
                  ],
                ),
              ),
              SizedBox(
                height: 550,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    // child: IgnorePointer(
                    child: GridView.count(
                      physics: new NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: <Widget>[
                        createGridItem(0, "Property For Rent", "", false, true,
                            false, false),
                        createGridItem(
                            1, "Motors", "", false, true, false, false),
                        /* createGridItem(2, "Mobile Phones & Tablets", "", false,
                                  true, false, false),
                              createGridItem(
                                  3, "Furniture", "", false, true, false, false),
                              createGridItem(
                                  4, "Classifieds", "", false, true, false, false),
                              createGridItem(
                                  5, "Community", "", false, true, false, false),*/
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //   ),
      ]),
    );
    /*  },
        );
      },
    );*/
  }
}

Widget createGridItem(int position, String text, String text2, bool flag,
    bool flag2, bool flag3, bool flag4) {
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
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 9, top: 10),
      child: Card(
        elevation: 6,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.black),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Specialization();
                },
              ),
            );
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )),
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
      ),
    );
  });
}
