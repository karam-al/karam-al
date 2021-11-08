import 'dart:ui';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/Data/Jobs/AutoGenertedJobs.dart';
import 'package:oxydu/Data/Jobs/ServiceJobs.dart';
import 'package:oxydu/MotorsMain/AllinMotorsTest.dart';
import 'package:sizer/sizer.dart';
import 'package:collection/collection.dart';

import 'JobsItemStateManagement.dart';

TextEditingController controller = new TextEditingController();
String filter = "";
List<JobsParse> countries, result, everythink;
Function eq = const ListEquality().equals;
bool loading;
DateTime t;
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
    flag8 = false,
    flag9 = false,
    flagArabicEnglish = false,
    flagEnglishArabic = false,
    flagArabicArabic = false,
    flagEnglishEnglish = false,
    textSearch = false,
    textFirstTime = false;
int grid = 0,
    testt = 0,
    indexjobRole = 0,
    indexcareerLevel = 0,
    indexsalary = 0,
    indexminimumExperience = 0,
    indexminimumEducation = 0,
    indexemploymentType = 0;
String _searchText = "";
// ignore: deprecated_member_use
List<JobsParse> _searchList = List();
// ignore: deprecated_member_use
List<JobsParse> _searchList2 = List();
List<bool> weightData;
// ignore: deprecated_member_use
RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
List<String> jobRole,
    salary,
    careerLevel,
    minimumExperience,
    minimumEducation,
    employmentType;
int choiceUsage = 10,
    choiceAge = 10,
    choiceCondition = 10,
    choiceWarranty = 10,
    subString = 0,
    subString2 = 0,
    substring3 = 0;
String _selectedLocationjobRole = translator.translate("all6"),
    _selectedLocationsalary = translator.translate("all6"),
    _selectedLocationcareerLevel = translator.translate("all6"),
    _selectedLocationminimumExperience = translator.translate("all6"),
    _selectedLocationminimumEducation = translator.translate("all6"),
    _selectedLocationemploymentType = translator.translate("all6"); // Option 2
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
    titleFontSize = 0,
    cardSize = 0;
int c, end, ii, iii;
/*List<String> jobRole2 = [
  "All",
  "Accounting",
  "Architecture & Interior Design",
  "Automotive",
  "Beauty",
  "Business Development",
  "Construction2",
  "Customer Service",
  "Education2",
  "Engineering",
  "Fashion",
  "Food & Beverages",
  "Graphic Design",
  "Hospitality & Restaurants",
  "HR & Recruitment",
  "Industrial & Manufacturing",
  "Information Technology",
  "Internet",
  "Legal Services",
  "Logistics & Distribution",
  "Marketing & Advertising",
  "Media",
  "Medical & Healthcare",
  "Online Media",
  "Real Estate",
  "Retail & Consumer Goods",
  "Safety & Security",
  "Sales",
  "Secretarial",
  "Sports & Fitness",
  "Transportation",
  "Travel & Tourism",
  "Jobs Wanted",
  "I am a Recruiter",
];*/
List<String> jobRole2 = [
  "Accounting"
      "Architecture/Eng"
      "Art/Design"
      "Bank/Finance"
      "Business Dev"
      "Construction"
      "Consulting"
      "Education"
      "Executive"
      "Hospitality"
      "HR/Recruiting"
      "IT/Telecom"
      "Marketing/PR"
      "Media"
      "Medical/Health"
      "Oil/Gas"
      "Retail"
      "Sales"
      "Secretarial"
      "Other"
];
List<String> salary2 = [
  "All",
  "0 - 1,999",
  "2,000 - 3,999",
  "4,000 - 5,999",
  "6,000 - 7,999",
  "8,000 - 11,999",
  "12,000 - 19,999",
  "20,000 - 29,999",
  "30,000 - 49,999",
  "50,000 - 99,999",
  "100,000+"
];
List<String> careerLevel2 = [
  "All",
  "Junior",
  "Mid-level",
  "Senior",
  "Manager",
];
List<String> minimumExperience2 = [
  "All",
  "0-1 Years",
  "1-2 Years",
  "2-5 Years",
  "5-10 Years",
  "10-15 Years",
  "+15 Years",
];
List<String> minimumEducation2 = [
  "All",
  "High-School / Secondary",
  "Bachelors Degree",
  "Masters Degree",
  "phD",
];
List<String> employmentType2 = [
  "Full Time",
  "Part Time",
  "Contract",
  "Temporary",
  "Other0",
];
///////////////////////////////////////////////////////

