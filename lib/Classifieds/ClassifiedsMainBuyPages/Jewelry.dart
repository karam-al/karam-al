import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/MotorsMain/AllinMotorsTest.dart';
import 'package:oxydu/Pages/Specialization_company.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:oxydu/WaterMark.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

Map<String, bool> materialList, materialListTemp;
TextEditingController controller = new TextEditingController();
String filter = "";
List<Post3> countries, result, everythink;
Function eq = const ListEquality().equals;
bool loading;

RangeValues _currentRangeValuesPriceTest = RangeValues(0, 450000);

RangeValues range;
RangeValues values1;
List<bool> boolArr = [false];
bool flag = false,
    flag2 = false,
    flag3 = false,
    flag4 = false,
    flag5 = false,
    flag6 = false,
    flag7 = false,
    flagArabicEnglish = false,
    flagEnglishArabic = false,
    flagArabicArabic = false,
    flagEnglishEnglish = false,
    textSearch = false,
    textFirstTime = false;
int grid = 0,
    testt = 0,
    indexUsage = 0,
    indexAge = 0,
    indexCondition = 0,
    indexWarranty = 0;
int onChangeColor, onChangeMemory;
String incrementPriceStart = "";
String incrementPriceEnd = "";
String incrementYearStart = "";
String incrementYearEnd = "";
String incrementKMStart = "";
String incrementKMEnd = "";
String _searchText = "";
// ignore: deprecated_member_use
List<Post3> _searchList = List();
// ignore: deprecated_member_use
List<Post3> _searchList2 = List();
List<bool> weightData;
// ignore: deprecated_member_use
RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
List<String> usage, age, condition, warranty;
int choiceUsage = 10,
    choiceAge = 10,
    choiceCondition = 10,
    choiceWarranty = 10,
    subString = 0,
    subString2 = 0,
    substring3 = 0;
String _selectedLocationUsage = translator.translate("all6"),
    _selectedLocationAge = translator.translate("all6"),
    _selectedLocationCondition = translator.translate("all6"),
    // _selectedLocationMaterial="All",
    _selectedLocationWarranty = translator.translate("all6"); // Option 2
bool _IsSearching, isDevice, isEnglish;
//Map map = model.asMap();
double ss = 0,
    paddding = 0,
    paddding2 = 0,
    paddding3 = 0,
    paddding4 = 0,
    paddding5 = 0,
    paddding6 = 0,
    paddding7 = 0,
    paddding8 = 0,
    paddding9 = 0,
    paddding10 = 0,
    paddding11 = 0,
    paddding12 = 0,
    paddding13 = 0,
    paddding14 = 0,
    paddding14b = 0,
    paddding15 = 0,
    paddding16 = 0,
    paddding17 = 0,
    paddding18 = 0,
    paddding19 = 0,
    paddding20 = 0,
    paddding21 = 0,
    paddding22 = 0,
    paddding23 = 0,
    paddding24 = 0,
    paddding25 = 0,
    paddding26 = 0,
    paddding27 = 0,
    paddding28 = 0,
    paddding29 = 0,
    paddding30 = 0,
    paddding31 = 0,
    paddding32 = 0,
    paddding33 = 0,
    paddding34 = 0,
    paddding35 = 0,
    paddding36 = 0,
    paddding37 = 0,
    paddding38 = 0,
    paddding39 = 0,
    paddding40 = 0,
    paddding41 = 0,
    paddding42 = 0,
    paddding43 = 0,
    paddding44 = 0,
    paddding45 = 0,
    paddding46 = 0,
    paddding47 = 0,
    paddding48 = 0,
    paddding49 = 0,
    paddding50 = 0,
    paddding51 = 0,
    paddding52 = 0,
    landscape = 0,
    leadingSize = 0,
    titleFontSize = 0;
int c, end, ii, iii;
String longSpinnerValue = condition[0];
Map<String, bool> materialss = {};
List<String> warranty2 = [
  "All",
  "Yes",
  "No",
  "Does not Apply",
];
List<String> condition2 = [
  "All",
  "Perfect inside and out",
  "Almost no noticeable problems or flaws",
  "A bit of wear and tear, but in good working condition",
  "Normal wear and tear for the age of the item, a few problems here and there",
  "Above avearge wear and tear.The item may need a bit of repair to work properly",
];
List<String> usage2 = [
  "All",
  "Still in original packaging",
  "Out of original packaging but only used once",
  "Used only a few times",
  "Used an average amount as frequently as would be expected",
  "Used an above average amount since purchased",
];
List<String> age2 = [
  "All",
  'Brand New',
  '0-1 month',
  '1-6 month',
  '6-12 month',
  '1-2 years',
  '2-5 years',
  '5-10 years',
  '10+ years',
];
Map<String, bool> materialList2 = {
  'Amber': false,
  'Beads': false,
  'Bronze': false,
  'Ceramic': false,
  'Crystal': false,
  'CZ': false,
  'Diamond': false,
  'Gemstone': false,
  'Leather': false,
  'Plastic': false,
  'Platinum': false,
  'Rhinestones': false,
  'Rubber': false,
  'Semi Precious/Birth Stones': false,
  'Shell, Bone, Coral': false,
  'Silver': false,
  'Steel': false,
  'Titanium': false,
  'White Gold': false,
  'Wood': false,
  'Yellow Gold': false,
  'Other Material': false,
  'Other Metal': false,
};
///////////////////////////////////////////////////////

List<String> warranty3 = [
  "الكل",
  "نعم",
  "لا",
  "غير سارية المفعول",
];
List<String> condition3 = [
  "الكل",
  "بلا عيوب",
  "ممتازة",
  "جيدة",
  "متوسطة",
  "غير جيدة",
];
List<String> usage3 = [
  "الكل",
  "لا يزال في عبوته الأصلية",
  "خارج العبوة الأصلية ولكن تم استخدامها مرة واحدة فقط",
  "استخدام مرة واحدة فقط",
  "استخدام متوسط بشكل متكرر كما هو متوقع",
  "استخدام اكثر من المتوسط منذ الشراء",
];
List<String> age3 = [
  "الكل",
  'جديد',
  "أقل من شهر",
  "أقل من 6 أشهر",
  "اقل من سنة",
  "أقل من سنتين",
  "أقل من 5 سنوات",
  "أقل من 10 سنوات",
  "أي عمر",
];
Map<String, bool> materialList3 = {
  'عنبر': false,
  'خرز': false,
  'برونز': false,
  'سيراميك': false,
  'كريستال': false,
  'CZ': false,
  'ألماس': false,
  'حجر كريم': false,
  'جلد': false,
  'بلاستيك': false,
  'بلاتين': false,
  'أحجار الراين': false,
  'مطاط': false,
  'أحجار شبه ثمينة': false,
  'صدف، عظام و مرجان': false,
  'فضة': false,
  ' فولاذ': false,
  'تيتانيوم': false,
  'ذهب أبيض': false,
  'خشب': false,
  'ذهب أصفر': false,
  'مواد أخرى': false,
  'معادن أخرى': false,
};

Map<String, bool> maybee = {
  'test': false,
};

final TextEditingController _searchQuery = TextEditingController();
var redrawObject;

class Jewelry extends StatefulWidget {
  @override
  State createState() => JewelryState();
}

class SortList {
  String name;
  int index;
  SortList({this.name, this.index});
}

class JewelryState extends State<Jewelry> {
  // Default Radio Button Item
  String radioItem = 'Sort..';

  // Group Value for Radio Button.
  int id = 10;

  List<SortList> sort;

  List<RangeSliderData> rangeSliders;
  double padding = 0.0;
  Icon actionIconTab = Icon(Icons.search, color: Colors.white, size: 5.w);
  Icon actionIconMob = Icon(Icons.search, color: Colors.white, size: 6.w);
  Widget appBarTitle = new Text("${translator.translate("Jewelry Section")}",
      style: new TextStyle(color: Colors.white, fontSize: 4.w));
  // ignore: missing_return
  List<Post3> test() {
    materialListTemp = materialList;
    textFirstTime = true;
    textSearch = false;
    _searchList2.clear();
    boolArr.clear();
    ii = 0;
    everythink.forEach((element) {
      element.filter = false;
    });

    flag = false;
    flag2 = false;
    flag3 = false;
    flag4 = false;
    flag7 = false;
    flagArabicEnglish = false;
    flagEnglishArabic = false;
    flagArabicArabic = false;
    flagEnglishEnglish = false;

    materialList2.forEach((k, v) {
      materialList2[k] = false;
    });
    materialList3.forEach((k, v) {
      materialList3[k] = false;
    });

    materialList.forEach((key, value) {
      boolArr.add(value);
    });
    for (int i = 0; i < boolArr.length; i++) {
      materialList2[materialList2.keys.elementAt(i)] = boolArr[i];
      materialList3[materialList3.keys.elementAt(i)] = boolArr[i];
    }

    for (int i = 0; i < countries.length; i++) {
      ii = 0;
      iii = 0;
      maybee.clear();
      flag6 = false;

      //////////////////////////////////////////////////////////
      if ((countries[i].usage.toLowerCase().contains(RegExp(r'[a-z]'))) &&
          translator.currentLanguage == 'ar') {
        flagArabicEnglish = true;
        _selectedLocationUsage = usage2.elementAt(indexUsage);
        _selectedLocationAge = age2.elementAt(indexAge);
        _selectedLocationCondition = condition2.elementAt(indexCondition);
        _selectedLocationWarranty = warranty2.elementAt(indexWarranty);
        materialList2.forEach((key, value) {
          if (value == true && !flag6) {
            materialss.clear();
            materialss[key] = value;
            flag6 = true;
            materialList2[key] = false;
          }
          // if (value == true) {}
        });
      }
      if (!(countries[i].usage.toLowerCase().contains(RegExp(r'[a-z]'))) &&
          translator.currentLanguage == 'en') {
        flagEnglishArabic = true;
        _selectedLocationUsage = usage3.elementAt(indexUsage);
        _selectedLocationAge = age3.elementAt(indexAge);
        _selectedLocationCondition = condition3.elementAt(indexCondition);
        _selectedLocationWarranty = warranty3.elementAt(indexWarranty);
        materialList3.forEach((key, value) {
          if (value == true && !flag6) {
            materialss.clear();

            materialss[key] = value;
            flag6 = true;
            materialList3[key] = false;
          }
          // if (value == true) {}
        });
      }
      if ((countries[i].usage.toLowerCase().contains(RegExp(r'[a-z]'))) &&
          translator.currentLanguage == 'en') {
        flagEnglishEnglish = true;
        _selectedLocationUsage = usage.elementAt(indexUsage);
        _selectedLocationAge = age.elementAt(indexAge);
        _selectedLocationCondition = condition.elementAt(indexCondition);
        _selectedLocationWarranty = warranty.elementAt(indexWarranty);
        materialList2.forEach((key, value) {
          if (value == true && !flag6) {
            materialss.clear();

            materialss[key] = value;
            flag6 = true;
            materialList2[key] = false;
          }
          // if (value == true) {}
        });
      }
      if (!(countries[i].usage.toLowerCase().contains(RegExp(r'[a-z]'))) &&
          translator.currentLanguage == 'ar') {
        flagArabicArabic = true;
        _selectedLocationUsage = usage.elementAt(indexUsage);
        _selectedLocationAge = age.elementAt(indexAge);
        _selectedLocationCondition = condition.elementAt(indexCondition);
        _selectedLocationWarranty = warranty.elementAt(indexWarranty);
        materialList3.forEach((key, value) {
          if (value == true && !flag6) {
            materialss.clear();

            materialss[key] = value;
            flag6 = true;
            materialList3[key] = false;
          }
          // if (value == true) {}
        });
      }

//////////////////////////////////////////////////
      ///
      if (_selectedLocationUsage != 'All' && _selectedLocationUsage != 'الكل') {
        maybee[_selectedLocationUsage] = false;
        flag = true;
      }
      if (_selectedLocationAge != 'All' && _selectedLocationAge != 'الكل') {
        flag2 = true;
        maybee[_selectedLocationAge] = false;
      }
      if (_selectedLocationCondition != 'All' &&
          _selectedLocationCondition != 'الكل') {
        flag3 = true;
        maybee[_selectedLocationCondition] = false;
      }
      if (_selectedLocationWarranty != 'All' &&
          _selectedLocationWarranty != 'الكل') {
        flag4 = true;
        maybee[_selectedLocationWarranty] = false;
      }
      if (!flag && !flag2 && !flag3 && !flag4) {
        flag5 = true;
        maybee[_selectedLocationUsage] = true;
        maybee[_selectedLocationAge] = true;
        maybee[_selectedLocationCondition] = true;
        maybee[_selectedLocationWarranty] = true;
      }
      /* if ((materialss.isEmpty && !flag2 && flagArabicArabic) ||
          (materialss.isEmpty && !flag3 && flagEnglishEnglish) ||
          (materialss.isEmpty && !flag4 && flagEnglishArabic) ||
          (materialss.isEmpty && !flag5 && flagArabicEnglish)) {
        print("iiiiiiiiii$i");

        if (!flag2 && flagArabicArabic) {
          flag2 = true;
          flagArabicArabic = true;
        }
        if (!flag3 && flagEnglishEnglish) {
          flag3 = true;
          flagEnglishEnglish = true;
        }
        if (!flag4 && flagEnglishArabic) {
          flag4 = true;
          flagEnglishArabic = true;
        }
        if (!flag5 && flagArabicEnglish) {
          flag5 = true;
          flagArabicEnglish = true;
        }*/
      if (materialss.isEmpty) {
        print("commmon");
        for (var k in maybee.keys) {
          if ((countries[i].age.toLowerCase() == k.toLowerCase()) ||
              (countries[i].condition.toLowerCase() == k.toLowerCase()) ||
              (countries[i].usage.toLowerCase() == k.toLowerCase()) &&
                  (countries[i].price >=
                      _currentRangeValuesPriceTest.start.toInt())) {
            textSearch = true;
            print("commmon2$textSearch");

            maybee[k] = true;
          }
        }
      }
      if (materialss.isNotEmpty) {
        flag7 = true;
        for (var k in materialss.keys) {
          maybee[k] = false;
        }
        for (var k in maybee.keys) {
          print("mayebeee k $k");
          if ((countries[i].age.toLowerCase() == k.toLowerCase()) ||
              (countries[i].condition.toLowerCase() == k.toLowerCase()) ||
              (countries[i].usage.toLowerCase() == k.toLowerCase()) &&
                  (countries[i].price >=
                      _currentRangeValuesPriceTest.start.toInt()) ||
              (countries[i].material.toLowerCase() == k.toLowerCase())) {
            maybee[k] = true;
            print("hah ok ");
          }
        }
      }

      for (var z in maybee.values) {
        if (z == true && !flag5) {
          ii++;
          if (ii == maybee.length) {
            textSearch = true;
            _searchList2.add(countries[i]);
          }
        }
        //////////هون المستخدم اختار كل شي
        ///////  ملاحظة مهمي : في شرط منن عبيكون الكل فقط لهل سبب عبيتحقق شرط الخرز يمكن
        /////// عبيفرش بس عبختار من القائمة مع قيمتين من الماتيريال
        if (z == true && flag5) {
          iii++;
          print(z);
          print("iii$iii");
          print("maybee.length${maybee.length}");
          if (iii == maybee.length) {
            textSearch = true;

            _searchList2.add(countries[i]);
          }
        }
      }
      //}
    }
    result = _searchList2;
    _searchList = _searchList2; 

    return _searchList;
  }

