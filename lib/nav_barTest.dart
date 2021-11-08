import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'PlaceYouAdd/Placeyouradd.dart';
import 'Profile/Profile.dart';
import 'home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:oxydu/constants.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

//void  main() => runApp(MyyApp());
/*
class MyyyyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      body: MyApp(),
    );
  }
}*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (4)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Lottie.asset(
          'asset/oc.json',
          controller: _controller,
          height: MediaQuery.of(context).size.height * 1,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyyyApp()),
                  ));
          },
        ),
      ),
    );
  }
}

class MyyyApp extends StatefulWidget {
  @override
  _MyyyAppState createState() => _MyyyAppState();
}

class _MyyyAppState extends State<MyyyApp> {
  String userName, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // check() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   id = prefs.getString('id');
  // }
  void _openPopup(context) {
    Alert(
        context: context,
        title: translator.translate('LOGIN'),
        content: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: translator.translate('User name'),
                ),
                // ignore: missing_return
                validator: (dynamic value) {
                  if (value.isEmpty) return;
                },
                onSaved: (value) {
                  setState(() {
                    userName = value;
                  });
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                ),
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: translator.translate('Password'),
                ),
                // ignore: missing_return
                validator: (dynamic value) {
                  if (value.isEmpty) return;
                },
                onSaved: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () async {
              if (!_formKey.currentState.validate()) return;
              _formKey.currentState.save();
              Dio dio = new Dio();
              dio.options.headers["Authorization"] = "Bearer $s";
              Response responseval = await dio.post(
                'https://oxydu.com/wp-json/custom-plugin/login',
                data: {"username": "$userName", "password": "$password"},
                options: Options(
                    followRedirects: false, validateStatus: (status) => true),
              );
              if (responseval.statusCode == 200) {
                id = responseval.data["ID"];
                // List<dynamic> d = responseval.data["roles"];
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('id', id.toString()); 
                Navigator.of(context).pop();
              }
              if (responseval.statusCode == 500) {
                final snackBar = SnackBar(
                    content: Text(translator
                        .translate('User name / password is invalid')));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Text(
              translator.translate('LOGIN'),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  void initState() {
    super.initState(); 
    _controller.addListener(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (_controller.index == 1 || _controller.index == 2) { 
        id = prefs.getString('id');
        if (_controller.index == 1 && id == null) _openPopup(context);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
        ]);
      }
      _buildScreens();
    });
  }

  Future<bool> redirectTo() async {
    /* if (id != null && _controller.index == 1) */
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return true;
  }

  List<Widget> _buildScreens() {
    return [HomePage(), Placeyouradd(), Profile()];
  }

  @override
  Widget build(BuildContext context) {
    _buildScreens();
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          textStyle: TextStyle(fontSize: 4.w),
          icon: Icon(
            CupertinoIcons.home,
            size: 6.w,
          ),
          title: (translator.translate('Homee')),
          activeColorPrimary: CupertinoColors.activeOrange,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
            textStyle: TextStyle(fontSize: 4.w),
            // onPressed: gotoMotorsScreen(hideNavBar),
            icon: Icon(CupertinoIcons.plus, size: 6.w),
            title: (translator.translate('placeyourAdd')),
            activeColorPrimary: CupertinoColors.activeOrange,
            inactiveColorPrimary: CupertinoColors.systemGrey,
            routeAndNavigatorSettings: RouteAndNavigatorSettings()),
        PersistentBottomNavBarItem(
          textStyle: TextStyle(fontSize: 4.w),
          icon: Icon(CupertinoIcons.person, size: 6.w),
          title: (translator.translate('Profile')),
          activeColorPrimary: CupertinoColors.activeOrange,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    return WillPopScope(
      onWillPop: redirectTo,
      child: PersistentTabView(
        context,
        onWillPop: (context) async {
          /* SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitDown,
            DeviceOrientation.portraitUp,
          ]);*/
          return true;
        },
        // hideNavigationBar: hideNavBar,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        navBarHeight: 14.w, // Default is true.
        resizeToAvoidBottomInset:
            false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        /*screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),*/
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