/*List<String> jobRole3 = [ 
  "محاسبة",
  "تصميم معماري و داخلي",
  "السيارات",
  "الصحة و الجمال",
  "تنمية الأعمال",
  "الإنشاءات",
  "خدمة العملاء",
  "تعليم",
  "هندسة",
  "موضة و ازياء",
  "مأكولات و مشروبات",
  "تصميم جرافيكي",
  "ضيافة و مطاعم",
  "موارد بشرية و توظيف",
  "صناعة و تصنيع",
  "تكنولوجيا المعلومات",
  "الإنترنت",
  "خدمات قانونية",
  "خدمات لوجستية و توزيع",
  "تسويق و إعلان",
  "وسائل اعلام",
  "طب و رعاية صحية",
  "وسائل الإعلام عبر الانترنت",
  "عقارات ",
  "بضائع التجزئة و المستهلك",
  "انظمة السلامة و الأمن",
  "مبيعات",
  "سكرتارية",
  "رياضة و لياقة",
  "ترجم فقط",
  "سياحة و سفر ",
  "يبحث عن عمل",
  "أنا مسؤول التوظيف ",
  "قسم المجوهرات",
  "البحث حسب المادة",
];*/
List<String> jobRole3 = [
  "محاسبة",
  "بناء",
  "تعليم",
  "تنفيذي",
  "وسائل الإعلام",
  "مبيعات",
  "سكرتارية",
  "التجزئه"
      "النفط/الغاز"
      "الطبية / الصحة"
      "التسويق / العلاقات العامة"
      "تكنولوجيا المعلومات / الاتصالات"
      "الموارد البشرية/ التوظيف"
      "الضيافه"
      "تنفيذي"
      "تعليم"
      "الاستشارات"
      "تطوير الأعمال"
      "البنك/التمويل"
      "الفن / التصميم"
      "الهندسة المعمارية / المهندس"
      "other"
];
List<String> salary3 = [
  "الكل",
  "0 - 1,999",
  "2,000 - 3,999",
  "4,000 - 5,999",
  "6,000 - 7,999",
  "8,000 - 11,999",
  "12,000 - 19,999",
  "20,000 - 29,999",
  "30,000 - 49,999",
  "50,000 - 99,999",
  "100,000+"
];
List<String> careerLevel3 = [
  "الكل",
  "جونيور/مبتدئ",
  "متوسط الخبرة",
  "سينيور/مدير",
  "مدير",
  "إدارة عليا/تنفيذية"
];
List<String> minimumExperience3 = [
  "الكل",
  "1-0 سنوات",
  "1-2 سنوات",
  "2-5 سنوات",
  "5-10 سنوات",
  "10-15 سنوات",
  "+15 سنوات",
];
List<String> minimumEducation3 = [
  "الكل",
  "ثانوية عامة",
  "بكالوريوس",
  "ماجستير",
  "دكتوراه",
];
List<String> employmentType3 = [
  "دوام كامل",
  "دوام جزئي",
  "عقد",
  "مؤقت",
  "اختيار آخر",
];
Map<String, bool> maybee = {
  'test': false,
};

final TextEditingController _searchQuery = TextEditingController();
var redrawObject;