  JewelryState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = ""; 
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text; 
          _buildSearchList();
        });
      }
    });
  }

  List<Post3> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = result;
      //_list.map((contact) =>  Uiitem(contact)).toList();
    } else {
      /*for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      } 
      */
////////////////////////////////////////////////////////////////////////
      _searchList = result
          .where((element) => element.material
              .toLowerCase()
              .contains(_searchText.toLowerCase()))
          .toList();
////////////////////////////////////////////////////////////
      return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    }
  }

  // -------------------------------------------------
  // Creates a list of RangeSlider definitions
  // -------------------------------------------------
  List<RangeSliderData> _rangeSliderDefinitions() {
    return <RangeSliderData>[
      RangeSliderData(
          min: 1.0, max: 100.0, lowerValue: 10.0, upperValue: 100.0),
    ];
  }

  List<Post3> _buildSortList() {
    result.forEach((element) {
      print(element.price);
    });
    if (id == 10) result.sort((b, a) => (a.price).compareTo(b.price));
    if (id == 1) result.sort((a, b) => (a.price).compareTo(b.price));
    if (id == 2) result.sort((b, a) => (a.price).compareTo(b.price));
    if (id == 3) result.sort((a, b) => (a.price).compareTo(b.price));
    if (id == 4) result.sort((b, a) => (a.price).compareTo(b.price));

    _searchList = result;
    return _searchList;
  }

  Widget button(Function function) {
    return MaterialButton(
      elevation: 5,
      height: 30.0,
      minWidth: 90.0,
      color: Colors.white,
      child: Text("Call",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          )),
      onPressed: () {
        function();
      },
    );
  }

  final categories = Servicesjewelry();
  //final categories = ServicesMob.getPosts();
  @override
  void initState() {
    super.initState();
    isEnglish = false;
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
    c = "a".codeUnitAt(0);
    end = "z".codeUnitAt(0);
    print("leadingSize$leadingSize");
    textSearch = false;
    textFirstTime = false;
    // textSearch = false;
    sort = [
      SortList(
        index: 1,
        name: translator.translate("By Price From Lowest To Highest"),
      ),
      SortList(
        index: 2,
        name: translator.translate("By Price From Highest To Lowest"),
      ),
      SortList(
        index: 3,
        name: translator.translate("By Date From Lowest To Highest"),
      ),
      SortList(
        index: 4,
        name: translator.translate("By Date From Highest To Lowest"),
      ),
    ];
    warranty = [
      translator.translate("all5"),
      translator.translate("Yes"),
      translator.translate("No"),
      translator.translate("Does not Apply"),
    ];
    /* usage = [
      translator.translate("all"),
      translator.translate("Never Used"),
      translator.translate("Used Once or less"),
      translator.translate("Light Usage or less"),
      translator.translate("Normal Usage or less"),
      translator.translate("Heavy Usage or less"),
    ];*/
    condition = [
      translator.translate("all5"),
      translator.translate("perfectInside"),
      translator.translate("AlmostNo"),
      translator.translate("A bit of wear and tear"),
      translator.translate("Normal wear and tear"),
      translator.translate("Above avearge wear and tear")
    ];
    usage = [
      translator.translate("all5"),
      translator.translate("still in orginal"),
      translator.translate("Out of orginal packaging"),
      translator.translate("Used only a few "),
      translator.translate("Used an average "),
      translator.translate("Used an above average")
    ];
    /* condition = [
      translator.translate("all"),
      translator.translate("Flawless"),
      translator.translate("Excellent or better"),
      translator.translate("Good or better"),
      translator.translate("Average or better"),
      translator.translate("Poor or better"),
    ];*/
    age = [
      translator.translate("all5"),
      translator.translate('Brand New'),
      translator.translate('0-1 month'),
      translator.translate('1-6 month'),
      translator.translate('6-12 month'),
      translator.translate('1-2 years'),
      translator.translate('2-5 years'),
      translator.translate('5-10 years'),
      translator.translate('10+ years')
    ];
    materialList = {
      translator.translate('Amber'): false,
      translator.translate('Beads'): false,
      translator.translate('Bronze'): false,
      translator.translate('Ceramic'): false,
      translator.translate('Crystal'): false,
      translator.translate('Amber'): false,
      translator.translate('CZ'): false,
      translator.translate('Diamond'): false,
      translator.translate('Gemstone'): false,
      translator.translate('Leather'): false,
      translator.translate('Plastic'): false,
      translator.translate('Platinum'): false,
      translator.translate('Rhinestones'): false,
      translator.translate('Rubber'): false,
      translator.translate('Semi Precious/Birth Stones'): false,
      translator.translate('Shell, Bone, Coral'): false,
      translator.translate('Silver'): false,
      translator.translate('Steel'): false,
      translator.translate('Titanium'): false,
      translator.translate('White Gold'): false,
      translator.translate('Wood'): false,
      translator.translate('Yellow Gold'): false,
      translator.translate('Other Material'): false,
      translator.translate('Other Metal'): false,
    };

    //fill countries with objects
    /* choiceAge = 10;
    choiceUsage = 10;
    choiceWarranty = 10;
    choiceCondition = 10;*/
    incrementPriceStart = "0";
    incrementPriceEnd = "450000";
    incrementYearStart = "1990";
    incrementYearEnd = "2021";
    incrementKMStart = "0";
    incrementKMEnd = "500";
    loading = true;
    _IsSearching = false;
    rangeSliders = _rangeSliderDefinitions();
    categories.getPosts().then((categories) {
      setState(() {
        countries = categories;
        _searchList = categories;
        everythink = categories;
        result = categories;
        loading = false;
      });
    }).catchError((err) {
      print("Error");
    });

    controller.addListener(() {
      setState(() {
        if (mounted) filter = controller.text;
      });
    });
  }

  /* void dispose() {
    // Set portrait orientation

    super.dispose();
  }*/
