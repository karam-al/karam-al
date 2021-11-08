// @dart=2.9
import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'Jobss/JobsItemStateManagement.dart';
import 'MotorsMain/BuyItemMotorsManagement.dart';
import 'MotorsMain/StateManagementMotors.dart';
import 'Offers/BuyItemOffersManagement.dart';
import 'PlaceYouAdd/Jobs/notes_serviceJobs.dart';
import 'PlaceYouAdd/Motors/notes_service.dart';
import 'PlaceYouAdd/Property For Rent/note_serviceForRent2.dart';
import 'PlaceYouAdd/PropertyForSale/notes_serviceForSale.dart';
import 'PlaceYouAdd/SnackBarService.dart';
import 'PlaceYouAdd/offers/notes_serviceOffers.dart';
import 'PropertyForRent/BuyItemRentManagement.dart';
import 'PropertyForSale/BuyItemSaleManagement.dart';
import 'nav_barTest.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oxydu/constants.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NotesServicee());
  GetIt.I.registerLazySingleton(() => NotesServiceeForSale());
  GetIt.I.registerLazySingleton(() => NotesServiceeOffers());
  GetIt.I.registerLazySingleton(() => NotesServiceeForRent());
  GetIt.I.registerLazySingleton(() => NotesServiceJobs());
  GetIt.I.registerLazySingleton(() => MotorsStateManagement());
  GetIt.I.registerLazySingleton(() => SnackBarService());
  GetIt.I.registerLazySingleton(() => JobsItemStateManagement());
  GetIt.I.registerLazySingleton(() => BuyItemMotorsStateManagement());
  GetIt.I.registerLazySingleton(() => BuyItemOffersStateManagement());
  GetIt.I.registerLazySingleton(() => BuyItemRentStateManagement());
  GetIt.I.registerLazySingleton(() => BuyItemSaleStateManagement());
}

void main() async {
  setupLocator();
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  id = prefs.getString('id');
  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'asset/lang/',
  );
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(DevicePreview(
            builder: (context) => LocalizedApp(
              child: MyApp(),
            ),
            enabled: !kReleaseMode,
          )));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  static bool statee = false;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        localizationsDelegates: translator.delegates, // Android + iOS Delegates
        locale: translator.locale, // Active locale
        supportedLocales: translator.locals(), // Locals list
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

/*
class SplashScreen extends StatefulWidget {
  @override 
  _SplashScreenState createState( ) => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MyyyApp()));.  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            // logo here
            Image.asset(
              'asset/oxyduu.png',
              height: 270,
              width: 200, 
            ),
            SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),  
            )
          ],
        ),
      ),
    );
   }
}
*/