class JobsIamHiring extends StatefulWidget {
  @override
  JobsIamHiringState createState() => JobsIamHiringState();
  final String jobType;
  final int api;
  JobsIamHiring({
    @required this.jobType,
    @required this.api,
  });
}

class SortList {
  String name;
  int index;
  SortList({this.name, this.index});
}

class JobsIamHiringState extends State<JobsIamHiring> {
  JobsItemStateManagement get obj => GetIt.I<JobsItemStateManagement>();

  // Default Radio Button Item
  String radioItem = 'Sort..';

  // Group Value for Radio Button.
  int id = 10;

  List<SortList> sort;

  List<RangeSliderData> rangeSliders;
  double padding = 0.0;
  Icon actionIconTab = Icon(Icons.search, color: Colors.white, size: 5.w);
  Icon actionIconMob = Icon(Icons.search, color: Colors.white, size: 6.w);
  Widget appBarTitle;
  // ignore: missing_return
  List<JobsParse> test() {
    textFirstTime = true;
    textSearch = false;
    _searchList2.clear();
    ii = 0;

    flag = false;
    flag2 = false;
    flag3 = false;
    flag4 = false;
    flag8 = false;
    flag9 = false;
    flag7 = false;
    flagArabicEnglish = false;
    flagEnglishArabic = false;
    flagArabicArabic = false;
    flagEnglishEnglish = false;

    for (int i = 0; i < countries.length; i++) {
      ii = 0;
      iii = 0;
      maybee.clear();
      flag6 = false;

      //////////////////////////////////////////////////////////
      if ((countries[i]
              .acf
              .specialties
              .toLowerCase()
              .contains(RegExp(r'[a-z]'))) &&
          translator.currentLanguage == 'ar') {
        flagArabicEnglish = true;
        _selectedLocationjobRole = jobRole2.elementAt(indexjobRole);
        _selectedLocationsalary = salary2.elementAt(indexsalary);
        _selectedLocationcareerLevel = careerLevel2.elementAt(indexcareerLevel);
        _selectedLocationminimumExperience =
            minimumExperience2.elementAt(indexminimumExperience);
        _selectedLocationminimumEducation =
            minimumEducation2.elementAt(indexminimumEducation);
        _selectedLocationemploymentType =
            employmentType2.elementAt(indexemploymentType);
      }
      if (!(countries[i]
              .acf
              .specialties
              .toLowerCase()
              .contains(RegExp(r'[a-z]'))) &&
          translator.currentLanguage == 'en') {
        flagEnglishArabic = true;
        _selectedLocationjobRole = jobRole3.elementAt(indexjobRole);
        _selectedLocationsalary = salary3.elementAt(indexsalary);
        _selectedLocationcareerLevel = careerLevel3.elementAt(indexcareerLevel);
        _selectedLocationminimumExperience =
            minimumExperience3.elementAt(indexminimumExperience);
        _selectedLocationminimumEducation =
            minimumEducation3.elementAt(indexminimumEducation);
        _selectedLocationemploymentType =
            employmentType3.elementAt(indexemploymentType);
      }
      if ((countries[i]
              .acf
              .specialties
              .toLowerCase()
              .contains(RegExp(r'[a-z]'))) &&
          translator.currentLanguage == 'en') {
        flagEnglishEnglish = true;
        _selectedLocationjobRole = jobRole.elementAt(indexjobRole);
        _selectedLocationsalary = salary.elementAt(indexsalary);
        _selectedLocationcareerLevel = careerLevel.elementAt(indexcareerLevel);
        _selectedLocationminimumExperience =
            minimumExperience.elementAt(indexminimumExperience);
        _selectedLocationminimumEducation =
            minimumEducation.elementAt(indexminimumEducation);
        _selectedLocationemploymentType =
            employmentType.elementAt(indexemploymentType);
      }
      if (!(countries[i]
              .acf
              .specialties
              .toLowerCase()
              .contains(RegExp(r'[a-z]'))) &&
          translator.currentLanguage == 'ar') {
        flagArabicArabic = true;
        _selectedLocationjobRole = jobRole.elementAt(indexjobRole);
        _selectedLocationsalary = salary.elementAt(indexsalary);
        _selectedLocationcareerLevel = careerLevel.elementAt(indexcareerLevel);
        _selectedLocationminimumExperience =
            minimumExperience.elementAt(indexminimumExperience);
        _selectedLocationminimumEducation =
            minimumEducation.elementAt(indexminimumEducation);
        _selectedLocationemploymentType =
            employmentType.elementAt(indexemploymentType);
      }
      if (_selectedLocationjobRole != 'All' &&
          _selectedLocationjobRole != 'الكل') {
        maybee[_selectedLocationjobRole] = false;
        flag = true;
        print("1");
      }
      if (_selectedLocationsalary != 'All' &&
          _selectedLocationsalary != 'الكل') {
        flag2 = true;
        maybee[_selectedLocationsalary] = false;
        print("11");
      }
      if (_selectedLocationcareerLevel != 'All' &&
          _selectedLocationcareerLevel != 'الكل') {
        flag3 = true;
        maybee[_selectedLocationcareerLevel] = false;
        print("111");
      }
      if (_selectedLocationminimumExperience != 'All' &&
          _selectedLocationminimumExperience != 'الكل') {
        flag4 = true;
        maybee[_selectedLocationminimumExperience] = false;
        print("1111");
      }
      if (_selectedLocationminimumEducation != 'All' &&
          _selectedLocationminimumEducation != 'الكل') {
        flag8 = true;
        maybee[_selectedLocationminimumEducation] = false;
        print("11111");
      }
      if (_selectedLocationemploymentType != 'All' &&
          _selectedLocationemploymentType != 'الكل') {
        flag9 = true;
        maybee[_selectedLocationemploymentType] = false;
        print("111111");
      }
      if (!flag && !flag2 && !flag3 && !flag4 & !flag8 & !flag9) {
        flag5 = true;
        maybee[_selectedLocationjobRole] = true;
        maybee[_selectedLocationsalary] = true;
        maybee[_selectedLocationcareerLevel] = true;
        maybee[_selectedLocationminimumExperience] = true;
        maybee[_selectedLocationminimumEducation] = true;
        maybee[_selectedLocationemploymentType] = true;
      }
      for (var k in maybee.keys) {
        if ((countries[i].acf.specialties.toLowerCase() == k.toLowerCase()) ||
            (countries[i].acf.monthlySalary.toLowerCase() == k.toLowerCase()) ||
            (countries[i].acf.minEduclev.toLowerCase() == k.toLowerCase()) ||
            (countries[i].acf.minimumWorkExperience.toLowerCase() ==
                k.toLowerCase()) ||
            (countries[i].acf.careerLevel.toLowerCase() == k.toLowerCase()) ||
            (countries[i].acf.employmentType.toLowerCase() ==
                k.toLowerCase())) {
          maybee[k] = true;
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

  JobsIamHiringState() {
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

  List<JobsParse> _buildSearchList() {
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
      /* _searchList = result
          .where((element) =>
              element.acf.specialties.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();*/
////////////////////////////////////////////////////////////
      return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    }
  }

  List<JobsParse> _buildSortList() {
    if (id == 1) result.sort((a, b) => (a.date).compareTo(b.date));
    if (id == 10) result.sort((b, a) => (a.date).compareTo(b.date));
    if (id == 2) result.sort((b, a) => (a.date).compareTo(b.date));

    _searchList = result;
    return _searchList;
  }

  final categories = ServiceJobs();
  @override
  void initState() {
    super.initState();
    isEnglish = false;
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
    c = "a".codeUnitAt(0);
    end = "z".codeUnitAt(0);
    textSearch = false;
    textFirstTime = false;
    // textSearch = false;
    sort = [
      SortList(
        index: 1,
        name: translator.translate("By Date From Lowest To Highest"),
      ),
      SortList(
        index: 2,
        name: translator.translate("By Date From Highest To Lowest"),
      ),
    ];
    jobRole = [
      translator.translate("all5"),
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
      translator.translate("Jobs Wanted"),
      translator.translate("I am a Recruiter"),
    ];
    salary = [
      translator.translate("all5"),
      "0 - 1,999",
      "2,000 - 3,999",
      "4,000 - 5,999",
      "6,000 - 7,999",
      "8,000 - 11,999",
      "12,000 - 19,999",
      "20,000 - 29,999",
      "30,000 - 49,999",
      "50,000 - 99,999",
      "100,000+"
    ];
    careerLevel = [
      translator.translate("all5"),
      translator.translate("Junior"),
      translator.translate("Mid-level"),
      translator.translate("Senior"),
      translator.translate("Manager"),
      translator.translate("Executive/Director"),
    ];
    minimumExperience = [
      translator.translate("all5"),
      translator.translate("0-1 Years"),
      translator.translate("1-2 Years"),
      translator.translate("2-5 Years"),
      translator.translate("5-10 Years"),
      translator.translate("10-15 Years"),
      translator.translate("+15 Years"),
    ];
    minimumEducation = [
      translator.translate("all5"),
      translator.translate("High-School / Secondary"),
      translator.translate("Bachelors Degree"),
      translator.translate("Masters Degree"),
      translator.translate("phD"),
    ];
    employmentType = [
      translator.translate("all5"),
      translator.translate("Full Time"),
      translator.translate("Part Time"),
      translator.translate("Contract"),
      translator.translate("Temporary"),
      translator.translate("Other0"),
    ];
    loading = true;
    _IsSearching = false;
    categories.getPosts(widget.api).then((categories) {
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

  Future<bool> redirectTo() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return true;
  }

  Widget build(BuildContext context) {
    appBarTitle = new Text("${translator.translate("${widget.jobType}")}",
        style: new TextStyle(color: Colors.white, fontSize: 4.w));
    if (translator.currentLanguage == 'en') {
      _selectedLocationjobRole = jobRole.elementAt(indexjobRole);
      _selectedLocationsalary = salary.elementAt(indexsalary);
      _selectedLocationcareerLevel = careerLevel.elementAt(indexcareerLevel);
      _selectedLocationminimumExperience =
          minimumExperience.elementAt(indexminimumExperience);
      _selectedLocationminimumEducation =
          minimumEducation.elementAt(indexminimumEducation);

      _selectedLocationemploymentType =
          employmentType.elementAt(indexemploymentType);
    } else {
      _selectedLocationjobRole = jobRole.elementAt(indexjobRole);
      _selectedLocationsalary = salary.elementAt(indexsalary);
      _selectedLocationcareerLevel = careerLevel.elementAt(indexcareerLevel);
      _selectedLocationminimumExperience =
          minimumExperience.elementAt(indexminimumExperience);
      _selectedLocationminimumEducation =
          minimumEducation.elementAt(indexminimumEducation);

      _selectedLocationemploymentType =
          employmentType.elementAt(indexemploymentType);
    }

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      cardSize = 2;
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
        paddding36 = 4.5.w;
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
          paddding22 = 0.16.w;
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
          paddding22 = 0.11.w;
          translator.currentLanguage == 'en'
              ? paddding14 = 2.2.w
              : paddding14 = 0.5.w;
        }
        if (SizerUtil.width >= 320 && SizerUtil.width < 360) {
          print("5");
          translator.currentLanguage == 'en'
              ? paddding14 = 1.6.w
              : paddding14 = 0.08.w;
          paddding22 = 0.16.w;
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
              : paddding22 = 0.08.w;
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
              : paddding22 = 0.075.w;
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
              : paddding22 = 0.059.w;
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
              : paddding22 = 0.05.w;
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
      paddding5 = 13.w;
      paddding6 = MediaQuery.of(context).size.height * 0.08;
      paddding8 = 8.w;
      paddding9 = MediaQuery.of(context).size.width * 0.19;
      paddding10 = MediaQuery.of(context).size.width * 0.10;
      paddding11 = 23.w;
      paddding12 = 8.w;
      paddding13 = MediaQuery.of(context).size.height * 0.01;
      paddding15 = 0;
      paddding21 = MediaQuery.of(context).size.width * 0.2;
      paddding25 = MediaQuery.of(context).size.height * 0.02;
      paddding26 = MediaQuery.of(context).size.height * 0.01;
      paddding28 = MediaQuery.of(context).size.height * 0.04;
    }

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      paddding50 = 25.w;
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
            : paddding22 = 0.32.w;
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
              : paddding22 = 0.33.w;

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
          paddding22 = 0.25.w;

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
          paddding22 = 0.27.w;
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
          paddding22 = 0.24.w;
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
          paddding22 = 0.20.w;

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
          paddding22 = 0.24.w;

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
          paddding22 = 0.26.w;
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
          paddding22 = 0.26.w;
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
          paddding22 = 0.18.w;
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
              ? paddding22 = 0.2.w
              : paddding22 = 0.11.w;
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
        cardSize = 2;
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
            : paddding22 = 0.32.w;
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
          paddding22 = 0.27.w;

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
          paddding22 = 0.25.w;

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
          paddding22 = 0.27.w;
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
          cardSize = 1.6;
        }

        if (SizerUtil.width > 900 && SizerUtil.width < 1100) {
          cardSize = 1.6;
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
          cardSize = 1.6;
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
          paddding22 = 0.24.w;
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
          paddding22 = 0.20.w;

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
          paddding22 = 0.24.w;

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
          paddding22 = 0.26.w;
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
          paddding22 = 0.26.w;

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
          paddding22 = 0.18.w;
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
      paddding6 = MediaQuery.of(context).size.height * 0.13;

      paddding8 = MediaQuery.of(context).size.height * 0.1;
      paddding9 = MediaQuery.of(context).size.width * 0.09;

      paddding10 = MediaQuery.of(context).size.width * 0.06;
      paddding13 = MediaQuery.of(context).size.height * 0.09;
      paddding21 = MediaQuery.of(context).size.width * 0.25;
      paddding25 = MediaQuery.of(context).size.height * 0.03;
      paddding26 = MediaQuery.of(context).size.height * 0.02;
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
                                                        //////
                                                        /*Text(
                                                            "${translator.translate("JobRole")}",
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
                                                                _selectedLocationjobRole,
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
                                                                _selectedLocationjobRole =
                                                                    newValue;
                                                                print(
                                                                    _selectedLocationjobRole);
                                                                if (newValue ==
                                                                        'All' ||
                                                                    newValue ==
                                                                        'الكل') {
                                                                  choiceUsage =
                                                                      10;
                                                                } else
                                                                  choiceUsage =
                                                                      1;
                                                                indexjobRole =
                                                                    jobRole.indexOf(
                                                                        newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return jobRole
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
                                                            items: jobRole.map<
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
                                                                            SizedBox(height: 10,),
                                                                    Divider()
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
                                                        ),*/
                                                        Text(
                                                            "${translator.translate("Salary")}",
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
                                                                _selectedLocationsalary,
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
                                                                _selectedLocationsalary =
                                                                    newValue;

                                                                if (newValue ==
                                                                        'All' ||
                                                                    newValue ==
                                                                        'الكل') {
                                                                  choiceAge =
                                                                      10;
                                                                } else
                                                                  choiceAge = 1;
                                                                indexsalary =
                                                                    salary.indexOf(
                                                                        newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return salary.map<
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
                                                            items: salary.map<
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
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
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
                                                            "${translator.translate("Career Level")}",
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
                                                                _selectedLocationcareerLevel,
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
                                                                _selectedLocationcareerLevel =
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
                                                                indexcareerLevel =
                                                                    careerLevel
                                                                        .indexOf(
                                                                            newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return careerLevel
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
                                                            items: careerLevel.map<
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
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
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
                                                            "${translator.translate("Minimum Experience")}",
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
                                                                _selectedLocationminimumExperience,
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
                                                                _selectedLocationminimumExperience =
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

                                                                indexminimumExperience =
                                                                    minimumExperience
                                                                        .indexOf(
                                                                            newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return minimumExperience
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
                                                            items: minimumExperience.map<
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
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
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
                                                            "${translator.translate("Minimum Education")}",
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
                                                                _selectedLocationminimumEducation,
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
                                                                _selectedLocationminimumEducation =
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

                                                                indexminimumEducation =
                                                                    minimumEducation
                                                                        .indexOf(
                                                                            newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return minimumEducation
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
                                                            items: minimumEducation.map<
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
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
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
                                                            "${translator.translate("Employment Type")}",
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
                                                                _selectedLocationemploymentType,
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
                                                                _selectedLocationemploymentType =
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

                                                                indexemploymentType =
                                                                    employmentType
                                                                        .indexOf(
                                                                            newValue);
                                                              });
                                                            },
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return employmentType
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
                                                            items: employmentType.map<
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
                                    isScrollControlled: false,
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
                  ),
              ],
            );
          })),
    );
  }