/*

  @override

  void dispose() {

  super.dispose();

  controller.dispose();

  }

  */

  Future<Map<String, bool>> _preLocation() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text("${translator.translate("Select Materials")}",
                    style: TextStyle(fontSize: 4.5.w)),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                    child: Text("${translator.translate("Cancle")}",
                        style:
                            TextStyle(fontSize: 3.5.w, color: Colors.orange)),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context, materialList);
                    },
                    child: Text("${translator.translate("Apply")}",
                        style:
                            TextStyle(fontSize: 3.5.w, color: Colors.orange)),
                  ),
                ],
                content: Container(
                  width: paddding45,
                  height: paddding45,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: materialList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String _key = materialList.keys.elementAt(index);
                      return CheckboxListTile(
                        activeColor: Colors.orange,
                        value: materialList[_key],
                        title: Text(_key, style: TextStyle(fontSize: 4.w)),
                        onChanged: (val) {
                          setState(() {
                            materialList[_key] = val;
                            // _selectedLocationMaterial = val
                          });
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        });
  }

  Future<bool> redirectTo() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return true;
  }

  Widget build(BuildContext context) {
    if (translator.currentLanguage == 'en') { 
      _selectedLocationUsage = usage2.elementAt(indexUsage);
      _selectedLocationAge = age2.elementAt(indexAge);
      _selectedLocationCondition = condition2.elementAt(indexCondition);
      _selectedLocationWarranty = warranty2.elementAt(indexWarranty);
    } else { 
      _selectedLocationUsage = usage.elementAt(indexUsage);
      _selectedLocationAge = age.elementAt(indexAge);
      _selectedLocationCondition = condition.elementAt(indexCondition);
      _selectedLocationWarranty = warranty.elementAt(indexWarranty);
    }
    /*test() {
      if (loading) {
        Padding(
            padding: new EdgeInsets.only(top: 200.0),
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
            ));
      }
      if (!loading)
        Expanded(
          child: _buildListView2(1, true, 1),
        );
    }*/

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      paddding50 = 50.w;
      paddding52 = 3.2.w;

      translator.currentLanguage == 'en' ? subString = 20 : subString = 28;
      translator.currentLanguage == 'en' ? subString2 = 35 : subString2 = 30;
      if (SizerUtil.deviceType == DeviceType.mobile) {
        print("mobile");
        print("SizerUtil.width${SizerUtil.width}");
        print("SizerUtil.height${SizerUtil.height}");
        leadingSize = 0.3.w;
        isDevice = true;
        paddding49 = 35.w;
        paddding29 = 0;
        paddding30 = 3.w;
        paddding31 = 68.w;
        paddding32 = 3.w;
        paddding33 = 1.w;
        paddding34 = 30.w;
        //التباعد ما بين الكلمات
        paddding14 = 1.4.w;
        paddding7 = 65.w;
        translator.currentLanguage == 'en'
            ? paddding48 = 25.w
            : paddding48 = 30.w;
        paddding36 = 4.w;
        if (SizerUtil.width >= 740) paddding38 = 0.18.w;
        if (SizerUtil.width < 740) paddding38 = 0.2.w;
        paddding39 = 4.5.w;
        paddding16 = 0.18.w;
        paddding40 = 4.7.w;
        paddding52 = 4.7.w;
        paddding41 = 4.2.w;
        //المجال ما بين الريسيت و السورت
        translator.currentLanguage == 'en'
            ? paddding23 = 60.w
            : paddding23 = 53.w;
        paddding18 = 9.w;
        paddding17 = 40.w;
        paddding19 = 12.w;
        paddding20 = 8.w;
        paddding24 = 60.w;
        paddding42 = 6.w;
        paddding43 = 5.5.w;
        paddding27 = 15.w;
        paddding44 = 10.w;
        paddding45 = 63.w;
        paddding46 = 4.w;
        paddding35 = 73.w;
        paddding47 = 14.w;
        translator.currentLanguage == 'en'
            ? paddding4 = 20.w
            : paddding4 = MediaQuery.of(context).size.width * 0.015;
        paddding22 = 0.14.w;
        if (SizerUtil.width >= 360 && SizerUtil.width < 480) {
          print("1");
          paddding22 = 0.11.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 1.8.w
              : paddding14 = 0.3.w;
        }

        if (SizerUtil.width >= 360 &&
            SizerUtil.width < 480 &&
            SizerUtil.height <= 560) {
          print("2");
          paddding22 = 0.145.w;
        }

        if (SizerUtil.width >= 360 &&
            SizerUtil.width < 480 &&
            SizerUtil.height > 560 &&
            SizerUtil.height < 610) {
          print("2b");
          translator.currentLanguage == 'en'
              ? paddding22 = 0.13.w
              : paddding22 = 0.135.w;
        }
        if (SizerUtil.width >= 360 &&
            SizerUtil.width < 480 &&
            SizerUtil.height > 850 &&
            SizerUtil.height <= 900) {
          print("3");

          translator.currentLanguage == 'en'
              ? paddding22 = 0.082.w
              : paddding22 = 0.09.w;
        }

        if (SizerUtil.width >= 360 &&
            SizerUtil.width < 480 &&
            SizerUtil.height >= 800 &&
            SizerUtil.height <= 815) {
          print("4");
          paddding22 = 0.098.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.2.w
              : paddding14 = 0.5.w;
        }
        if (SizerUtil.width >= 320 && SizerUtil.width < 360) {
          print("5");
          translator.currentLanguage == 'en'
              ? paddding14 = 1.6.w
              : paddding14 = 0.08.w;
          paddding22 = 0.14.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 60.w
              : paddding23 = 51.w;
          translator.currentLanguage == 'en' ? subString = 20 : subString = 28;
          translator.currentLanguage == 'en'
              ? subString2 = 35
              : subString2 = 30;
        }
        if (SizerUtil.width >= 480 && SizerUtil.width < 540) {
          print("6");
          paddding16 = 0.12.w;
          paddding22 = 0.07.w;
          translator.currentLanguage == 'en'
              ? paddding22 = 0.07.w
              : paddding22 = 0.075.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 1.8.w
              : paddding14 = 1.0.w;
        }
        if (SizerUtil.width >= 540 && SizerUtil.width < 600) {
          print("7");
          translator.currentLanguage == 'en'
              ? paddding23 = 60.w
              : paddding23 = 57.w;
          paddding22 = 0.055.w;
          paddding16 = 0.12.w;
          translator.currentLanguage == 'en'
              ? paddding22 = 0.067.w
              : paddding22 = 0.070.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 1.8.w
              : paddding14 = 1.0.w;
        }
      }
      if (SizerUtil.deviceType == DeviceType.tablet) {
        paddding45 = 50.w;
        leadingSize = 0.22.w;
        print("tablet");
        print(SizerUtil.width);
        paddding49 = 50.w;
        isDevice = false;
        translator.currentLanguage == 'en'
            ? paddding48 = 25.w
            : paddding48 = 30.w;
        paddding18 = 9.w;
        paddding17 = 37.w;
        paddding19 = 9.w;
        paddding23 = 68.w;
        paddding39 = 3.8.w;
        paddding40 = 4.4.w;
        paddding52 = 2.2.w;
        paddding46 = 4.w;
        paddding41 = 3.8.w;
        paddding44 = 10.w;
        paddding7 = 65.w;
        paddding47 = 12.w;
        paddding16 = 0.1.w;
        paddding52 = 2.8.w;

        translator.currentLanguage == 'en'
            ? paddding23 = 60.w
            : paddding23 = 60.w;

        translator.currentLanguage == 'en'
            ? paddding22 = 0.052.w
            : paddding22 = 0.052.w;
        translator.currentLanguage == 'en'
            ? paddding14 = 2.2.w
            : paddding14 = 0.6.w;
        if (SizerUtil.width < 800) {
          print("11a");
          paddding22 = 0.053.w;
          paddding47 = 10.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 69.w
              : paddding23 = 60.w;
          translator.currentLanguage == 'en'
              ? paddding22 = 0.06.w
              : paddding22 = 0.058.w;
        }
        if (SizerUtil.width >= 800 && SizerUtil.width <= 940) {
          print("11b");
          paddding22 = 0.053.w;
          paddding47 = 10.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 69.w
              : paddding23 = 60.w;
          translator.currentLanguage == 'en'
              ? paddding22 = 0.045.w
              : paddding22 = 0.045.w;
        }
        /* if (SizerUtil.width >= 800) {
          print("22");
          translator.currentLanguage == 'en'
              ? paddding23 = 68.w
              : paddding23 = 62.w;
          paddding22 = 0.042.w;
        }*/
        if (SizerUtil.width >= 950) {
          print("33a");
          translator.currentLanguage == 'en'
              ? paddding23 = 68.w
              : paddding23 = 62.w;
          paddding22 = 0.048.w;
          paddding7 = 67.w;
          paddding16 = 0.07.w;
        }
        if (SizerUtil.width >= 1100) {
          print("33b");
          translator.currentLanguage == 'en'
              ? paddding23 = 68.w
              : paddding23 = 62.w;
          paddding22 = 0.033.w;
          paddding7 = 67.w;
        }
        paddding35 = 73.w;
        paddding29 = 10.w;
        paddding30 = 5.w;
        paddding31 = 72.w;
        paddding32 = 3.w;
        paddding33 = 1.w;
        paddding36 = 4.3.w;
        paddding38 = 0.121.w;
        paddding43 = 4.w;
        paddding42 = 5.w;
        paddding24 = 65.w;
        paddding20 = 8.w;
        paddding27 = 15.w;
      }

      /*translator.currentLanguage == 'en'
          ? landscape = MediaQuery.of(context).size.width * 0.17
          : landscape = MediaQuery.of(context).size.width * 0.097;*/
      translator.currentLanguage == 'en'
          ? landscape = 17.w
          : landscape = MediaQuery.of(context).size.width * 0.097;
      translator.currentLanguage == 'en' ? paddding3 = 0 : paddding3 = 0;

      translator.currentLanguage == 'en'
          ? paddding = MediaQuery.of(context).size.width * 0.015
          : paddding = MediaQuery.of(context).size.width * 0.02;

      translator.currentLanguage == 'en'
          ? paddding2 = MediaQuery.of(context).size.width * 0.02
          : paddding2 = MediaQuery.of(context).size.width * 0.015;

      translator.currentLanguage == 'en'
          ? paddding2 = MediaQuery.of(context).size.width * 0.02
          : paddding2 = MediaQuery.of(context).size.width * 0.015;

      //   paddding5 = MediaQuery.of(context).size.height * 0.07;
      paddding5 = 13.w;
      paddding6 = MediaQuery.of(context).size.height * 0.08;
      // paddding7 = MediaQuery.of(context).size.height * 0.37;

      // paddding8 = MediaQuery.of(context).size.height * 0.055;
      paddding8 = 8.w;
      paddding9 = MediaQuery.of(context).size.width * 0.19;
      paddding10 = MediaQuery.of(context).size.width * 0.10;
      //  paddding11 = MediaQuery.of(context).size.width * 0.25;
      paddding11 = 23.w;
      //  paddding12 = MediaQuery.of(context).size.height * 0.045;
      paddding12 = 8.w;
      paddding13 = MediaQuery.of(context).size.height * 0.01;
      //  paddding14 = MediaQuery.of(context).size.height * 0.015;
      paddding15 = 0;
      // paddding16 = MediaQuery.of(context).size.height * 0.0013;
      //  paddding17 = MediaQuery.of(context).size.width * 0.4;
      // paddding18 = MediaQuery.of(context).size.width * 0.1;
      // paddding19 = MediaQuery.of(context).size.width * 0.108;
      //  paddding20 = MediaQuery.of(context).size.height * 0.055;
      paddding21 = MediaQuery.of(context).size.width * 0.2;
      //  paddding22 = MediaQuery.of(context).size.height * 0.00082;
      // paddding23 = MediaQuery.of(context).size.width * 0.6;
      //paddding24 = MediaQuery.of(context).size.width * 0.7;
      paddding25 = MediaQuery.of(context).size.height * 0.02;
      paddding26 = MediaQuery.of(context).size.height * 0.01;
      //  paddding27 = MediaQuery.of(context).size.height * 0.095;
      paddding28 = MediaQuery.of(context).size.height * 0.04;
      //  paddding29 = MediaQuery.of(context).size.height * 0.033;
      //  paddding29 = 0;
    }

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      paddding50 = 25.w;

      /* SizerUtil.deviceType == DeviceType.tablet
          ? SizerUtil.deviceType = DeviceType.mobile
          : SizerUtil.deviceType = DeviceType.mobile;*/
      if (SizerUtil.deviceType == DeviceType.mobile) {
        print("i am mobile");
        print("SizerUtil.width${SizerUtil.width}");
        print("SizerUtil.height${SizerUtil.height}");
        /*paddding29 = 0;
        paddding30 = 3.w;
        paddding31 = 58.w;
        paddding7 = 68.w;
        paddding32 = 1.w;
        paddding33 = 1.w;
        paddding11 = 23.w;
        paddding35 = 62.w;
        subString = 10;
        paddding5 = 13.w;
        paddding36 = 4.5.w;
        paddding14 = 1.7.w;
        paddding38 = 0.25.w;
        /////////////////////////////
        paddding14b = 1.w;*/
        //  paddding22 = 4.w;
        leadingSize = 0.3.w;

        paddding44 = 13.w;

        paddding5 = 12.w;
        paddding29 = 25.w;
        paddding30 = 5.w;
        //الخاصة بالسعر
        translator.currentLanguage == 'en'
            ? paddding31 = 30.h
            : paddding31 = 30.h;
        paddding7 = 31.h;

        paddding32 = 1.w;
        paddding33 = 1.w;
        paddding11 = 25.w;
        paddding12 = 8.w;
        //الخاصة بالأيقونات
        paddding35 = 33.5.h;
        //font size
        paddding36 = 3.7.w;
        //التباعد
        translator.currentLanguage == 'en'
            ? paddding14 = 0.7.w
            : paddding14 = 0.00002.w;
        translator.currentLanguage == 'en' ? subString = 17 : subString = 16;
        translator.currentLanguage == 'en' ? subString2 = 35 : subString2 = 30;

        translator.currentLanguage == 'en' ? substring3 = 17 : substring3 = 18;

        translator.currentLanguage == 'en'
            ? paddding4 = 20.w
            : paddding4 = MediaQuery.of(context).size.width * 0.015;
        translator.currentLanguage == 'en'
            ? paddding4 = 20.w
            : paddding4 = MediaQuery.of(context).size.width * 0.015;

        translator.currentLanguage == 'en'
            ? paddding4 = 20.w
            : paddding4 = MediaQuery.of(context).size.width * 0.015;
        paddding40 = 5.5.w;
        paddding52 = 5.5.w;
        paddding46 = 5.w;
        //المجال ما بين الريسيت و السورت
        translator.currentLanguage == 'en'
            ? paddding23 = 148.w
            : paddding23 = 122.w;
        paddding39 = 6.w;
        paddding47 = 14.w;
        //ارتفاع قائمة السورت
        translator.currentLanguage == 'en'
            ? paddding22 = 0.29.w
            : paddding22 = 0.28.w;
        paddding18 = 9.w;
        paddding17 = 45.w;
        paddding19 = 12.w;
        paddding43 = 5.6.w;
        paddding41 = 4.5.w;
        paddding24 = 60.w;
        paddding42 = 7.w;
        paddding20 = 9.w;
        paddding27 = 16.w;
        //ارتفاع قائمة الفلتر
        paddding16 = 0.25.w;
        translator.currentLanguage == 'en'
            ? paddding48 = 28.w
            : paddding48 = 28.w;
        //////////////////////////////
        if (SizerUtil.width >= 290 &&
            SizerUtil.width <= 340 &&
            (SizerUtil.height >= 585 && SizerUtil.height <= 730)) {
          print("1");
          translator.currentLanguage == 'en'
              ? paddding22 = 0.295.w
              : paddding22 = 0.30.w;

          //المجال ما بين الريسيت و السورت
          translator.currentLanguage == 'en'
              ? paddding23 = 143.w
              : paddding23 = 140.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.w
              : paddding14 = 0.00002.w;
          // paddding16 = 0.03.w;
        }

        if (SizerUtil.width > 320 &&
            SizerUtil.width <= 360 &&
            (SizerUtil.height >= 740 && SizerUtil.height < 800)) {
          print("1a");
          paddding38 = 0.275.w;
          paddding31 = 33.h;
          paddding35 = 35.h;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.w
              : paddding14 = 0.3.w;
          paddding22 = 0.24.w;

          translator.currentLanguage == 'en'
              ? paddding23 = 155.w
              : paddding23 = 150.w;
          paddding7 = 32.h;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 20;

          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
          paddding16 = 0.21.w;
        }
        if (SizerUtil.width >= 360 &&
            SizerUtil.width < 480 &&
            SizerUtil.height > 560 &&
            SizerUtil.height < 610) {
          print("2b");
          translator.currentLanguage == 'en'
              ? paddding22 = 0.235.w
              : paddding22 = 0.235.w;

          translator.currentLanguage == 'en'
              ? paddding23 = 120.w
              : paddding23 = 110.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }

        if (SizerUtil.width > 320 &&
            SizerUtil.width <= 360 &&
            (SizerUtil.height >= 800 && SizerUtil.height < 850)) {
          print("2");
          paddding38 = 0.275.w;
          paddding31 = 35.h;
          paddding35 = 35.h;
          translator.currentLanguage == 'en'
              ? paddding14 = 3.w
              : paddding14 = 0.9.w;
          paddding36 = 4.7.w;
          paddding22 = 0.24.w;
          paddding7 = 33.h;
          translator.currentLanguage == 'en'
              ? paddding23 = 173.w
              : paddding23 = 165.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 0.6.w
              : paddding14 = 0.4.w;
          paddding32 = 1.w;
          paddding33 = 5.w;
          translator.currentLanguage == 'en' ? subString = 19 : subString = 16;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        /////////////////////////////
        if (SizerUtil.width > 360) {
          print("3");
          paddding38 = 0.225.w;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
          paddding16 = 0.13.w;
        }
        /////////////////////////////
        if (SizerUtil.width >= 410 &&
            SizerUtil.width <= 450 &&
            (SizerUtil.height >= 725 && SizerUtil.height < 740)) {
          print("4");
          paddding38 = 0.275.w;
          paddding35 = 36.h;
          translator.currentLanguage == 'en'
              ? paddding14 = 1.5.w
              : paddding14 = 0.w;
          paddding22 = 0.20.w;
          translator.currentLanguage == 'en'
              ? paddding31 = 32.h
              : paddding31 = 30.h;
          paddding36 = 4.3.w;
          translator.currentLanguage == 'en' ? subString = 16 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 22;
          paddding16 = 0.19.w;
        }

        if (SizerUtil.width >= 480 &&
            SizerUtil.width <= 500 &&
            (SizerUtil.height >= 740 && SizerUtil.height < 1100)) {
          print("5");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.5.w
              : paddding14 = 0.3.w;
          paddding22 = 0.17.w;

          paddding36 = 4.7.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 165.w
              : paddding23 = 160.w;
          paddding7 = 32.h;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width >= 410 &&
            SizerUtil.width <= 450 &&
            (SizerUtil.height >= 740 && SizerUtil.height < 1100)) {
          print("6");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;
          paddding7 = 32.h;

          translator.currentLanguage == 'en'
              ? paddding14 = 3.2.w
              : paddding14 = 0.3.w;
          paddding22 = 0.21.w;

          translator.currentLanguage == 'en'
              ? paddding23 = 170.w
              : paddding23 = 164.w;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
          paddding16 = 0.17.w;
        }
        if (SizerUtil.width >= 360 &&
            SizerUtil.width <= 405 &&
            (SizerUtil.height > 740 && SizerUtil.height < 800)) {
          print("7");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;

          translator.currentLanguage == 'en'
              ? paddding14 = 3.3.w
              : paddding14 = 0.3.w;
          paddding22 = 0.23.w;
          paddding23 = 172.w;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width >= 360 &&
            SizerUtil.width <= 405 &&
            (SizerUtil.height > 800 && SizerUtil.height < 820)) {
          print("10");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;
          paddding7 = 32.h;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.7.w
              : paddding14 = 0.0.w;
          paddding22 = 0.23.w;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 169.w
              : paddding23 = 163.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width >= 501 &&
            SizerUtil.width <= 540 &&
            (SizerUtil.height >= 740 && SizerUtil.height < 1100)) {
          print("8");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.5.w
              : paddding14 = 0.3.w;
          paddding22 = 0.15.w;
          paddding7 = 32.h;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 155.w
              : paddding23 = 148.w;
          translator.currentLanguage == 'en' ? subString = 16 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width >= 790 &&
            SizerUtil.width <= 850 &&
            (SizerUtil.height > 1100 && SizerUtil.height <= 1290)) {
          print("9");
          paddding38 = 0.275.w;
          paddding31 = 31.h;
          paddding35 = 37.h;

          translator.currentLanguage == 'en'
              ? paddding22 = 0.0985.w
              : paddding22 = 0.1.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 117.w
              : paddding23 = 112.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 0.7.w
              : paddding14 = 0.004.w;
          paddding36 = 3.7.w;
          paddding7 = 33.h;
          translator.currentLanguage == 'en'
              ? paddding48 = 25.w
              : paddding48 = 25.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
          paddding16 = 0.1.w;
        }
      }
      if (SizerUtil.deviceType == DeviceType.tablet) {
        print("tablet");
        print("SizerUtil.width${SizerUtil.width}");
        leadingSize = 0.16.w;
        paddding44 = 13.w;
        paddding5 = 12.w;
        paddding29 = 25.w;
        paddding30 = 5.w;
        //الخاصة بالسعر
        translator.currentLanguage == 'en'
            ? paddding31 = 30.h
            : paddding31 = 30.h;
        paddding7 = 31.h;
        paddding32 = 1.w;
        paddding33 = 1.w;
        paddding11 = 25.w;

        paddding12 = 8.w;
        //الخاصة بالأيقونات
        paddding35 = 33.5.h;
        //font size
        paddding36 = 3.7.w;
        //التباعد
        translator.currentLanguage == 'en'
            ? paddding14 = 0.7.w
            : paddding14 = 0.00002.w;
        translator.currentLanguage == 'en' ? subString = 15 : subString = 15;
        translator.currentLanguage == 'en' ? subString2 = 30 : subString2 = 30;
        paddding40 = 4.2.w;
        paddding52 = 2.3.w;
        paddding46 = 5.w;
        //المجال ما بين الريسيت و السورت
        translator.currentLanguage == 'en'
            ? paddding23 = 130.w
            : paddding23 = 122.w;
        paddding39 = 6.w;
        paddding47 = 14.w;
        //ارتفاع قائمة السورت
        translator.currentLanguage == 'en'
            ? paddding22 = 0.26.w
            : paddding22 = 0.28.w;
        paddding18 = 9.w;
        paddding17 = 45.w;
        paddding19 = 12.w;
        paddding43 = 5.6.w;
        paddding41 = 4.5.w;
        paddding24 = 60.w;
        paddding42 = 7.w;
        paddding20 = 9.w;
        paddding27 = 16.w;
        translator.currentLanguage == 'en'
            ? paddding48 = 28.w
            : paddding48 = 28.w;
        paddding16 = 0.1.w;
        //ارتفاع قائمة الفلتر
        paddding16 = 0.25.w;
        translator.currentLanguage == 'en' ? subString = 17 : subString = 16;
        translator.currentLanguage == 'en' ? subString2 = 35 : subString2 = 30;
        print("paddding16\n\n$paddding16");
        //////////////////////////////
        if (SizerUtil.width > 320 &&
            SizerUtil.width <= 360 &&
            (SizerUtil.height >= 740 && SizerUtil.height < 800)) {
          print("1");
          paddding38 = 0.275.w;
          paddding31 = 33.h;
          paddding35 = 35.h;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.w
              : paddding14 = 0.3.w;
          paddding22 = 0.24.w;

          translator.currentLanguage == 'en'
              ? paddding23 = 155.w
              : paddding23 = 150.w;
          paddding7 = 32.h;
        }
        if (SizerUtil.width > 320 &&
            SizerUtil.width <= 360 &&
            (SizerUtil.height >= 740 && SizerUtil.height < 800)) {
          print("1a");
          paddding38 = 0.275.w;
          paddding31 = 33.h;
          paddding35 = 35.h;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.w
              : paddding14 = 0.3.w;
          paddding22 = 0.24.w;

          translator.currentLanguage == 'en'
              ? paddding23 = 155.w
              : paddding23 = 150.w;
          paddding7 = 32.h;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width > 320 &&
            SizerUtil.width <= 360 &&
            (SizerUtil.height >= 800 && SizerUtil.height < 850)) {
          print("2");
          paddding38 = 0.275.w;
          paddding31 = 35.h;
          paddding35 = 35.h;
          translator.currentLanguage == 'en'
              ? paddding14 = 3.w
              : paddding14 = 0.9.w;
          paddding36 = 4.7.w;
          paddding22 = 0.24.w;
          paddding7 = 33.h;
          translator.currentLanguage == 'en'
              ? paddding23 = 173.w
              : paddding23 = 165.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 0.6.w
              : paddding14 = 0.4.w;
          paddding32 = 1.w;
          paddding33 = 5.w;
          translator.currentLanguage == 'en' ? subString = 19 : subString = 16;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width >= 360 &&
            SizerUtil.width < 480 &&
            SizerUtil.height > 560 &&
            SizerUtil.height < 610) {
          print("2b");
          translator.currentLanguage == 'en'
              ? paddding22 = 0.235.w
              : paddding22 = 0.235.w;

          translator.currentLanguage == 'en'
              ? paddding23 = 120.w
              : paddding23 = 110.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        /////////////////////////////
        if (SizerUtil.width > 750) {
          print("3");
          paddding38 = 0.225.w;

          translator.currentLanguage == 'en'
              ? paddding36 = 3.5.w
              : paddding36 = 3.1.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 0.7.w
              : paddding14 = 0.002.w;
          translator.currentLanguage == 'en'
              ? paddding22 = 0.103.w
              : paddding22 = 0.106.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 93.w
              : paddding23 = 86.w;
          translator.currentLanguage == 'en'
              ? paddding31 = 28.h
              : paddding31 = 28.h;
          paddding7 = 32.h;
          translator.currentLanguage == 'en' ? subString = 13 : subString = 12;
          translator.currentLanguage == 'en'
              ? subString2 = 25
              : subString2 = 25;
          paddding16 = 0.1.w;
        }

        if (SizerUtil.width > 900 && SizerUtil.width < 1100) {
          print("3a");
          paddding38 = 0.225.w;

          translator.currentLanguage == 'en'
              ? paddding36 = 3.5.w
              : paddding36 = 3.3.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 0.7.w
              : paddding14 = 0.1.w;
          translator.currentLanguage == 'en'
              ? paddding22 = 0.075.w
              : paddding22 = 0.08.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 93.w
              : paddding23 = 86.w;
          paddding7 = 32.h;
          translator.currentLanguage == 'en'
              ? paddding31 = 29.h
              : paddding31 = 29.h;
          paddding16 = 0.07.w;
          print("paddding16\n\n$paddding16");
        }
        if (SizerUtil.width > 1100 && SizerUtil.width < 1300) {
          print("3b");
          paddding38 = 0.225.w;
          translator.currentLanguage == 'en'
              ? paddding36 = 3.5.w
              : paddding36 = 3.3.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 0.7.w
              : paddding14 = 0.1.w;
          translator.currentLanguage == 'en'
              ? paddding22 = 0.075.w
              : paddding22 = 0.08.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 112.w
              : paddding23 = 105.w;
          paddding7 = 32.h;
          translator.currentLanguage == 'en'
              ? paddding31 = 31.h
              : paddding31 = 31.h;

          translator.currentLanguage == 'en'
              ? paddding22 = 0.06.w
              : paddding22 = 0.062.w;
          paddding16 = 0.06.w;
        }
        /////////////////////////////
        if (SizerUtil.width >= 410 &&
            SizerUtil.width <= 450 &&
            (SizerUtil.height >= 725 && SizerUtil.height < 740)) {
          print("4");
          paddding38 = 0.275.w;
          paddding35 = 36.h;
          translator.currentLanguage == 'en'
              ? paddding14 = 1.5.w
              : paddding14 = 0.w;
          paddding22 = 0.20.w;
          translator.currentLanguage == 'en'
              ? paddding31 = 32.h
              : paddding31 = 30.h;
          paddding36 = 4.3.w;
          translator.currentLanguage == 'en' ? subString = 16 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 22;
          paddding16 = 0.19.w;
        }

        if (SizerUtil.width >= 480 &&
            SizerUtil.width <= 500 &&
            (SizerUtil.height >= 740 && SizerUtil.height < 1100)) {
          print("5");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.5.w
              : paddding14 = 0.3.w;
          paddding22 = 0.17.w;

          paddding36 = 4.7.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 165.w
              : paddding23 = 160.w;
          paddding7 = 32.h;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
          paddding16 = 0.17.w;
        }
        if (SizerUtil.width >= 410 &&
            SizerUtil.width <= 450 &&
            (SizerUtil.height >= 740 && SizerUtil.height < 1100)) {
          print("6");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;
          paddding7 = 32.h;

          translator.currentLanguage == 'en'
              ? paddding14 = 3.2.w
              : paddding14 = 0.3.w;
          paddding22 = 0.21.w;

          translator.currentLanguage == 'en'
              ? paddding23 = 170.w
              : paddding23 = 164.w;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width >= 360 &&
            SizerUtil.width <= 405 &&
            (SizerUtil.height > 740 && SizerUtil.height < 800)) {
          print("7");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;

          translator.currentLanguage == 'en'
              ? paddding14 = 3.3.w
              : paddding14 = 0.3.w;
          paddding22 = 0.23.w;
          paddding23 = 172.w;
          paddding36 = 4.7.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width >= 360 &&
            SizerUtil.width <= 405 &&
            (SizerUtil.height > 800 && SizerUtil.height < 820)) {
          print("10");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;
          paddding7 = 32.h;

          translator.currentLanguage == 'en'
              ? paddding14 = 2.5.w
              : paddding14 = 0.3.w;
          paddding22 = 0.23.w;

          paddding36 = 4.7.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 169.w
              : paddding23 = 163.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width >= 501 &&
            SizerUtil.width <= 540 &&
            (SizerUtil.height >= 740 && SizerUtil.height < 1100)) {
          print("8");
          paddding38 = 0.275.w;
          paddding31 = 34.h;
          paddding35 = 36.h;

          translator.currentLanguage == 'en'
              ? paddding14 = 2.5.w
              : paddding14 = 0.3.w;
          paddding22 = 0.15.w;
          paddding7 = 32.h;

          paddding36 = 4.7.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 155.w
              : paddding23 = 148.w;
          translator.currentLanguage == 'en' ? subString = 16 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        if (SizerUtil.width >= 790 &&
            SizerUtil.width <= 850 &&
            (SizerUtil.height > 1100 && SizerUtil.height <= 1290)) {
          print("9");
          paddding38 = 0.275.w;
          paddding31 = 31.h;
          paddding35 = 37.h;

          translator.currentLanguage == 'en'
              ? paddding22 = 0.0985.w
              : paddding22 = 0.1.w;
          translator.currentLanguage == 'en'
              ? paddding23 = 123.w
              : paddding23 = 114.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 0.7.w
              : paddding14 = 0.004.w;
          paddding36 = 3.7.w;
          paddding7 = 33.h;
          translator.currentLanguage == 'en'
              ? paddding48 = 25.w
              : paddding48 = 25.w;
          translator.currentLanguage == 'en' ? subString = 17 : subString = 14;
          translator.currentLanguage == 'en'
              ? subString2 = 30
              : subString2 = 25;
        }
        /* paddding5 = 12.w;
        paddding29 = 25.w;
        paddding30 = 5.w;
        paddding31 = 34.h;
        paddding7 = 30.h;
        paddding32 = 1.w;
        paddding33 = 1.w;
        paddding11 = 25.w;
        paddding12 = 8.w;
        paddding35 = 37.h;
        paddding36 = 5.w;

        translator.currentLanguage == 'en'
            ? paddding14 = 2.2.w
            : paddding14 = 0.4.w;
        subString = 10;
        if (SizerUtil.width <= 360) {
          paddding36 = 4.7.w;
          paddding38 = 0.275.w;
        }
        if (SizerUtil.width > 360) {
          paddding36 = 4.7.w;
          paddding38 = 0.225.w;
        }
        if (SizerUtil.width > 700 && SizerUtil.width < 790) {
          //tablet
          print("hmm");
          paddding35 = 50.w;
          paddding5 = 11.w;
          paddding31 = 38.w;
          paddding38 = 0.83;
          paddding36 = 4.6.w;
          paddding29 = 0.5.w;
        }
        if (SizerUtil.width > 450 && SizerUtil.width < 500) {
          paddding35 = 80.w;
          paddding5 = 11.w;
          paddding31 = 34.h;
          paddding38 = 0.21.w;
          paddding36 = 4.6.w;
          paddding29 = 0.5.w;
        }
        if (SizerUtil.width >= 540 && SizerUtil.width < 560) {
          paddding35 = 80.w;
          paddding5 = 11.w;
          paddding31 = 38.w;
          paddding38 = 0.185.w;
          paddding36 = 4.6.w;
          paddding29 = 0.5.w;
        }*/

      }

      translator.currentLanguage == 'en'
          ? paddding = 0
          : paddding = MediaQuery.of(context).size.width * 0.01;

      translator.currentLanguage == 'en'
          ? landscape = MediaQuery.of(context).size.width * 0.50
          : landscape = MediaQuery.of(context).size.width * 0.435;

      translator.currentLanguage == 'en'
          ? paddding3 = MediaQuery.of(context).size.width * 0.008
          : paddding3 = MediaQuery.of(context).size.width * 0.02;

      translator.currentLanguage == 'en'
          ? paddding4 = MediaQuery.of(context).size.width * 0.42
          : paddding4 = MediaQuery.of(context).size.width * 0.015;

      //  paddding5 = MediaQuery.of(context).size.height * 0.12;
      //  paddding5 = 13.w;
      paddding6 = MediaQuery.of(context).size.height * 0.13;

      paddding8 = MediaQuery.of(context).size.height * 0.1;
      paddding9 = MediaQuery.of(context).size.width * 0.09;

      paddding10 = MediaQuery.of(context).size.width * 0.06;

      //  paddding11 = MediaQuery.of(context).size.width * 0.15;
      //  paddding12 = MediaQuery.of(context).size.height * 0.067;
      paddding13 = MediaQuery.of(context).size.height * 0.09;
      //   paddding14 = MediaQuery.of(context).size.height * 0.027;
//paddding15 = MediaQuery.of(context).size.height * 0.03;

      //  paddding16 = 2;
      // paddding20 = MediaQuery.of(context).size.height * 0.1;
      paddding21 = MediaQuery.of(context).size.width * 0.25;
      // paddding22 = MediaQuery.of(context).size.height * 0.00253;
      // paddding23 = MediaQuery.of(context).size.width * 0.75;
      // paddding24 = MediaQuery.of(context).size.width * 0.55;
      paddding25 = MediaQuery.of(context).size.height * 0.03;
      paddding26 = MediaQuery.of(context).size.height * 0.02;
      // paddding27 = MediaQuery.of(context).size.height * 0.15;
//padding 3 = 0.02

    }

    return WillPopScope(
      onWillPop: redirectTo,
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          resizeToAvoidBottomInset: false,
          appBar: buildBar(context),
          body: OrientationBuilder(builder: (context, orientation) {
            return Column(
              children: <Widget>[
                AppBar(
                    flexibleSpace: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 1.w, left: 1.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.5.w,
                                width: paddding48,
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  child: Row(
                                    // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.filter_list, size: 6.w),
                                      Text(
                                        translator.translate("Filters"),
                                        style: TextStyle(fontSize: 4.w),
                                      )
                                    ],
                                  ),
                                  // ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return StatefulBuilder(builder:
                                            (BuildContext context,
                                                void Function(void Function())
                                                    setState) {
                                          return Container(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.001),
                                            child: DraggableScrollableSheet(
                                              initialChildSize: paddding16,
                                              maxChildSize: paddding16,
                                              builder: (context,
                                                  ScrollController
                                                      scrollController) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          const Radius.circular(
                                                              15.0),
                                                      topRight:
                                                          const Radius.circular(
                                                              15.0),
                                                    ),
                                                  ),
                                                  child: SingleChildScrollView(
                                                    controller:
                                                        scrollController,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 12,
                                                                  left: 12),
                                                          child: Align(
                                                            alignment: translator
                                                                        .currentLanguage ==
                                                                    'en'
                                                                ? Alignment
                                                                    .centerLeft
                                                                : Alignment
                                                                    .centerRight,
                                                            child: Text(
                                                              "${translator.translate("Filter items")}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      paddding40),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(),
                                                        Text(
                                                            "${translator.translate("by Price")}",
                                                            style:
                                                                new TextStyle(
                                                              fontSize:
                                                                  paddding40,
                                                            )),
                                                        RangeSlider(
                                                          activeColor:
                                                              Colors.grey,
                                                          values:
                                                              _currentRangeValuesPriceTest,
                                                          min: 0,
                                                          max: 450000,
                                                          divisions: 90,
                                                          labels: RangeLabels(
                                                            _currentRangeValuesPriceTest
                                                                .start
                                                                .round()
                                                                .toString(),
                                                            _currentRangeValuesPriceTest
                                                                .end
                                                                .round()
                                                                .toString(),
                                                          ),
                                                          onChanged: (values) {
                                                            setState(() {
                                                              _currentRangeValuesPriceTest =
                                                                  values;

                                                              incrementPriceStart =
                                                                  _currentRangeValuesPriceTest
                                                                      .start
                                                                      .round()
                                                                      .toString();

                                                              incrementPriceEnd =
                                                                  _currentRangeValuesPriceTest
                                                                      .end
                                                                      .round()
                                                                      .toString();

                                                              redrawObject =
                                                                  Object();
                                                            });
                                                          },
                                                        ),
                                                        //////
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      paddding17,
                                                                  foregroundDecoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .blueGrey,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        width:
                                                                            paddding18,
                                                                        height:
                                                                            paddding19,
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                border: Border(
                                                                                  bottom: BorderSide(
                                                                                    width: 0.5,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              child: InkWell(
                                                                                child: Icon(
                                                                                  //First container left
                                                                                  Icons.arrow_drop_up,
                                                                                  size: paddding43,
                                                                                ),
                                                                                onTap: () {
                                                                                  double currentValue = double.parse(incrementPriceStart);

                                                                                  setState(() {
                                                                                    currentValue = currentValue + 5000;

                                                                                    incrementPriceStart = (currentValue).toString(); // incrementing value
                                                                                    _currentRangeValuesPriceTest.start = currentValue;

                                                                                    print("currrrrrrentValue$currentValue");
                                                                                    //    values1.start.toInt=int.parse(controller.text);
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              child: Icon(
                                                                                Icons.arrow_drop_down,
                                                                                size: paddding43,
                                                                              ),
                                                                              onTap: () {
                                                                                double currentValue = double.parse(incrementPriceStart);
                                                                                setState(() {
                                                                                  currentValue = currentValue - 5000;
                                                                                  incrementPriceStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                  _currentRangeValuesPriceTest.start = (currentValue > 0 ? currentValue : 0).toDouble();
                                                                                });
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                            incrementPriceStart.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"),
                                                                                ""),
                                                                            style: new TextStyle(
                                                                              fontSize: paddding41,
                                                                            )),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      paddding17,
                                                                  foregroundDecoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .blueGrey,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        width:
                                                                            paddding18,
                                                                        height:
                                                                            paddding19,
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                border: Border(
                                                                                  bottom: BorderSide(
                                                                                    width: 0.5,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              child: InkWell(
                                                                                child: Icon(
                                                                                  Icons.arrow_drop_up,
                                                                                  size: paddding43,
                                                                                ),
                                                                                onTap: () {
                                                                                  double currentValue = double.parse(incrementPriceEnd);
                                                                                  setState(() {
                                                                                    currentValue = currentValue + 5000;

                                                                                    incrementPriceEnd = (currentValue).toString(); // incrementing value

                                                                                    incrementPriceEnd = (currentValue < 450000 ? currentValue : 450000).toString();

                                                                                    _currentRangeValuesPriceTest.end = (currentValue < 450000 ? currentValue : 450000);
                                                                                    //    values1.start.toInt=int.parse(controller.text);
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              child: Icon(
                                                                                Icons.arrow_drop_down,
                                                                                size: paddding43,
                                                                              ),
                                                                              onTap: () {
                                                                                double currentValue = double.parse(incrementPriceEnd);
                                                                                setState(() {
                                                                                  currentValue = currentValue - 5000;

                                                                                  incrementPriceEnd = (currentValue > 0 ? currentValue : 0).toString(); // incrementing value

                                                                                  _currentRangeValuesPriceTest.end = (currentValue > 0 ? currentValue : 0).toDouble();
                                                                                });
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                            incrementPriceEnd,
                                                                            style:
                                                                                new TextStyle(
                                                                              fontSize: paddding41,
                                                                            )),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          thickness: 1,
                                                          endIndent: 8,
                                                          indent: 8,
                                                        ),
/*
                                                       bool checkedValue = false;
                                                      bool checkedValueColorBlue=false;

                                                     bool checkedValueColorBlack,checkedValueColorGold;
                                                     bool checkedvaluememory = false;*/

                                                        /* Text("By Color"),
                                                            SizedBox(
                                                               height: paddding26),
                                                           Row(
                                                             mainAxisAlignment:
                                                                 MainAxisAlignment
                                                                     .spaceAround,
                                                             children: [
                                                               FilterChip(
                                                                 label: Text('Black'),
                                                                 selected:
                                                                     checkedValueColorBlack,
                                                                 selectedColor: Colors
                                                                     .orange[200],
                                                                 onSelected:
                                                                     (bool value) {
                                                                   setState(() {
                                                                     onChangeColor = 1;
                                                                     checkedValueColorBlack =
                                                                         !checkedValueColorBlack;

                                                                     if (checkedValueColorBlack ==
                                                                         true) {
                                                                       if (!colors
                                                                           .contains(
                                                                               "Black")) {
                                                                         colors.add(
                                                                             "Black");
                                                                       }
                                                                     } else {
                                                                       colors.remove(
                                                                           "Black");
                                                                     }
                                                                   });
                                                                 },
                                                               ),
                                                               FilterChip(
                                                                 label: Text('Blue'),
                                                                 selectedColor: Colors
                                                                     .orange[200],
                                                                 selected:
                                                                     checkedValueColorBlue,
                                                                 onSelected:
                                                                     (bool value) {
                                                                   setState(() {
                                                                     onChangeColor = 1;
                                                                     checkedValueColorBlue =
                                                                         !checkedValueColorBlue; 
                                                                     if (checkedValueColorBlue ==
                                                                         true) {
                                                                       if (!colors
                                                                           .contains(
                                                                               "Blue")) {
                                                                         colors.add(
                                                                             "Blue");
                                                                       }
                                                                     } else {
                                                                       colors.remove(
                                                                           "Blue");
                                                                     }
                                                                   });
                                                                 },
                                                               ),
                                                               FilterChip(
                                                                 label: Text('Gold'),
                                                                 selectedColor: Colors
                                                                     .orange[200],
                                                                 selected:
                                                                     checkedValueColorGold,
                                                                 onSelected:
                                                                     (bool value) {
                                                                   setState(() {
                                                                     onChangeColor = 1;
                                                                     checkedValueColorGold =
                                                                         !checkedValueColorGold;

                                                                     if (checkedValueColorGold ==
                                                                         true) {
                                                                       print("ok");
                                                                       if (!colors
                                                                           .contains(
                                                                               "Gold")) {
                                                                         colors.add(
                                                                             "Gold");
                                                                       }
                                                                     } else {
                                                                       colors.remove(
                                                                           "Gold");
                                                                     }
                                                                   });
                                                                 },
                                                               ),
                                                             ],
                                                           ),*/

                                                        Text(
                                                            "${translator.translate("by Materials")}",
                                                            style:
                                                                new TextStyle(
                                                              fontSize:
                                                                  paddding40,
                                                            )),
                                                        SizedBox(
                                                            height: paddding25),
                                                        SizedBox(
                                                          height: paddding44,
                                                          width: paddding17,
                                                          child: OutlinedButton(
                                                            child: Text(
                                                                "${translator.translate('Choose')}",
                                                                style:
                                                                    new TextStyle(
                                                                  fontSize:
                                                                      paddding40 -
                                                                          0.6,
                                                                )),
                                                            style:
                                                                OutlinedButton
                                                                    .styleFrom(
                                                              primary:
                                                                  Colors.orange,
                                                            ),
                                                            onPressed: () {
                                                              _preLocation();
                                                              /* test();
                                                                 _handleSearchStart();*/
                                                            },
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 1,
                                                          endIndent: 8,
                                                          indent: 8,
                                                        ),
                                                        Text(
                                                            "${translator.translate("by Usage")}",
                                                            style:
                                                                new TextStyle(
                                                              fontSize:
                                                                  paddding40,
                                                            )),
                                                        SizedBox(
                                                            height: paddding25),
                                                        Container(
                                                          width: paddding24,
                                                          child:
                                                              DropdownButtonFormField(
                                                            isExpanded: true,
                                                            hint: Text(
                                                                "${translator.translate("Select")}"),
                                                            value:
                                                                _selectedLocationUsage,
                                                            decoration:
                                                                InputDecoration(
                                                                    fillColor:
                                                                        Colors
                                                                            .grey,
                                                                    focusColor:
                                                                        Colors
                                                                            .grey,
                                                                    hoverColor:
                                                                        Colors
                                                                            .grey,
                                                                    contentPadding:
                                                                        EdgeInsets.fromLTRB(
                                                                            15,
                                                                            paddding42,
                                                                            15,
                                                                            0),
                                                                    isDense:
                                                                        true,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.grey),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                        const Radius.circular(
                                                                            5.0),
                                                                      ),
                                                                    )),
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                _selectedLocationUsage =
                                                                    newValue;
                                                                print(
                                                                    _selectedLocationUsage);
                                                                if (newValue ==
                                                                        'All' ||
                                                                    newValue ==
                                                                        'الكل') {
                                                                  choiceUsage =
                                                                      10;
                                                                } else
                                                                  choiceUsage =
                                                                      1;
                                                                indexUsage =
                                                                    usage.indexOf(
                                                                        newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return usage.map<
                                                                      Widget>(
                                                                  (String
                                                                      text) {
                                                                return Text(
                                                                  text,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                );
                                                              }).toList();
                                                            },
                                                            items: usage.map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                text) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: text,
                                                                child: Column(
                                                                  children: [
                                                                    Text(text,
                                                                        maxLines:
                                                                            3,
                                                                        overflow:
                                                                            TextOverflow.ellipsis),
                                                                    Divider(),
                                                                    SizedBox(height: 10),
                                                                  ],
                                                                ),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 1,
                                                          endIndent: 8,
                                                          indent: 8,
                                                        ),
                                                        Text(
                                                            "${translator.translate("by age")}",
                                                            style:
                                                                new TextStyle(
                                                              fontSize:
                                                                  paddding40,
                                                            )),
                                                        SizedBox(
                                                            height: paddding25),
                                                        Container(
                                                          width: paddding24,
                                                          child:
                                                              DropdownButtonFormField(
                                                            isExpanded: true,
                                                            hint: Text(
                                                              "${translator.translate("Select")}",
                                                            ),
                                                            value:
                                                                _selectedLocationAge,
                                                            decoration:
                                                                InputDecoration(
                                                                    fillColor:
                                                                        Colors
                                                                            .grey,
                                                                    focusColor:
                                                                        Colors
                                                                            .grey,
                                                                    hoverColor:
                                                                        Colors
                                                                            .grey,
                                                                    contentPadding:
                                                                        EdgeInsets.fromLTRB(
                                                                            15,
                                                                            paddding42,
                                                                            15,
                                                                            0),
                                                                    isDense:
                                                                        true,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.grey),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                        const Radius.circular(
                                                                            5.0),
                                                                      ),
                                                                    )),
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                _selectedLocationAge =
                                                                    newValue;

                                                                if (newValue ==
                                                                        'All' ||
                                                                    newValue ==
                                                                        'الكل') {
                                                                  choiceAge =
                                                                      10;
                                                                } else
                                                                  choiceAge = 1;
                                                                indexAge =
                                                                    age.indexOf(
                                                                        newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return age.map<
                                                                      Widget>(
                                                                  (String
                                                                      text) {
                                                                return Text(
                                                                  text,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                );
                                                              }).toList();
                                                            },
                                                            items: age.map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                text) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: text,
                                                                child: Column(
                                                                  children: [
                                                                    Text(text,
                                                                        maxLines:
                                                                            3,
                                                                        overflow:
                                                                            TextOverflow.ellipsis),
                                                                    Divider(),
                                                                    SizedBox(height: 10,),
                                                                  ],
                                                                ),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                        /*  Container(
                                                          width: paddding24,
                                                          child:
                                                              DropdownButtonFormField(
                                                            iconSize: 6.w,
                                                            isExpanded: true,
                                                            decoration:
                                                                InputDecoration(
                                                                    fillColor:
                                                                        Colors
                                                                            .grey,
                                                                    focusColor:
                                                                        Colors
                                                                            .grey,
                                                                    hoverColor:
                                                                        Colors
                                                                            .grey,
                                                                    contentPadding:
                                                                        EdgeInsets.fromLTRB(
                                                                            15,
                                                                            paddding42,
                                                                            15,
                                                                            0),
                                                                    isDense: true,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color:
                                                                                  Colors.grey),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                        const Radius
                                                                                .circular(
                                                                            5.0),
                                                                      ),
                                                                    )),
                                                            hint: FittedBox(
                                                              fit: BoxFit.contain,
                                                              child: Text(
                                                                  "${translator.translate("Select")}",
                                                                  style:
                                                                      new TextStyle(
                                                                    fontSize:
                                                                        paddding40,
                                                                  )),
                                                            ), // Not necessary for Option 1
                                                            value:
                                                                _selectedLocationAge,
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                _selectedLocationAge =
                                                                    newValue;
                                                                if (newValue ==
                                                                        'All' ||
                                                                    newValue ==
                                                                        'الكل') {
                                                                  choiceAge = 10;
                                                                } else
                                                                  choiceAge = 1;
                                                              });
                                                              print(
                                                                  "_selectedLocation$_selectedLocationAge");
                                                            },
                                                            items: age
                                                                .map((location) {
                                                              return DropdownMenuItem(
                                                                child: Column(
                                                                  children: [
                                                                    new Text(
                                                                        location),
                                                                    Divider(
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  ],
                                                                ),
                                                                value: location,
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      */
                                                        Divider(
                                                          thickness: 1,
                                                          endIndent: 8,
                                                          indent: 8,
                                                        ),
                                                        Text(
                                                            "${translator.translate("by condition")}",
                                                            style:
                                                                new TextStyle(
                                                              fontSize:
                                                                  paddding40,
                                                            )),
                                                        SizedBox(
                                                            height: paddding25),

                                                        Container(
                                                          width: paddding24,
                                                          child:
                                                              DropdownButtonFormField(
                                                            isExpanded: true,
                                                            hint: Text(
                                                                "${translator.translate("Select")}"),
                                                            value:
                                                                _selectedLocationCondition,
                                                            decoration:
                                                                InputDecoration(
                                                                    fillColor:
                                                                        Colors
                                                                            .grey,
                                                                    focusColor:
                                                                        Colors
                                                                            .grey,
                                                                    hoverColor:
                                                                        Colors
                                                                            .grey,
                                                                    contentPadding:
                                                                        EdgeInsets.fromLTRB(
                                                                            15,
                                                                            paddding42,
                                                                            15,
                                                                            0),
                                                                    isDense:
                                                                        true,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.grey),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                        const Radius.circular(
                                                                            5.0),
                                                                      ),
                                                                    )),
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                _selectedLocationCondition =
                                                                    newValue;

                                                                if (newValue ==
                                                                        'All' ||
                                                                    newValue ==
                                                                        'الكل') {
                                                                  choiceCondition =
                                                                      10;
                                                                } else
                                                                  choiceCondition =
                                                                      1;
                                                                indexCondition =
                                                                    condition
                                                                        .indexOf(
                                                                            newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return condition
                                                                  .map<Widget>(
                                                                      (String
                                                                          text) {
                                                                return Text(
                                                                  text,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                );
                                                              }).toList();
                                                            },
                                                            items: condition.map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                text) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: text,
                                                                child: Column(
                                                                  children: [
                                                                    Text(text,
                                                                        maxLines:
                                                                            3,
                                                                        overflow:
                                                                            TextOverflow.ellipsis),
                                                                    Divider(),
                                                                    SizedBox(height: 10,),
                                                                  ],
                                                                ),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                        /*
                                                        Container(
                                                          width: paddding24,
                                                          child: Expanded(
                                                            child:
                                                                DropdownButtonFormField(
                                                              iconSize: 6.w,
                                                              isExpanded: true,

                                                              decoration:
                                                                  InputDecoration(
                                                                      fillColor:
                                                                          Colors
                                                                              .grey,
                                                                      focusColor:
                                                                          Colors
                                                                              .grey,
                                                                      hoverColor:
                                                                          Colors
                                                                              .grey,
                                                                      contentPadding:
                                                                          EdgeInsets.fromLTRB(
                                                                              15,
                                                                              paddding42,
                                                                              15,
                                                                              0),
                                                                      isDense:
                                                                          true,
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                                color: Colors.grey),
                                                                        borderRadius:
                                                                            const BorderRadius
                                                                                .all(
                                                                          const Radius.circular(
                                                                              5.0),
                                                                        ),
                                                                      )),
                                                              hint: FittedBox(
                                                                fit: BoxFit
                                                                    .contain,
                                                                child: Text(
                                                                    "${translator.translate("Select")}",
                                                                    style:
                                                                        new TextStyle(
                                                                      fontSize:
                                                                          paddding40,
                                                                    )),
                                                              ), // Not necessary for Option 1
                                                              value:
                                                                  _selectedLocationCondition,
                                                              onChanged:
                                                                  (newValue) {
                                                                setState(() {
                                                                  _selectedLocationCondition =
                                                                      newValue;

                                                                  if (newValue ==
                                                                          'All' ||
                                                                      newValue ==
                                                                          'الكل') {
                                                                    choiceCondition =
                                                                        10;
                                                                  } else
                                                                    choiceCondition =
                                                                        1;
                                                                  /* if (newValue ==
                                                                         'Perfect inside and out')
                                                                       choiceCondition = 1;

                                                                     if (newValue ==
                                                                         'Almost no noticeable problems or flaws')
                                                                       choiceCondition = 2;

                                                                     if (newValue ==
                                                                         'A bit of wear and tear, but in good working condition')
                                                                       choiceCondition = 3;

                                                                     if (newValue ==
                                                                         'Normal wear and tear for the age of the items, a few problems here and there')
                                                                       choiceCondition = 4;*/
                                                                });
                                                              },
                                                              items: condition
                                                                  .map(
                                                                      (location) {
                                                                return DropdownMenuItem(
                                                                  child: Column(
                                                                    children: [
                                                                      new Text(
                                                                          location),
                                                                      Divider(
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  value: location,
                                                                );
                                                              }).toList(),
                                                            ),
                                                          ),
                                                        ),
                                                     */
                                                        Divider(
                                                          thickness: 1,
                                                          endIndent: 8,
                                                          indent: 8,
                                                        ),

                                                        Text(
                                                            "${translator.translate("by warranty")}",
                                                            style:
                                                                new TextStyle(
                                                              fontSize:
                                                                  paddding40,
                                                            )),
                                                        SizedBox(
                                                            height: paddding25),
                                                        Container(
                                                          width: paddding24,
                                                          child:
                                                              DropdownButtonFormField(
                                                            isExpanded: true,
                                                            hint: Text(
                                                                "${translator.translate("Select")}"),
                                                            value:
                                                                _selectedLocationWarranty,
                                                            decoration:
                                                                InputDecoration(
                                                                    fillColor:
                                                                        Colors
                                                                            .grey,
                                                                    focusColor:
                                                                        Colors
                                                                            .grey,
                                                                    hoverColor:
                                                                        Colors
                                                                            .grey,
                                                                    contentPadding:
                                                                        EdgeInsets.fromLTRB(
                                                                            15,
                                                                            paddding42,
                                                                            15,
                                                                            0),
                                                                    isDense:
                                                                        true,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.grey),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                        const Radius.circular(
                                                                            5.0),
                                                                      ),
                                                                    )),
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                _selectedLocationWarranty =
                                                                    newValue;

                                                                if (newValue ==
                                                                        'All' ||
                                                                    newValue ==
                                                                        'الكل') {
                                                                  choiceWarranty =
                                                                      10;
                                                                } else
                                                                  choiceWarranty =
                                                                      1;

                                                                indexWarranty =
                                                                    warranty.indexOf(
                                                                        newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return warranty
                                                                  .map<Widget>(
                                                                      (String
                                                                          text) {
                                                                return Text(
                                                                  text,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                );
                                                              }).toList();
                                                            },
                                                            items: warranty.map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                text) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: text,
                                                                child: Column(
                                                                  children: [
                                                                    Text(text,
                                                                        maxLines:
                                                                            3,
                                                                        overflow:
                                                                            TextOverflow.ellipsis),
                                                                    Divider()
                                                                  ],
                                                                ),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: paddding28),
                                                        Container(
                                                            height: paddding27,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      spreadRadius:
                                                                          2,
                                                                      blurRadius:
                                                                          3,
                                                                      offset:
                                                                          Offset(
                                                                              6,
                                                                              0),
                                                                      color: Colors
                                                                          .black38)
                                                                ]),
                                                            child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10.0,
                                                                        right:
                                                                            10),
                                                                    child:
                                                                        MaterialButton(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0)),
                                                                      elevation:
                                                                          3,
                                                                      height:
                                                                          paddding20,
                                                                      minWidth:
                                                                          double
                                                                              .infinity,
                                                                      color: Colors
                                                                          .orange,
                                                                      child: Text(
                                                                          "${translator.translate("Apply Filter")}",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize:
                                                                                paddding40,
                                                                          )),
                                                                      onPressed:
                                                                          () {
                                                                        test();
                                                                        _handleSearchStart();
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ),
                                                                ])),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 1.w, left: 1.w),
                          child: SizedBox(
                            height: 10.5.w,
                            width: 20.w,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(CupertinoIcons.arrowtriangle_down_fill,
                                      size: 3.w),
                                  Text(translator.translate("Sort"),
                                      style: TextStyle(fontSize: 4.w)),
                                ],
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return FractionallySizedBox(
                                          heightFactor: paddding22,
                                          child: StatefulBuilder(builder:
                                              (BuildContext context,
                                                  void Function(void Function())
                                                      setState) {
                                            return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Text(
                                                            "${translator.translate("Sort By")}",
                                                            style:
                                                                new TextStyle(
                                                              fontSize:
                                                                  paddding40,
                                                            )),
                                                      ),
                                                      /* SizedBox(
                                                          width: paddding23),*/
                                                      Spacer(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                id = 10;
                                                                _buildSortList();
                                                                _handleSearchStart();
                                                              });
                                                            },
                                                            child: Text(
                                                                "${translator.translate("Reset")}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        paddding46))),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1.5,
                                                    height: 0.1,
                                                  ),
                                                  Expanded(
                                                      child: Column(
                                                    children: sort
                                                        .map((data) => SizedBox(
                                                              height:
                                                                  paddding47,
                                                              child:
                                                                  RadioListTile(
                                                                activeColor:
                                                                    Colors
                                                                        .orange,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .trailing,
                                                                title: Text(
                                                                    "${data.name}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            paddding39)),
                                                                groupValue: id,
                                                                value:
                                                                    data.index,
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    radioItem =
                                                                        data.name;
                                                                    id = data
                                                                        .index;
                                                                  });
                                                                  _buildSortList();
                                                                  _handleSearchStart();
                                                                  /*  Navigator.of(
                                                                          context)
                                                                      .pop();*/
                                                                },
                                                              ),
                                                            ))
                                                        .toList(),
                                                  )),
                                                ]);
                                          }));
                                    });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 1.w, left: 1.w),
                          child: SizedBox(
                            height: 10.5.w,
                            width: 20.w,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(Icons.list_rounded, size: 6.w),
                                  Text(translator.translate("List"),
                                      style: TextStyle(fontSize: 4.w))
                                ],
                              ),
                              onPressed: () {
                                setState(() {
                                  SystemChrome.setPreferredOrientations([
                                    DeviceOrientation.portraitDown,
                                    DeviceOrientation.portraitUp,
                                  ]);
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 1.w, left: 1.w),
                          child: SizedBox(
                            height: 10.5.w,
                            width: 21.w,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(Icons.grid_view, size: 6.w),
                                  Text(translator.translate("Grid"),
                                      style: TextStyle(fontSize: 4.w))
                                ],
                              ),
                              onPressed: () {
                                setState(() {
                                  SystemChrome.setPreferredOrientations([
                                    DeviceOrientation.landscapeRight,
                                    DeviceOrientation.landscapeLeft,
                                  ]);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    /* leading: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 5, left: 5, bottom: 3, top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                child: Row(
                                  // Replace with a Row for horizontal icon + text
                                  children: <Widget>[
                                    Icon(Icons.filter_list),
                                    Text(translator.translate("Filters"))
                                  ],
                                ),
                                // ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              void Function(void Function())
                                                  setState) {
                                        return Container(
                                          color: Color.fromRGBO(0, 0, 0, 0.001),
                                          child: DraggableScrollableSheet(
                                            initialChildSize: paddding16,
                                            maxChildSize: paddding16,
                                            builder: (context,
                                                ScrollController
                                                    scrollController) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            15.0),
                                                    topRight:
                                                        const Radius.circular(
                                                            15.0),
                                                  ),
                                                ),
                                                child: SingleChildScrollView(
                                                  controller: scrollController,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 12,
                                                                left: 12),
                                                        child: Align(
                                                          alignment: translator
                                                                      .currentLanguage ==
                                                                  'en'
                                                              ? Alignment
                                                                  .centerLeft
                                                              : Alignment
                                                                  .centerRight,
                                                          child: Text(
                                                            "${translator.translate("Filter items")}",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(),
                                                      Text(
                                                          "${translator.translate("by Price")}"),
                                                      RangeSlider(
                                                        activeColor: Colors.grey,
                                                        values:
                                                            _currentRangeValuesPriceTest,
                                                        min: 0,
                                                        max: 450000,
                                                        divisions: 90,
                                                        labels: RangeLabels(
                                                          _currentRangeValuesPriceTest
                                                              .start
                                                              .round()
                                                              .toString(),
                                                          _currentRangeValuesPriceTest
                                                              .end
                                                              .round()
                                                              .toString(),
                                                        ),
                                                        onChanged: (values) {
                                                          setState(() {
                                                            _currentRangeValuesPriceTest =
                                                                values;

                                                            incrementPriceStart =
                                                                _currentRangeValuesPriceTest
                                                                    .start
                                                                    .round()
                                                                    .toString();

                                                            incrementPriceEnd =
                                                                _currentRangeValuesPriceTest
                                                                    .end
                                                                    .round()
                                                                    .toString();

                                                            redrawObject =
                                                                Object();
                                                          });
                                                        },
                                                      ),
                                                      //////
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Center(
                                                              child: Container(
                                                                width: paddding17,
                                                                foregroundDecoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  border:
                                                                      Border.all(
                                                                    color: Colors
                                                                        .blueGrey,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Container(
                                                                      width:
                                                                          paddding18,
                                                                      height:
                                                                          paddding19,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              border:
                                                                                  Border(
                                                                                bottom: BorderSide(
                                                                                  width: 0.5,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              child:
                                                                                  Icon(
                                                                                //First container left
                                                                                Icons.arrow_drop_up,
                                                                                size: 18.0,
                                                                              ),
                                                                              onTap:
                                                                                  () {
                                                                                double currentValue = double.parse(incrementPriceStart);

                                                                                setState(() {
                                                                                  currentValue = currentValue + 5000;

                                                                                  incrementPriceStart = (currentValue).toString(); // incrementing value
                                                                                  _currentRangeValuesPriceTest.start = currentValue;

                                                                                  print("currrrrrrentValue$currentValue");
                                                                                  //    values1.start.toInt=int.parse(controller.text);
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            child:
                                                                                Icon(
                                                                              Icons.arrow_drop_down,
                                                                              size:
                                                                                  18.0,
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              double
                                                                                  currentValue =
                                                                                  double.parse(incrementPriceStart);
                                                                              setState(() {
                                                                                currentValue = currentValue - 5000;
                                                                                incrementPriceStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                _currentRangeValuesPriceTest.start = (currentValue > 0 ? currentValue : 0).toDouble();
                                                                              });
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(incrementPriceStart
                                                                          .toString()
                                                                          .replaceAll(
                                                                              RegExp(r"([.]*0)(?!.*\d)"),
                                                                              "")),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Center(
                                                              child: Container(
                                                                width: paddding17,
                                                                foregroundDecoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  border:
                                                                      Border.all(
                                                                    color: Colors
                                                                        .blueGrey,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Container(
                                                                      width:
                                                                          paddding18,
                                                                      height:
                                                                          paddding19,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              border:
                                                                                  Border(
                                                                                bottom: BorderSide(
                                                                                  width: 0.5,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              child:
                                                                                  Icon(
                                                                                Icons.arrow_drop_up,
                                                                                size: 18.0,
                                                                              ),
                                                                              onTap:
                                                                                  () {
                                                                                double currentValue = double.parse(incrementPriceEnd);
                                                                                setState(() {
                                                                                  currentValue = currentValue + 5000;

                                                                                  incrementPriceEnd = (currentValue).toString(); // incrementing value

                                                                                  incrementPriceEnd = (currentValue < 450000 ? currentValue : 450000).toString();

                                                                                  _currentRangeValuesPriceTest.end = (currentValue < 450000 ? currentValue : 450000);
                                                                                  //    values1.start.toInt=int.parse(controller.text);
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            child:
                                                                                Icon(
                                                                              Icons.arrow_drop_down,
                                                                              size:
                                                                                  18.0,
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              double
                                                                                  currentValue =
                                                                                  double.parse(incrementPriceEnd);
                                                                              setState(() {
                                                                                currentValue = currentValue - 5000;

                                                                                incrementPriceEnd = (currentValue > 0 ? currentValue : 0).toString(); // incrementing value

                                                                                _currentRangeValuesPriceTest.end = (currentValue > 0 ? currentValue : 0).toDouble();
                                                                              });
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(
                                                                          incrementPriceEnd),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                        thickness: 1,
                                                        endIndent: 8,
                                                        indent: 8,
                                                      ),
/*
                                                     bool checkedValue = false;
                                                    bool checkedValueColorBlue=false;

                                                   bool checkedValueColorBlack,checkedValueColorGold;
                                                   bool checkedvaluememory = false;*/

                                                      /* Text("By Color"),
                                                          SizedBox(
                                                             height: paddding26),
                                                         Row(
                                                           mainAxisAlignment:
                                                               MainAxisAlignment
                                                                   .spaceAround,
                                                           children: [
                                                             FilterChip(
                                                               label: Text('Black'),
                                                               selected:
                                                                   checkedValueColorBlack,
                                                               selectedColor: Colors
                                                                   .orange[200],
                                                               onSelected:
                                                                   (bool value) {
                                                                 setState(() {
                                                                   onChangeColor = 1;
                                                                   checkedValueColorBlack =
                                                                       !checkedValueColorBlack;

                                                                   if (checkedValueColorBlack ==
                                                                       true) {
                                                                     if (!colors
                                                                         .contains(
                                                                             "Black")) {
                                                                       colors.add(
                                                                           "Black");
                                                                     }
                                                                   } else {
                                                                     colors.remove(
                                                                         "Black");
                                                                   }
                                                                 });
                                                               },
                                                             ),
                                                             FilterChip(
                                                               label: Text('Blue'),
                                                               selectedColor: Colors
                                                                   .orange[200],
                                                               selected:
                                                                   checkedValueColorBlue,
                                                               onSelected:
                                                                   (bool value) {
                                                                 setState(() {
                                                                   onChangeColor = 1;
                                                                   checkedValueColorBlue =
                                                                       !checkedValueColorBlue;

                                                                   if (checkedValueColorBlue ==
                                                                       true) {
                                                                     if (!colors
                                                                         .contains(
                                                                             "Blue")) {
                                                                       colors.add(
                                                                           "Blue");
                                                                     }
                                                                   } else {
                                                                     colors.remove(
                                                                         "Blue");
                                                                   }
                                                                 });
                                                               },
                                                             ),
                                                             FilterChip(
                                                               label: Text('Gold'),
                                                               selectedColor: Colors
                                                                   .orange[200],
                                                               selected:
                                                                   checkedValueColorGold,
                                                               onSelected:
                                                                   (bool value) {
                                                                 setState(() {
                                                                   onChangeColor = 1;
                                                                   checkedValueColorGold =
                                                                       !checkedValueColorGold;

                                                                   if (checkedValueColorGold ==
                                                                       true) {
                                                                     print("ok");
                                                                     if (!colors
                                                                         .contains(
                                                                             "Gold")) {
                                                                       colors.add(
                                                                           "Gold");
                                                                     }
                                                                   } else {
                                                                     colors.remove(
                                                                         "Gold");
                                                                   }
                                                                 });
                                                               },
                                                             ),
                                                           ],
                                                         ),*/

                                                      Text(
                                                          "${translator.translate("by Materials")}"),
                                                      SizedBox(
                                                          height: paddding25),
                                                      OutlinedButton(
                                                        child: Text(
                                                            "${translator.translate('Choose')}"),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          primary: Colors.orange,
                                                        ),
                                                        onPressed: () {
                                                          _preLocation();
                                                          /* test();
                                                             _handleSearchStart();*/
                                                        },
                                                      ),
                                                      Divider(
                                                        thickness: 1,
                                                        endIndent: 8,
                                                        indent: 8,
                                                      ),
                                                      Text(
                                                          "${translator.translate("by Usage")}"),
                                                      SizedBox(
                                                          height: paddding25),
                                                      Container(
                                                        width: paddding24,
                                                        child:
                                                            DropdownButtonFormField(
                                                          isExpanded: true,
                                                          decoration:
                                                              InputDecoration(
                                                                  fillColor:
                                                                      Colors.grey,
                                                                  focusColor:
                                                                      Colors.grey,
                                                                  hoverColor:
                                                                      Colors.grey,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                              15,
                                                                              20,
                                                                              15,
                                                                              0),
                                                                  isDense: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.grey),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                      const Radius
                                                                              .circular(
                                                                          5.0),
                                                                    ),
                                                                  )),
                                                          hint: Text(
                                                              "${translator.translate("Select")}"), // Not necessary for Option 1
                                                          value:
                                                              _selectedLocationUsage,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              _selectedLocationUsage =
                                                                  newValue;

                                                              if (newValue ==
                                                                      'Any' ||
                                                                  newValue ==
                                                                      'الكل') {
                                                                choiceUsage = 10;
                                                              } else
                                                                choiceUsage = 1;
                                                            });
                                                          },
                                                          items: usage
                                                              .map((location) {
                                                            return DropdownMenuItem(
                                                              child: new Text(
                                                                  location),
                                                              value: location,
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1,
                                                        endIndent: 8,
                                                        indent: 8,
                                                      ),
                                                      Text(
                                                          "${translator.translate("by age")}"),
                                                      SizedBox(
                                                          height: paddding25),
                                                      Container(
                                                        width: paddding24,
                                                        child:
                                                            DropdownButtonFormField(
                                                          isExpanded: true,
                                                          decoration:
                                                              InputDecoration(
                                                                  fillColor:
                                                                      Colors.grey,
                                                                  focusColor:
                                                                      Colors.grey,
                                                                  hoverColor:
                                                                      Colors.grey,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                              15,
                                                                              20,
                                                                              15,
                                                                              0),
                                                                  isDense: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.grey),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                      const Radius
                                                                              .circular(
                                                                          5.0),
                                                                    ),
                                                                  )),
                                                          hint: Text(
                                                              "${translator.translate("Select")}"), // Not necessary for Option 1
                                                          value:
                                                              _selectedLocationAge,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              _selectedLocationAge =
                                                                  newValue;
                                                              if (newValue ==
                                                                      'Any' ||
                                                                  newValue ==
                                                                      'الكل') {
                                                                choiceUsage = 10;
                                                              } else
                                                                choiceUsage = 1;

                                                              /* if (newValue ==
                                                                     'Brand New') {
                                                                   choiceAge = 1;
                                                                 }
                                                                 if (newValue ==
                                                                     '0-1 month') {
                                                                   print("Why ");
                                                                   choiceAge = 2;
                                                                 }
                                                                 if (newValue ==
                                                                     '1-6 month') {
                                                                   choiceAge = 3;
                                                                 }
                                                                 if (newValue ==
                                                                     '6-12 month') {
                                                                   choiceAge = 4;
                                                                 }
                                                                 if (newValue ==
                                                                     '1-2 years') {
                                                                   choiceAge = 5;
                                                                 }
                                                                 if (newValue ==
                                                                     '2-5 years') {
                                                                   choiceAge = 5;
                                                                 }
                                                                 if (newValue ==
                                                                     '5-10 years') {
                                                                   choiceAge = 5;
                                                                 }
                                                                 if (newValue ==
                                                                     '10+ years') {
                                                                   choiceAge = 5;
                                                                 }*/
                                                            });
                                                            print(
                                                                "_selectedLocation$_selectedLocationAge");
                                                          },
                                                          items:
                                                              age.map((location) {
                                                            return DropdownMenuItem(
                                                              child: new Text(
                                                                  location),
                                                              value: location,
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1,
                                                        endIndent: 8,
                                                        indent: 8,
                                                      ),
                                                      Text(
                                                          "${translator.translate("by condition")}"),
                                                      SizedBox(
                                                          height: paddding25),
                                                      Container(
                                                        width: paddding24,
                                                        child:
                                                            DropdownButtonFormField(
                                                          isExpanded: true,
                                                          decoration:
                                                              InputDecoration(
                                                                  fillColor:
                                                                      Colors.grey,
                                                                  focusColor:
                                                                      Colors.grey,
                                                                  hoverColor:
                                                                      Colors.grey,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                              15,
                                                                              20,
                                                                              15,
                                                                              0),
                                                                  isDense: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.grey),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                      const Radius
                                                                              .circular(
                                                                          5.0),
                                                                    ),
                                                                  )),
                                                          hint: Text(
                                                              "${translator.translate("Select")}"), // Not necessary for Option 1
                                                          value:
                                                              _selectedLocationCondition,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              _selectedLocationCondition =
                                                                  newValue;

                                                              if (newValue ==
                                                                      'Any' ||
                                                                  newValue ==
                                                                      'الكل') {
                                                                choiceUsage = 10;
                                                              } else
                                                                choiceUsage = 1;
                                                              /* if (newValue ==
                                                                     'Perfect inside and out')
                                                                   choiceCondition = 1;

                                                                 if (newValue ==
                                                                     'Almost no noticeable problems or flaws')
                                                                   choiceCondition = 2;

                                                                 if (newValue ==
                                                                     'A bit of wear and tear, but in good working condition')
                                                                   choiceCondition = 3;

                                                                 if (newValue ==
                                                                     'Normal wear and tear for the age of the items, a few problems here and there')
                                                                   choiceCondition = 4;*/
                                                            });
                                                          },
                                                          items: condition
                                                              .map((location) {
                                                            return DropdownMenuItem(
                                                              child: new Text(
                                                                  location),
                                                              value: location,
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1,
                                                        endIndent: 8,
                                                        indent: 8,
                                                      ),

                                                      Text(
                                                          "${translator.translate("by Materials")}"),
                                                      SizedBox(
                                                          height: paddding25),
                                                      Container(
                                                        width: paddding24,
                                                        child:
                                                            DropdownButtonFormField(
                                                          isExpanded: true,
                                                          decoration:
                                                              InputDecoration(
                                                                  fillColor:
                                                                      Colors.grey,
                                                                  focusColor:
                                                                      Colors.grey,
                                                                  hoverColor:
                                                                      Colors.grey,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                              15,
                                                                              20,
                                                                              15,
                                                                              0),
                                                                  isDense: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.grey),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                      const Radius
                                                                              .circular(
                                                                          5.0),
                                                                    ),
                                                                  )),
                                                          hint: Text(
                                                              "${translator.translate("Select")}"), // Not necessary for Option 1
                                                          value:
                                                              _selectedLocationWarranty,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              _selectedLocationWarranty =
                                                                  newValue;
                                                              if (newValue ==
                                                                      'Any' ||
                                                                  newValue ==
                                                                      'الكل') {
                                                                choiceUsage = 10;
                                                              } else
                                                                choiceUsage = 1;
                                                              /*if (newValue == 'Yes')
                                                                   choiceWarranty = 1;

                                                                 if (newValue == 'No')
                                                                   choiceWarranty = 2;

                                                                 if (newValue ==
                                                                     'Does not Apply')
                                                                   choiceWarranty = 3;*/
                                                            });
                                                          },
                                                          items: warranty
                                                              .map((location) {
                                                            return DropdownMenuItem(
                                                              child: new Text(
                                                                  location),
                                                              value: location,
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: paddding28),
                                                      Container(
                                                          height: paddding27,
                                                          width: double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                    spreadRadius:
                                                                        2,
                                                                    blurRadius: 3,
                                                                    offset:
                                                                        Offset(
                                                                            6, 0),
                                                                    color: Colors
                                                                        .black38)
                                                              ]),
                                                          child: Stack(
                                                              alignment: Alignment
                                                                  .center,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              10.0,
                                                                          right:
                                                                              10),
                                                                  child:
                                                                      MaterialButton(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5.0)),
                                                                    elevation: 3,
                                                                    height:
                                                                        paddding20,
                                                                    minWidth: double
                                                                        .infinity,
                                                                    color: Colors
                                                                        .orange,
                                                                    child: Text(
                                                                        "${translator.translate("Apply Filter")}",
                                                                        style:
                                                                            TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        )),
                                                                    onPressed:
                                                                        () {
                                                                      test();
                                                                      _handleSearchStart();
                                                                    },
                                                                  ),
                                                                ),
                                                              ])),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      });
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3, top: 3),
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.grey),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            child: Row(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(CupertinoIcons.arrowtriangle_down_fill,
                                    size: 10),
                                Text(translator.translate("Sort")),
                              ],
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return FractionallySizedBox(
                                        heightFactor: paddding22,
                                        child: StatefulBuilder(builder:
                                            (BuildContext context,
                                                void Function(void Function())
                                                    setState) {
                                          return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                          "${translator.translate("Sort By")}",
                                                          style: new TextStyle(
                                                            fontSize: 18,
                                                          )),
                                                    ),
                                                    SizedBox(width: paddding23),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              id = 10;
                                                            });

                                                            print(id);
                                                          },
                                                          child: Text(
                                                              "${translator.translate("Reset")}",
                                                              style: TextStyle(
                                                                  color:
                                                                      Colors.grey,
                                                                  fontSize: 15))),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: 1.5,
                                                  height: 1,
                                                ),
                                                Expanded(
                                                    child: Column(
                                                  children: sort
                                                      .map((data) =>
                                                          RadioListTile(
                                                            activeColor:
                                                                Colors.orange,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            title: Text(
                                                                "${data.name}"),
                                                            groupValue: id,
                                                            value: data.index,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                radioItem =
                                                                    data.name;
                                                                id = data.index;
                                                                print(id);
                                                              });
                                                              _buildSortList();
                                                              _handleSearchStart();
                                                            },
                                                          ))
                                                      .toList(),
                                                )),
                                              ]);
                                        }));
                                  });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: paddding3, bottom: 3, top: 3),
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.grey),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            child: Row(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.list_rounded),
                                Text(translator.translate("List"))
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitDown,
                                  DeviceOrientation.portraitUp,
                                ]);
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: paddding,
                              right: paddding2,
                              bottom: 3,
                              top: 3),
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.grey),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            child: Row(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.grid_view),
                                Text(translator.translate("Grid"))
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.landscapeRight,
                                  DeviceOrientation.landscapeLeft,
                                ]);
                              });
                            },
                          ),
                        ),
                      ],
                    ),*/
                    automaticallyImplyLeading: false,
                    toolbarHeight: paddding5,
                    backgroundColor: Colors.orange,
                    actions: <Widget>[
                      //   SizedBox(width: landscape),
                    ]),
                if (textFirstTime && !textSearch)
                  Padding(
                    padding: new EdgeInsets.only(top: paddding50),
                    child: Text(translator.translate("No results found"),
                        style: TextStyle(fontSize: 4.w)),
                  ),
                if (orientation == Orientation.portrait && loading)
                  Padding(
                      padding: new EdgeInsets.only(top: 50.w),
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.orange),
                      )),
                if (orientation == Orientation.portrait && !loading)
                  Expanded(
                    child: _buildListView2(1, true, paddding38),
                  ),
                /* FutureBuilder(
                      future: categories.getPosts(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          countries = snapshot.data;
                          _searchList = snapshot.data;
                          everythink = snapshot.data;
                          result = snapshot.data;
                          return Expanded(
                            child: _buildListView2(1, true, 1),
                          );
                        } else {
                          return Padding(
                              padding: new EdgeInsets.only(top: 200.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.orange),
                              ));
                        }
                      }),*/
                if (orientation == Orientation.landscape && !loading)
                  Expanded(
                    child: _buildListView2(2, false, paddding38),

                    /* child: GridView.count(
                // physics: new NeverScrollableScrollPhysics(),
                crossAxisCount: 1,
                children: List.generate(countries.length, (index) {
                  return createGridItem(6, countries, index);
                }),
              ),*/
                  ),
              ],
            );
          })),
    );
  }

  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: child)));
  }

  Widget frostedText(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Container(
                width: paddding11,
                height: paddding12,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.3),
                  //  shape: BoxShape.circle
                  borderRadius: BorderRadius.circular(12),
                ),
                child: child)));
  }

  Widget createGridItem(int position, List<Post3> data, int index, bool padding,
      double padding2, double padding3, double stringL) {
    isEnglish = false;
    //// 190 شاقولي
    ////130 افقي
    // ignore: unused_local_variable
    var color = Colors.white;
    // ignore: unused_local_variable
    var icondata = Icons.add;

    switch (position) {
      case 0:
        color = Colors.grey;
        icondata = Icons.home;

        break;
      case 1:
        color = Colors.grey;
        icondata = Icons.directions_car;

        break;
      case 2:
        color = Colors.grey;
        icondata = Icons.phone_android;

        break;
      case 3:
        color = Colors.grey;
        icondata = Icons.check_box_outline_blank;

        break;
      case 4:
        color = Colors.grey;
        icondata = Icons.local_laundry_service;

        break;
      case 5:
        color = Colors.grey[200];
        icondata = Icons.tag_faces;

        break;
      case 6:
        color = Colors.grey[100];
        icondata = Icons.business;

        break;
      case 7:
        color = Colors.orange;
        icondata = Icons.text_fields;

        break;
    }

    if (translator.currentLanguage == 'ar' &&
        !(_searchList[index]
            .condition
            .toLowerCase()
            .contains(RegExp(r'[a-z]')))) {
      substring3 = 27;
    } else {
      substring3 = subString;
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 3.w),
      child: InkWell(
        onTap: () {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitDown,
            DeviceOrientation.portraitUp,
          ]);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SpecializationComp();
              },
            ),
          );
        },
        child: Card(
          /*shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)))*/
          //  elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: paddding7,
                  child: Stack(children: [
                    Carousel(
                      //  boxFit: BoxFit.fill,
                      autoplay: false,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(milliseconds: 1000),
                      dotSize: 1.5.w,
                      dotIncreasedColor: Color(0xFFFF9800),
                      dotBgColor: Colors.transparent,
                      dotPosition: DotPosition.bottomCenter,
                      dotVerticalPadding: paddding32,
                      showIndicator: true,
                      indicatorBgPadding: paddding33,
                      images: [
                        watermark(
                            'http://oxydu.linkgroupsy.com/linkgroupsy/Oxydusub/wp-content/uploads/2021/04/image-3.png?v=1621775342'),
                        watermark(
                            'http://oxydu.linkgroupsy.com/linkgroupsy/Oxydusub/wp-content/uploads/2021/04/image-3.png?v=1621775342'),
                        watermark(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzCAgJFs3EBfiLukqf4iB3RqRS9ChJD-uJxQ&usqp=CAU'),
                        watermark(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzCAgJFs3EBfiLukqf4iB3RqRS9ChJD-uJxQ&usqp=CAU'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: frostedText(Center(
                          child: Text("${data[index].price}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 6.w,
                                fontWeight: FontWeight.bold,
                              )),
                        ))),
                      ],
                    )
                  ]),
                ),
                SizedBox(height: paddding14),
                Row(
                  children: [
                    Text("${translator.translate("condition")}",
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: paddding36,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Text(
                        data[index].condition.length > substring3
                            ? data[index].condition.substring(0, substring3) +
                                '...'
                            : data[index].condition,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: paddding36, color: Colors.grey[600])),
                    Spacer(),
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(FontAwesomeIcons.heart,
                            color: Colors.black, size: 5.5.w),
                        onPressed: () {}),
                    SizedBox(width: paddding30),
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.flag_outlined,
                            color: Colors.black, size: 5.5.w),
                        onPressed: () {}),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: padding3),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text("${translator.translate("materials")}",
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: paddding36,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        Text(data[index].material,
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: paddding36, color: Colors.grey[600])),
                      ],
                    )),
                SizedBox(
                  height: padding3,
                ),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text("${translator.translate("usage")}",
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: paddding36,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        Text(
                            data[index].usage.length > subString2
                                ? data[index].usage.substring(0, subString2) +
                                    '...'
                                : data[index].usage,
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: paddding36, color: Colors.grey[600])),
                      ],
                    )),
                SizedBox(
                  height: padding3,
                ),
                SizedBox(
                    //width: paddding4,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text("${translator.translate("age")}",
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: paddding36,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        //   Text("Km:${data[index].km}",
                        Text(data[index].age,
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                fontSize: paddding36,
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey[600])),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

