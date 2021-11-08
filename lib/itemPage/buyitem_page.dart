import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuyItem extends StatefulWidget {
  /* Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _marker = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;*/

  @override
  _BuyItemState createState() => _BuyItemState();
}

class _BuyItemState extends State<BuyItem> {
  final String description =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
        onPressed: function,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: Colors.blue,
        child: Icon(
          icon,
          size: 36.0,
        ));
  }

  Widget details(String text1, String text2) {
    return Material(
        elevation: 2,
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
              width: 73,
              height: 93,
              decoration: BoxDecoration(color: Colors.white30)),
          Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(text1, style: TextStyle(fontSize: 16.0)),
            ),
            Padding(
                padding: EdgeInsets.only(top: 6),
                child: Icon(
                  CupertinoIcons.info_circle,
                  color: Colors.orange,
                )),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(text2,
                  style: TextStyle(fontSize: 12.0, color: Colors.black45)),
            ),
          ]),
        ]));
  }

  Widget button_2(String text, int choice) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: MaterialButton(
        elevation: 5,
        height: 30.0,
        minWidth: 90.0,
        color: Colors.white,
        child: Text(text,
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () {
          if (choice == 1) launch("tel://+963938172558");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String name = "obai";
    String number = "+963938172558";
    String newNumber = number; 
    String replaceCharAt(String oldString, int index, String newChar) {
      return oldString.substring(0, index) +
          newChar +
          oldString.substring(index + 1);
    }

    for (int i = 10; i < number.length; i++) {
      newNumber = replaceCharAt(newNumber, i, "*");
      print("PHONE_NUMBER_LOOP:$newNumber");
    }

    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text('Specialization'),
      ),*/
      // debugShowCheckedModeBanner: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 210.0,
                child: Stack(
                  children: [
                    Carousel(
                      boxFit: BoxFit.cover,
                      autoplay: false,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(milliseconds: 800),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 200, 20),
                              child: frostedIconButton(
                                IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.arrowLeft,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              )),
                        ),
                        Container(
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: frostedIconButton(
                                IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.heart,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {}),
                              )),
                        ),
                        Container(
                            child: Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: frostedIconButton(
                                  IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.share,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {}),
                                )))
                      ],
                    )
                  ],
                ),
              ), //Buttons
              SizedBox(
                child: Row(children: [
                  button_2("Call",1) ,
                  button_2("WhatsApp",0) ,
                  button_2("Chat",0)   
                ]),
              ), //owner name && Phone number
              Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: Divider(thickness: 2)),

              Padding(
                padding: EdgeInsets.only(left: 4),
                child: Row(
                  children: [
                    Text("Description",
                        style: TextStyle(color: Colors.grey, fontSize: 25.0)),
                  ],
                ),
              ),
              SizedBox(
                  width: 350, child: DescriptionTextWidget(text: description)),

              Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: Divider(thickness: 2)),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Material(
                  elevation: 7,
                  child: Container(
                    height: 60,
                    width: 345,
                    color: Colors.orange,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 17.0),
                                child: Row(children: [
                                  Text("25000\$",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25.0)),
                                ])),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                  elevation: 7,
                  child: Container(
                    color: Colors.black54,
                    height: 200,
                    width: 345,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Owner Information",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25.0)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70, left: 12),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.person_fill,
                                color: Colors.orange,
                              ),
                              Text("Posted By:  ",
                                  style: TextStyle(
                                      color: Colors.grey[350], fontSize: 20)),
                              Text("$name",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 130, left: 12),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.phone_fill,
                                color: Colors.orange,
                              ),
                              Text("Phone Number : ",
                                  style: TextStyle(
                                      color: Colors.grey[350], fontSize: 20)),
                              Text("$newNumber",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),

              Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: Divider(thickness: 2)),

              Padding(
                padding: EdgeInsets.only(bottom: 14, left: 4),
                child: Row(
                  children: [
                    Text("Item Details",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black54,
                            fontSize: 20)),
                    Icon(
                      CupertinoIcons.info_circle,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
              SizedBox(
                  child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  details("Type", "Car"),
                  SizedBox(
                    width: 10,
                  ),
                  details("Model", "Kia"),
                  SizedBox(
                    width: 10,
                  ),
                  details("Year", "2018"),
                  SizedBox(
                    width: 10,
                  ),
                  details("Carrier", "Manual"),
                ],
              )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  details("Color", "Black"),
                  SizedBox(
                    width: 10,
                  ),
                  details("Trim", "Standard"),
                  SizedBox(
                    width: 10,
                  ),
                  details("Kilometer", "150"),
                  SizedBox(
                    width: 10,
                  ),
                  details("Doors", "2"),
                ],
              )),

              SizedBox(
                height: 10,
              ),

              Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: Divider(thickness: 2)),
              Padding(
                padding: EdgeInsets.only(left: 4, bottom: 14),
                child: Row(
                  children: [
                    Text("Location",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black54,
                            fontSize: 20)),
                    Icon(
                      CupertinoIcons.placemark_fill,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
              /*  SizedBox(
                  width: 345,
                  height: 250,
                  child: Stack(
                    children: [
                      GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 11.0,
                        ),
                        mapType: _currentMapType,
                        markers: _marker,
                        onCameraMove: _onCameraMove,
                        gestureRecognizers: Set()
                          ..add(Factory<EagerGestureRecognizer>(
                              () => EagerGestureRecognizer())),
                      ),
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                button(_onMapTypeButtonPressed, Icons.map),
                                SizedBox(height: 16.0),
                                button(
                                    _onAddMarkerButtonPressed, Icons.add_location)
                              ],
                            ),
                          ))
                    ],
                  ))*/
            ],
          ),
        ),
      ),
    );
  }

  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: child)));
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(150, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(
              firstHalf,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            )
          : new Column(
              children: <Widget>[
                new Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 25),
                      Container(
                          child: flag
                              ? Text("View More",
                                  style: new TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800]))
                              : Text("View Less",
                                  style: new TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800]))
                          /* Icon(
                                FontAwesomeIcons.arrowDown,
                                color: Colors.black,
                              )
                            : Icon(
                                FontAwesomeIcons.arrowUp,
                                color: Colors.black,
                              ),*/
                          )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