  Widget createGridItem(int position, List<JobsParse> data, int index,
      bool padding, double padding2, double padding3, double stringL) {
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
        !(_searchList[index].lang.toLowerCase().contains(RegExp(r'[a-z]')))) {
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
          /* Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SpecializationComp();
              },
            ),
          );*/
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: paddding14),
                /* Text(data[index].title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      color: Colors.orange[300],
                      fontSize: paddding36,
                    )),*/
                // Text(widget.jobType,
                Text(
                    "${data[index].date.year}-${data[index].date.month}-${data[index].date.day}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      color: Colors.orange[300],
                      fontSize: paddding36,
                    )),
                SizedBox(height: padding3),
                if (data[index].acf.descriptionAmHiring != null)
                  Text(
                    data[index].acf.descriptionAmHiring,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        height: (countries[index]
                                .lang
                                .toLowerCase()
                                .contains(RegExp(r'[a-z]')))
                            ? 1.5
                            : 1.3,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 4.w),
                  ),
                SizedBox(
                  height: padding3,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: Colors.orange[300], size: 5.5.w),
                    if (data[index].acf.locationjobs != null)
                      Text(
                          data[index].acf.locationjobs.length > subString2
                              ? data[index]
                                      .acf
                                      .locationjobs
                                      .substring(0, subString2) +
                                  '...'
                              : data[index].acf.locationjobs,
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
                    if (SizerUtil.deviceType == DeviceType.tablet)
                      SizedBox(width: 40)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView2(int number, bool padding, double aspect) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: number, childAspectRatio: cardSize),
        itemCount: _searchList.length,
        itemBuilder: (BuildContext context, int index) {
          // paddding14 = 1.6.w
          //  if (!padding) {
          if ((_searchList[index]
              .lang
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
              .lang
              .toLowerCase()
              .contains(RegExp(r'[a-z]'))))
            return createGridItem(6, _searchList, index, padding, paddding35,
                0.w, translator.currentLanguage == 'en' ? 0 : 16);
          else
            return new Container();
        });
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
      /* actions: <Widget>[
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
                        hintText: translator.translate("Search by job Section"),
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
                        hintText: translator.translate("Search by job Section"),
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
        ]*/
    );
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
        translator.translate("${widget.jobType}"),
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
        translator.translate("${widget.jobType}"),
        style: TextStyle(color: Colors.white, fontSize: 4.w),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}