/////////////////////////////////////////////////مهم جداا
  /* Widget _buildListView() {
    return ListView.builder(
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index) {
          /* print(flag);
          if (_selectedLocation == "A") {
            if (filter.isEmpty &&
                (countries[index].age > _currentRangeValuesPrice.start) &&
                (countries[index].year > _currentRangeValuesYear.start) &&
                (countries[index].km > _currentRangeValuesKM.start) &&
                (flag)) {
              print("con1");
              return _buildRow(countries[index]);
            }*/

          if (filter.isEmpty) return createGridItem(6, countries, index);
          /* if (countries[index]
                    .name
                    .toLowerCase()
                    .contains(filter.toLowerCase()) &&
                (countries[index].age > _currentRangeValuesPrice.start) &&
                (countries[index].year > _currentRangeValuesYear.start) &&
                (countries[index].km > _currentRangeValuesKM.start) &&
                (filter.isNotEmpty)) {
              print("con3");
              return _buildRow(countries[index]);
            } */
          if (countries[index]
                  .name
                  .toLowerCase()
                  .contains(filter.toLowerCase()) &&
              (filter.isNotEmpty)) {
            return createGridItem(6, countries, index);
          } else {
            return new Container();
          }
        });
  }*/

  Widget _buildListView2(int number, bool padding, double aspect) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: number, childAspectRatio: 0.9),

        /*  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisCount:1,
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),*/

        itemCount: _searchList.length,
        itemBuilder: (BuildContext context, int index) {
          // paddding14 = 1.6.w
          //  if (!padding) {
          if ((_searchList[index]
              .condition
              .toLowerCase()
              .contains(RegExp(r'[a-z]')))) {
            // landscape;
            return createGridItem(
                6,
                _searchList,
                index,
                padding,
                paddding35,
                translator.currentLanguage == 'en' ? 1.6.w : 0.w,
                translator.currentLanguage == 'en' ? 0 : 16);
          }
          //
          // if (padding) {
          if (!(_searchList[index]
              .condition
              .toLowerCase()
              .contains(RegExp(r'[a-z]'))))
            return createGridItem(6, _searchList, index, padding, paddding35,
                0.w, translator.currentLanguage == 'en' ? 0 : 16);

          /* if ((_searchList[index].age > _currentRangeValuesPriceTest.start) &&
                (_searchList[index].year > _currentRangeValuesYear.start) &&
                (_searchList[index].km > _currentRangeValuesKM.start) )
              return createGridItem(6, _searchList, index, padding, 130);*/
          /* if (countries[index]
                    .name
                    .toLowerCase()
                    .contains(filter.toLowerCase()) &&
                (filter.isNotEmpty)) {
              print("d");
              return createGridItem(6, countries, index, padding, 130);
            }*/
          // }
          else
            return new Container();
        });

    /*  GridView.count(
      
      // Create a grid with 2 columns in portrait mode, or 3 columns in
      // landscape mode.
      crossAxisCount: 2,

      // orientation == Orientation.portrait ? 2 : 3,

      // Generate 100 widgets that display their index in the List.
      children:List.generate(10, (index) {
        return createGridItem(6, countries, index);
      }
      
      ),
    );
    */
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
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
        toolbarHeight: paddding5,
        centerTitle: true,
        title: appBarTitle,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: SizerUtil.deviceType == DeviceType.mobile
                ? actionIconMob
                : actionIconTab,
            onPressed: () {
              setState(() {
                if (SizerUtil.deviceType == DeviceType.mobile) {
                  if (this.actionIconMob.icon == Icons.search) {
                    this.actionIconMob =
                        Icon(Icons.close, color: Colors.white, size: 6.w);
                    this.appBarTitle = TextField(
                      controller: _searchQuery,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: translator.translate("Search by material"),
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 4.w),
                        isDense: true,
                      ),
                    );
                    _handleSearchStart();
                  } else {
                    _handleSearchEndMob();
                  }
                }
                if (SizerUtil.deviceType == DeviceType.tablet) {
                  if (this.actionIconTab.icon == Icons.search) {
                    this.actionIconTab =
                        Icon(Icons.close, color: Colors.white, size: 5.w);
                    this.appBarTitle = TextField(
                      controller: _searchQuery,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: translator.translate("Search by material"),
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 4.w),
                        isDense: true,
                      ),
                    );
                    _handleSearchStart();
                  } else {
                    _handleSearchEndTab();
                  }
                }
              });
            },
          ),
          SizerUtil.deviceType == DeviceType.tablet
              ? SizedBox(width: 50)
              : SizedBox(),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEndMob() {
    setState(() {
      this.actionIconMob = Icon(Icons.search, color: Colors.white, size: 6.w);
      this.appBarTitle = Text(
        translator.translate("Jewelry Section"),
        style: TextStyle(
            color: Colors.white,
            fontSize: translator.currentLanguage == 'en'
                ? titleFontSize = 4.w
                : titleFontSize = 4.w),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }

  void _handleSearchEndTab() {
    setState(() {
      this.actionIconTab = Icon(Icons.search, color: Colors.white, size: 5.w);
      this.appBarTitle = Text(
        translator.translate("Jewelry Section"),
        style: TextStyle(color: Colors.white, fontSize: 4.w),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class Servicesjewelry {
  /* var url = Uri.http(
      'www.json-generator.com', '/api/json/get/bVgzIdyusy', {"indent": "2"});*/

  //jewleryEnglish
  //var url = Uri.https('api.json-generator.com', '/templates/JutGMFBBxT26/data');
  var url = Uri.https('api.json-generator.com', '/templates/iVppXVSqpoCp/data');
  //https://api.json-generator.com/templates/iVppXVSqpoCp/data

  /*static const String url =
      "http://www.json-generator.com/api/json/get/bVgzIdyusy?indent=2";
 */
  //'http://www.json-generator.com/api/json/get/bVmXkGGZAi?indent=2';

  //'https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8';

  //'http://www.json-generator.com/api/json/get/cfOoQyCkqG?indent=2';

  // 'http://www.json-generator.com/api/json/get/bOtoDGRSUO?indent=2';

  Future<List<Post3>> getPosts() async {
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer 3ejt83z2wpucusnyvj8tkm1nbfyeusz38qe7s4np'
      });
      if (response.statusCode == 200) {
        final List<Post3> listPosts = postFromJson(response.body);
        return listPosts;
      } else {
        return <Post3>[];
      }
    } catch (e) {
      return <Post3>[];
    }
  }
}

List<Post3> postFromJson(String str) =>
    List<Post3>.from(json.decode(str).map((x) => Post3.fromJson(x)));

String postToJson(List<Post3> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post3 {
  Post3(
      {this.material,
      this.usage,
      this.age,
      this.condition,
      this.price,
      this.warranty,
      this.filter});
  /* this.doors,
        this.color,
        this.kilometers,
        this.year,*/

  String material;
  String usage;
  String age;
  String condition;
  String warranty;
  int price;
  bool filter;
  /* String color;
    String kilometers;
    String year;*/

  factory Post3.fromJson(Map<String, dynamic> json) => Post3(
        material: json["Material"],
        usage: json["Usage"],
        age: json["Age"],
        condition: json["Condition"],
        price: json["Price"],
        warranty: json["Warranty"],
        //  date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "Material": material,
        "Usage": usage,
        "Age": age,
        "Price": price,
        "Warranty": warranty,
        "filter": false,
        // "date": date.toIso8601String(),
        /*"doors": doors,
        "color": color,
        "kilometers": kilometers,
        "year": year,*/
      };
}
