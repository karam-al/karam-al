/*
TextEditingController controller = new TextEditingController();
final servic = Services();
String filter = "";

bool loading;
RangeValues _currentRangeValuesPriceTest = RangeValues(0, 450000);
RangeValues _currentRangeValuesKM = RangeValues(0, 150000);
RangeValues _currentRangeValuesYear = RangeValues(1990, 2021);
RangeValues range;
RangeValues values1;
bool flag = false;
bool flag2 = false;
bool flag3 = false;
int grid = 0;
String incrementPriceStart = "";
String incrementPriceEnd = "";
String incrementYearStart = "";
String incrementYearEnd = "";
String incrementKMStart = "";
String incrementKMEnd = "";
String _searchText = "";
// ignore: deprecated_member_use
List<MotorsParse> _searchList = List();
List<MotorsParse> countries, result;

bool _IsSearching;

final TextEditingController _searchQuery = TextEditingController();
RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
Icrement c;
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
    padding26 = 0,
    padding27 = 0,
    landscape = 0;
var redrawObject;

class SortList {
  String name;
  int index;
  SortList({this.name, this.index});
}

List<SortList> model = [
  SortList(
    index: 1,
    name: "By Price From Lowest To Highest",
  ),
  SortList(
    index: 2,
    name: "By Price From Highest To Lowest",
  ),
  SortList(
    index: 3,
    name: "By Date From Lowest To Highest",
  ),
  SortList(
    index: 4,
    name: "By Date From Highest To Lowest",
  ),
];

class UsedCarForSale extends StatefulWidget {
  // final int carId;
  // UsedCarForSale({Key key,@required this.carId}): super(key: key);
  @override
  State createState() => AllinMotorsState();
}

class AllinMotorsState extends State<UsedCarForSale> {
  List<RangeSliderData> rangeSliders;
  double padding = 0.0;
  int id = 10;
  String radioItem = 'Sort..';
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  Widget appBarTitle = new Text(
    "Search By Model",
    style: new TextStyle(color: Colors.white, fontSize: 14.sp),
  );

  AllinMotorsState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          print("call1");
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          print("call2");
          _buildSearchList();
        });
      }
    });
  }

  List<MotorsParse> _buildSortList() {
    result.forEach((element) {
      print(element.age);
    });
    if (id == 1) result.sort((a, b) => (a.age).compareTo(b.age));
    if (id == 2) result.sort((b, a) => (a.age).compareTo(b.age));
    if (id == 3) result.sort((a, b) => (a.age).compareTo(b.age));
    if (id == 4) result.sort((b, a) => (a.age).compareTo(b.age));

    _searchList = result;
    return _searchList;
  }

  List<MotorsParse> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = result;
      //_list.map((contact) =>  Uiitem(contact)).toList();
    } else {
      /*for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }*/

      _searchList = result
          .where((element) =>
              element.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();

      return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    }
  }

  List<MotorsParse> _buildFilterList() {
    print("_searchList${_searchList.length}");
    _searchList = countries
        .where((element) =>
            element.age >= _currentRangeValuesPriceTest.start &&
            element.km >= _currentRangeValuesKM.start &&
            element.year >= _currentRangeValuesYear.start)
        .toList();

    result = _searchList;

    print("_searchList${_searchList.length}");
    return _searchList;

    // if (_searchText.isEmpty) {
    //    return _searchList = countries;
    //_list.map((contact) =>  Uiitem(contact)).toList();
    // } else {
    // countries.where((element) => element.id.compareTo(_currentRangeValuesPrice.start)
    /*for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }*/

    /*  countries.asMap().entries.map((entry) {
      print("called");
      int idx = entry.key;
      MotorsParse val = entry.value;
      if (countries[idx].age > _currentRangeValuesPriceTest.start)
        _searchList = countries[idx];
      return _searchList;
    }); */

    /* if (_searchText.isEmpty) {
      countries.forEach((element) {
        if (element.age > _currentRangeValuesPriceTest.start) {
          print("NNNN");
          _searchList.insert(countries.,element);
          return _searchList;
        }
      });
      //_list.map((contact) =>  Uiitem(contact)).toList();
    }*/

    //  return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    // }
  }

  final categories = Services();

//  final categories = Services.getPosts();
  List<MotorsParse> countries;

  @override
  void initState() {
    super.initState();
    //fill countries with objects
    incrementPriceStart = "0";
    incrementPriceEnd = "450000";
    incrementYearStart = "1990";
    incrementYearEnd = "2021";
    incrementKMStart = "0";
    incrementKMEnd = "150000";
    loading = true;
    _IsSearching = false;
    categories.getPosts().then((categories) {
      setState(() {
        countries = categories;
        _searchList = categories;
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

  void dispose() {
    // Set portrait orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

/* 
  @override 
  
  void dispose() { 
fb
  super.dispose(); 

  controller.dispose(); 

  } 
*/

  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      translator.currentLanguage == 'en'
          ? landscape = MediaQuery.of(context).size.width * 0.17
          : landscape = MediaQuery.of(context).size.width * 0.097;

      translator.currentLanguage == 'en' ? paddding3 = 0 : paddding3 = 0;

      /*translator.currentLanguage == 'en'
          ? paddding = MediaQuery.of(context).size.width * 0.015
          : paddding = MediaQuery.of(context).size.width * 0.02;*/
      translator.currentLanguage == 'en' ? paddding = 1.5.w : paddding = 2.w;

      /*  translator.currentLanguage == 'en'
          ? paddding2 = MediaQuery.of(context).size.width * 0.02
          : paddding2 = MediaQuery.of(context).size.width * 0.015;*/
      translator.currentLanguage == 'en'
          ? paddding2 = 1.3.w
          : paddding2 = 1.5.w;
      /* translator.currentLanguage == 'en'
          ? paddding4 = MediaQuery.of(context).size.width * 0.87
          : paddding4 = MediaQuery.of(context).size.width * 0.015;*/
      /*  translator.currentLanguage == 'en'
          ? paddding4 = MediaQuery.of(context).size.width * 0.87
          : paddding4 = MediaQuery.of(context).size.width * 0.015;*/

      translator.currentLanguage == 'en'
          ? paddding4 = 87.w
          : paddding4 = MediaQuery.of(context).size.width * 0.015;

      //  paddding5 = MediaQuery.of(context).size.height * 0.07;
      paddding5 = 7.h;
      //  paddding6 = MediaQuery.of(context).size.height * 0.08;
      paddding6 = 8.h;
      //  paddding7 = MediaQuery.of(context).size.height * 0.37;
      paddding7 = 37.h;
      //  paddding8 = MediaQuery.of(context).size.height * 0.055;
      paddding8 = 5.5.h;
      //  paddding9 = MediaQuery.of(context).size.width * 0.15;
      paddding9 = 15.w;
      //  paddding10 = MediaQuery.of(context).size.width * 0.1;
      paddding10 = 10.w;
      //  paddding11 = MediaQuery.of(context).size.width * 0.25;
      paddding11 = 25.w;
      //paddding12 = MediaQuery.of(context).size.height * 0.045;
      paddding12 = 4.5.h;
      //  paddding13 = MediaQuery.of(context).size.height * 0.01;
      paddding13 = 1.h;
      //  paddding14 = MediaQuery.of(context).size.height * 0.015;
      paddding14 = 1.8.h;
      paddding15 = 0;

      //    paddding16 = MediaQuery.of(context).size.height * 0.0013;
      paddding16 = 0.13.h;
      //  paddding17 = MediaQuery.of(context).size.width * 0.4;
      paddding17 = 40.w;
      //  paddding18 = MediaQuery.of(context).size.width * 0.1;
      paddding18 = 10.w;
      //  paddding19 = MediaQuery.of(context).size.width * 0.108;
      paddding19 = 10.8.w;
      paddding20 = MediaQuery.of(context).size.height * 0.055;
      paddding21 = MediaQuery.of(context).size.width * 0.2;
      // paddding22 = MediaQuery.of(context).size.height * 0.00082;
      paddding22 = 0.082.h;
      // paddding23 = MediaQuery.of(context).size.width * 0.6;
      paddding23 = 60.w;
      paddding24 = 0.5.h;
      paddding25 = 1.h;
      padding26 = 1.h;
      padding27 = 0.7.h;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      translator.currentLanguage == 'en'
          ? paddding = 0
          : paddding = MediaQuery.of(context).size.width * 0.01;

      /* translator.currentLanguage == 'en'
          ? landscape = MediaQuery.of(context).size.width * 0.50
          : landscape = MediaQuery.of(context).size.width * 0.435;*/

      translator.currentLanguage == 'en'
          ? landscape = 81.w
          : landscape = MediaQuery.of(context).size.width * 0.435;
      /*  translator.currentLanguage == 'en'
          ? paddding3 = MediaQuery.of(context).size.width * 0.008
          : paddding3 = MediaQuery.of(context).size.width * 0.02;*/
      translator.currentLanguage == 'en'
          ? paddding3 = 0.008.w
          : paddding3 = MediaQuery.of(context).size.width * 0.02;

      translator.currentLanguage == 'en'
          ? paddding2 = 1.5.w
          : paddding2 = 1.5.w;
      /*   translator.currentLanguage == 'en'
          ? paddding4 = MediaQuery.of(context).size.width * 0.42
          : paddding4 = MediaQuery.of(context).size.width * 0.015;*/
      translator.currentLanguage == 'en'
          ? paddding4 = 70.w
          : paddding4 = MediaQuery.of(context).size.width * 0.015;
      //   paddding5 = MediaQuery.of(context).size.height * 0.12;
      paddding5 = 7.h;
      //  paddding6 = MediaQuery.of(context).size.height * 0.13;
      paddding6 = 8.h;
      //   paddding7 = MediaQuery.of(context).size.height * 0.5;
      // paddding8 = MediaQuery.of(context).size.height * 0.1;
      //   paddding9 = MediaQuery.of(context).size.width * 0.09;
      //   paddding10 = MediaQuery.of(context).size.width * 0.06;
      //   paddding11 = MediaQuery.of(context).size.width * 0.15;
      //    paddding12 = MediaQuery.of(context).size.height * 0.067;
      //  paddding13 = MediaQuery.of(context).size.height * 0.09;
      //  paddding14 = MediaQuery.of(context).size.height * 0.027;
      //  paddding15 = MediaQuery.of(context).size.height * 0.03;

      //  paddding16 = MediaQuery.of(context).size.height * 0.0023;

      //   paddding17 = MediaQuery.of(context).size.width * 0.3;
      //    paddding18 = MediaQuery.of(context).size.width * 0.075;
      //  paddding19 = MediaQuery.of(context).size.width * 0.07;
      //   paddding20 = MediaQuery.of(context).size.height * 0.1;
      //  paddding21 = MediaQuery.of(context).size.width * 0.25;
      //    paddding22 = MediaQuery.of(context).size.height * 0.00253;
      //  paddding23 = MediaQuery.of(context).size.width * 0.75;
      ////////////////////////////////////////////////////////
      paddding7 = 30.h;
      paddding8 = 6.h;
      paddding9 = 16.w;
      paddding10 = 8.w;
      paddding11 = 22.w;
      paddding12 = 4.5.h;
      paddding13 = 9.h;
      paddding14 = 1.7.h;
      paddding15 = 0.03.h;

      paddding16 = 0.15.h;

      paddding17 = 40.w;
      paddding18 = 6.h;
      paddding19 = 11.w;
      paddding20 = 10.h;
      paddding21 = 25.w;
      paddding22 = 0.15.h;
      paddding23 = 125.w;
      paddding24 = 0.5.h;
      paddding25 = 1.h;
//padding 3 = 0.02

    }

    return Scaffold(
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomInset: false,
        appBar: buildBar(context),

        /* AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.orange,
          title: Container(
            width: 300,
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              onTap: () {
                //   controller.clear();
                //   FocusScope.of(context).requestFocus(new FocusNode());
                /* setState(() {
                  flag = true;
                });*/
              },
              //     controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: new IconButton(
                  icon: new Icon(Icons.close),
                  onPressed: () {
                    controller.clear();
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                ),
                //  contentPadding:  EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              ),
            ),
          ),
          /* iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: PrimaryColor,
          actions: [
           
            
            PopupMenuButton<int>(

              onSelected: (item) => onSelected(item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text('Manual'),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('Automatic'),
                )
              ],
          ]),
            )*/
        ),*/
        body: OrientationBuilder(builder: (context, orientation) {
          return Column(
            children: <Widget>[
              AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: paddding5,
                  backgroundColor: Colors.orange,
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          right: paddding25,
                          left: paddding2,
                          bottom: paddding24,
                          top: paddding24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.grey),
                              foregroundColor: MaterialStateProperty.all<Color>(
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
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            void Function(void Function())
                                                setState) {
                                      return GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(),
                                        child: Container(
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
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: const Radius
                                                            .circular(15.0),
                                                        topRight: const Radius
                                                            .circular(15.0),
                                                      ),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      controller:
                                                          scrollController,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.h,
                                                                    left: 4.w),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                "Filter items",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.sp),
                                                              ),
                                                            ),
                                                          ),
                                                          Divider(),
                                                          Text("By price",
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
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
                                                            onChanged:
                                                                (values) {
                                                              setState(() {
                                                                _currentRangeValuesPriceTest
                                                                        .start =
                                                                    values
                                                                        .start;

                                                                _currentRangeValuesPriceTest
                                                                    .end = (_currentRangeValuesPriceTest.start ==
                                                                            0 &&
                                                                        values.end <
                                                                            5000
                                                                    ? _currentRangeValuesPriceTest
                                                                        .end
                                                                    : values
                                                                        .end);

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
                                                                            children: <Widget>[
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
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onTap: () {
                                                                                    int currentValue = int.parse(incrementPriceStart);
                                                                                    int incValue = int.parse(incrementPriceEnd);

                                                                                    setState(() {
                                                                                      /*
                                                                                currentValue =
                                                                                    currentValue +
                                                                                        5000;

                                                                                incrementPriceStart =
                                                                                    (currentValue).toString(); // incrementing value
                                                                                _currentRangeValuesPriceTest.start =
                                                                                    currentValue;*/

                                                                                      currentValue = currentValue + 5000;

                                                                                      incrementPriceStart = (currentValue <= incValue ? currentValue : incrementPriceStart).toString(); // incrementing value

                                                                                      //   incrementPriceStart = (incrementPriceStart == (445000).toString() ? currentValue : incrementPriceStart).toString(); // incrementing value

                                                                                      _currentRangeValuesPriceTest.start = double.parse(incrementPriceStart);

                                                                                      //    values1.start.toInt=int.parse(controller.text);
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                child: Icon(
                                                                                  Icons.arrow_drop_down,
                                                                                  size: 18.0,
                                                                                ),
                                                                                onTap: () {
                                                                                  /* int currentValue = int.parse(incrementPriceStart);
                                                                            setState(
                                                                                () {
                                                                              currentValue =
                                                                                  currentValue -
                                                                                      5000;
                                                                              incrementPriceStart = (currentValue > 0
                                                                                      ? currentValue
                                                                                      : 0)
                                                                                  .toString(); // decrementing value

                                                                              _currentRangeValuesPriceTest
                                                                                  .start = (currentValue > 0
                                                                                      ? currentValue
                                                                                      : 0)
                                                                                  .toDouble();*/

                                                                                  int currentValue = int.parse(incrementPriceStart);
                                                                                  setState(() {
                                                                                    currentValue = currentValue - 5000;
                                                                                    incrementPriceStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                    _currentRangeValuesPriceTest.start = (currentValue > 0 && currentValue <= _currentRangeValuesPriceTest.end ? currentValue : 0).toDouble();
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child: Text(incrementPriceStart.toString().replaceAll(
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
                                                                            children: <Widget>[
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
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onTap: () {
                                                                                    int currentValue = int.parse(incrementPriceEnd);
                                                                                    setState(() {
                                                                                      currentValue = currentValue + 5000;

                                                                                      incrementPriceEnd = (currentValue < 450000 ? currentValue : 450000).toString();

                                                                                      _currentRangeValuesPriceTest.end = (currentValue < 450000 ? currentValue : 450000).toDouble();
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                child: Icon(
                                                                                  Icons.arrow_drop_down,
                                                                                  size: 18.0,
                                                                                ),
                                                                                onTap: () {
                                                                                  int currentValue = int.parse(incrementPriceEnd);
                                                                                  setState(() {
                                                                                    currentValue = currentValue - 5000;

                                                                                    incrementPriceEnd = (currentValue >= _currentRangeValuesPriceTest.start ? currentValue : incrementPriceEnd).toString(); // decrementing value
                                                                                    incrementPriceEnd = (incrementPriceEnd == (0).toString() ? incrementPriceEnd = "5000" : incrementPriceEnd).toString();
                                                                                    _currentRangeValuesPriceTest.end = double.parse(incrementPriceEnd);
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(incrementPriceEnd),
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
                                                          Text("By Year",
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                              )),
                                                          RangeSlider(
                                                            activeColor:
                                                                Colors.grey,
                                                            values:
                                                                _currentRangeValuesYear,
                                                            min: 1990,
                                                            max: 2021.0,
                                                            //   divisions: 50,
                                                            labels: RangeLabels(
                                                              _currentRangeValuesYear
                                                                  .start
                                                                  .round()
                                                                  .toString(),
                                                              _currentRangeValuesYear
                                                                  .end
                                                                  .round()
                                                                  .toString(),
                                                            ),
                                                            onChanged:
                                                                (RangeValues
                                                                    values1) {
                                                              setState(() {
                                                                _currentRangeValuesYear
                                                                        .start =
                                                                    values1
                                                                        .start;
                                                                _currentRangeValuesYear
                                                                    .end = (_currentRangeValuesYear.start ==
                                                                            0 &&
                                                                        values1.end <
                                                                            1990
                                                                    ? _currentRangeValuesYear
                                                                        .end
                                                                    : values1
                                                                        .end);

                                                                incrementYearStart =
                                                                    _currentRangeValuesYear
                                                                        .start
                                                                        .round()
                                                                        .toString();

                                                                incrementYearEnd =
                                                                    _currentRangeValuesYear
                                                                        .end
                                                                        .round()
                                                                        .toString();
                                                              });
                                                            },
                                                          ),
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
                                                                            children: <Widget>[
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
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onTap: () {
                                                                                    int currentValue = int.parse(incrementYearStart);
                                                                                    int incValue = int.parse(incrementYearEnd);

                                                                                    setState(() {
                                                                                      currentValue++;
                                                                                      incrementYearStart = (currentValue <= incValue ? currentValue : incrementYearStart).toString();

                                                                                      _currentRangeValuesYear.start = double.parse(incrementYearStart);
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                child: Icon(
                                                                                  Icons.arrow_drop_down,
                                                                                  size: 18.0,
                                                                                ),
                                                                                onTap: () {
                                                                                  int currentValue = int.parse(incrementYearStart);

                                                                                  setState(() {
                                                                                    currentValue--;
                                                                                    incrementYearStart = (currentValue > 1990 ? currentValue : 1990).toString(); // decrementing value

                                                                                    _currentRangeValuesYear.start = (currentValue > 1990 && currentValue <= _currentRangeValuesYear.end ? currentValue : 1990).toDouble();
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child: Text(
                                                                              incrementYearStart,
                                                                              style: TextStyle(
                                                                                fontSize: 12.sp,
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
                                                                            children: <Widget>[
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
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onTap: () {
                                                                                    int currentValue = int.parse(incrementYearEnd);
                                                                                    setState(() {
                                                                                      currentValue++;

                                                                                      incrementYearEnd = (currentValue < 2021 ? currentValue : 2021).toString();

                                                                                      _currentRangeValuesYear.end = (currentValue < 2021 ? currentValue : 2021).toDouble();
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                child: Icon(
                                                                                  Icons.arrow_drop_down,
                                                                                  size: 18.0,
                                                                                ),
                                                                                onTap: () {
                                                                                  int currentValue = int.parse(incrementYearEnd);
                                                                                  setState(() {
                                                                                    currentValue--;

                                                                                    incrementYearEnd = (currentValue >= _currentRangeValuesYear.start ? currentValue : incrementYearEnd).toString(); // decrementing value
                                                                                    incrementYearEnd = (incrementYearEnd == (0).toString() ? incrementYearEnd = "1990" : incrementYearEnd).toString();
                                                                                    _currentRangeValuesYear.end = double.parse(incrementYearEnd);
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child: Text(
                                                                              incrementYearEnd,
                                                                              style: TextStyle(
                                                                                fontSize: 12.sp,
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
                                                          Text("By km",
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                              )),
                                                          RangeSlider(
                                                            activeColor:
                                                                Colors.grey,
                                                            values:
                                                                _currentRangeValuesKM,
                                                            min: 0,
                                                            max: 150000,
                                                            divisions: 15,
                                                            labels: RangeLabels(
                                                              _currentRangeValuesKM
                                                                  .start
                                                                  .round()
                                                                  .toString(),
                                                              _currentRangeValuesKM
                                                                  .end
                                                                  .round()
                                                                  .toString(),
                                                            ),
                                                            onChanged:
                                                                (RangeValues
                                                                    values1) {
                                                              setState(() {
                                                                _currentRangeValuesKM
                                                                        .start =
                                                                    values1
                                                                        .start;
                                                                _currentRangeValuesKM
                                                                    .end = (_currentRangeValuesKM.start ==
                                                                            0 &&
                                                                        values1.end <
                                                                            5000
                                                                    ? _currentRangeValuesKM
                                                                        .end
                                                                    : values1
                                                                        .end);

                                                                incrementKMStart =
                                                                    _currentRangeValuesKM
                                                                        .start
                                                                        .round()
                                                                        .toString();

                                                                incrementKMEnd =
                                                                    _currentRangeValuesKM
                                                                        .end
                                                                        .round()
                                                                        .toString();
                                                              });
                                                            },
                                                          ),
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
                                                                            children: <Widget>[
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
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onTap: () {
                                                                                    int currentValue = int.parse(incrementKMStart);
                                                                                    int incValue = int.parse(incrementKMEnd);

                                                                                    setState(() {
                                                                                      currentValue = currentValue + 10000;

                                                                                      incrementKMStart = (currentValue <= incValue ? currentValue : incrementKMStart).toString();
                                                                                      _currentRangeValuesKM.start = double.parse(incrementKMStart);
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                child: Icon(
                                                                                  Icons.arrow_drop_down,
                                                                                  size: 18.0,
                                                                                ),
                                                                                onTap: () {
                                                                                  int currentValue = int.parse(incrementKMStart);
                                                                                  setState(() {
                                                                                    currentValue = currentValue - 10000;
                                                                                    incrementKMStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                    _currentRangeValuesKM.start = (currentValue > 0 && currentValue <= _currentRangeValuesKM.end ? currentValue : 0).toDouble();
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child: Text(
                                                                              incrementKMStart,
                                                                              style: TextStyle(
                                                                                fontSize: 12.sp,
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
                                                                            children: <Widget>[
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
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onTap: () {
                                                                                    int currentValue = int.parse(incrementKMEnd);
                                                                                    setState(() {
                                                                                      currentValue = currentValue + 10000;

                                                                                      incrementKMEnd = (currentValue < 150000 ? currentValue : 150000).toString();

                                                                                      _currentRangeValuesKM.end = (currentValue < 150000 ? currentValue : 150000).toDouble();
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                child: Icon(
                                                                                  Icons.arrow_drop_down,
                                                                                  size: 18.0,
                                                                                ),
                                                                                onTap: () {
                                                                                  double currentValue = double.parse(incrementKMEnd);
                                                                                  setState(() {
                                                                                    currentValue = currentValue - 10000;

                                                                                    incrementKMEnd = (currentValue >= _currentRangeValuesKM.start ? currentValue : incrementKMEnd).toString(); // decrementing value
                                                                                    incrementKMEnd = (incrementKMEnd == (0).toString() ? incrementKMEnd = "10000" : incrementKMEnd).toString();
                                                                                    _currentRangeValuesKM.end = double.parse(incrementKMEnd);
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child: Text(
                                                                              incrementKMEnd,
                                                                              style: TextStyle(
                                                                                fontSize: 12.sp,
                                                                              )),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20),
                                                            child:
                                                                MaterialButton(
                                                              elevation: 2,
                                                              height:
                                                                  paddding20,
                                                              minWidth:
                                                                  paddding21,
                                                              color:
                                                                  Colors.white,
                                                              child: Text(
                                                                  "Apply Filter",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .orange,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  )),
                                                              onPressed: () {
                                                                _buildFilterList();
                                                                print(
                                                                    "onpressed${result.length}");
                                                                _handleSearchStart();
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ));
                                              }),
                                        ),
                                      );
                                    });
                                  }); /////
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: paddding24, top: paddding24),
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
                            Text(translator.translate("Sort"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ))
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
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text("Sort By",
                                                      style: new TextStyle(
                                                        fontSize: 14.sp,
                                                      )),
                                                ),
                                                SizedBox(width: paddding23),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          id = 10;
                                                        });

                                                        print(id);
                                                      },
                                                      child: Text("Reset",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize:
                                                                  12.sp))),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1.5,
                                              height: 1,
                                            ),
                                            Expanded(
                                                child: Column(
                                              children: model
                                                  .map((data) => RadioListTile(
                                                        activeColor:
                                                            Colors.orange,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        title: Text(
                                                            "${data.name}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    14.sp)),
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
                    SizedBox(width: landscape),
                    Padding(
                      padding: EdgeInsets.only(
                          right: paddding3,
                          bottom: paddding24,
                          top: paddding24),
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
                            Text(translator.translate("List"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ))
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
                          left: paddding25,
                          right: paddding2,
                          bottom: paddding24,
                          top: paddding24),
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
                            Text(translator.translate("Grid"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ))
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
                  ]),
              if (orientation == Orientation.portrait)
                FutureBuilder(
                    future: categories.getPosts(),
                    // ignore: missing_return
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: _buildListView2(1, true, 1),
                        );
                      } else if (snapshot.hasError) {
                        print("nooo");
                      } else {
                        return Padding(
                            padding: new EdgeInsets.only(top: 35.h),
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.orange),
                            ));
                      }
                    }),
              if (orientation == Orientation.landscape)
                Expanded(
                  child: _buildListView2(2, false, 0.8),
                ),
            ],
          );
        }));
  }

  void onSelected(int item) {
    switch (item) {
      case 0:
        break;

      case 1:
        break;
    }
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

  Widget createGridItem(
      int position, List<MotorsParse> data, int index, bool padding, double padding2) {
    //// 190 ????????????
    ////130 ????????
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

    return Builder(builder: (context) {
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, paddding13),
          child: Card( 
            elevation: 6,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SpecializationComp();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  SizedBox(
                    height: paddding7,
                    child: Stack(children: [
                      Carousel(
                        boxFit: BoxFit.cover,
                        autoplay: false,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 1000),
                        dotSize: 6.0,
                        dotIncreasedColor: Color(0xFFFF9800),
                        dotBgColor: Colors.transparent,
                        dotPosition: DotPosition.bottomCenter,
                        dotVerticalPadding: padding26,
                        showIndicator: true,
                        indicatorBgPadding: padding27,
                        images: [
                          watermark(
                              'http://oxydu.linkgroupsy.com/linkgroupsy/Oxydusub/wp-content/uploads/2021/04/image-3.png?v=1621775342'),
                          watermark(
                              'http://oxydu.linkgroupsy.com/linkgroupsy/Oxydusub/wp-content/uploads/2021/04/image-3.png?v=1621775342'),
                          watermark(
                              'http://oxydu.linkgroupsy.com/linkgroupsy/Oxydusub/wp-content/uploads/2021/04/image-3.png?v=1621775342'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (!padding)
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 1.h, 50.w, 20.h),
                              child: Container(
                                  child: frostedText(Center(
                                child: Text("25000",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ))),
                            ),
                          if (padding)
                            Padding(
                              //   257
                              padding: EdgeInsets.fromLTRB(0, 5,
                                  MediaQuery.of(context).size.width * 0.65, 20),
                              child: Container(
                                  child: frostedText(Center(
                                child: Text("25000",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ))),
                            ),
                        ],
                      )
                    ]),
                  ),
                  SizedBox(height: paddding15),
                  SizedBox(
                    width: paddding4,
                    child: Row(
                      children: [
                        SizedBox(
                          width: padding2,
                          child: Row(
                            children: [
                              Text(translator.translate("Model"),
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Text(
                                  data[index].name.length > 22
                                      ? data[index].name.substring(0, 22) +
                                          '...'
                                      : data[index].name,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        Container(
                            height: paddding8,
                            width: paddding9,
                            child: frostedIconButton(
                              IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {}),
                            )),
                        Container(
                            height: paddding8,
                            width: paddding10,
                            child: frostedIconButton(
                              IconButton(
                                  icon: Icon(
                                    Icons.flag_outlined,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {}),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: paddding4,
                      child: Row(
                        children: [
                          Text(translator.translate("Type"),
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text("${data[index].age}",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 13.sp, color: Colors.grey[600])),
                        ],
                      )),
                  SizedBox(
                    height: paddding14,
                  ),
                  SizedBox(
                      width: paddding4,
                      child: Row(
                        children: [
                          Text(translator.translate("Year"),
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          //     Text("${data[index].city}",
                          Text("${data[index].year}",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 13.sp, color: Colors.grey[600])),
                        ],
                      )),
                  SizedBox(
                    height: paddding14,
                  ),
                  SizedBox(
                      width: paddding4,
                      child: Row(
                        children: [
                          Text("Car Type:",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          //    Text("Km:${data[index].city}",
                          Text("${data[index].name}",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 13.sp,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.grey[600])),
                        ],
                      ))
                ],
              ),
              // ),
            ),
          ),
        ),
      );
    });
  }

/////////////////////////////////////////////////?????? ????????
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
            crossAxisCount: number, childAspectRatio: aspect),
        /*  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisCount:1,
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),*/

        itemCount: _searchList.length,
        itemBuilder: (BuildContext context, int index) {
          /*  if (filter.isEmpty) {
              // landscape;
              // print("ffff");
              return createGridItem(6, countries, index, padding, 65);
            }


          print("hoon");
          print(countries
              .where((element) =>
                  element.name.toLowerCase().contains(filter.toLowerCase()))
              .toList()
              .length);*/

          ///////////////////////////////////////////////uture
          if (!padding) {
            if (filter.isEmpty) {
              // landscape;c
              return createGridItem(6, _searchList, index, padding, 155);
            }
          }
          if (padding) {
            return createGridItem(6, _searchList, index, padding, 220);

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
          } else
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
        toolbarHeight: paddding6,
        centerTitle: true,
        title: appBarTitle,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = TextField(
                    cursorColor: Colors.white,
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
                      hintText: "Search here..",
                      hintStyle: TextStyle(color: Colors.white),
                      isDense: true,
                    ),
                    /*InputDecoration(
                        hintText: "Search here..",
                        hintStyle: TextStyle(color: Colors.white)),*/
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        "My Properties",
        style: TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}*/
//////////////////////////////////////////////////////////////////////////////////

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:oxydu/Data/ForRent/AutoGeneratedMotors.dart';
import 'package:oxydu/Data/ForRent/classes/ServiceMotors.dart';
import 'package:oxydu/itemPage/BuyItemPage.dart';
import 'package:oxydu/itemPage/buyitem_page.dart';
import '../WaterMark.dart';
import 'AllinMotorsTest.dart';
import 'package:sizer/sizer.dart';

import 'BuyItemMotorsManagement.dart';
import 'StateManagementMotors.dart';

TextEditingController controller = new TextEditingController();
final servic = ServiceMotors();
String filter = "";

bool loading;
RangeValues _currentRangeValuesPriceTest = RangeValues(0, 450000);
RangeValues _currentRangeValuesKM = RangeValues(0, 150000);
RangeValues _currentRangeValuesYear = RangeValues(1990, 2021);
RangeValues range;
RangeValues values1;
bool flag = false, textSearch = false, textFirstTime = false;
bool flag2 = false;
bool flag3 = false;
int grid = 0;
String incrementPriceStart = "";
String incrementPriceEnd = "";
String incrementYearStart = "";
String incrementYearEnd = "";
String incrementKMStart = "";
String incrementKMEnd = "";
String _searchText = "";
// ignore: deprecated_member_use
List<MotorsParse> _searchList = List();
List<MotorsParse> countries, result;

bool _IsSearching;

final TextEditingController _searchQuery = TextEditingController();
RegExp regex = RegExp(r"([.]*0)(?!.*\d)");

// ignore: deprecated_member_use
List<MotorsParse> _searchList2 = List();
List<bool> weightData;
List<String> usage, age, condition, warranty;
int choiceUsage = 10,
    choiceAge = 10,
    choiceCondition = 10,
    choiceWarranty = 10,
    subString = 0,
    subString2 = 0,
    substring3 = 0;

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
String longSpinnerValue = condition[0];

class UsedCarForSale extends StatefulWidget {
  @override
  State createState() => UsedCarForSaleState();
  final String title;
  final int carModelAPI, choice;
  UsedCarForSale({
    @required this.title,
    @required this.carModelAPI,
    @required this.choice,
  });
}

class SortList {
  String name;
  int index;
  SortList({this.name, this.index});
}

class UsedCarForSaleState extends State<UsedCarForSale> {
  // Default Radio Button Item
  String radioItem = 'Sort..';

  MotorsStateManagement get motorsService => GetIt.I<MotorsStateManagement>();
  // Group Value for Radio Button.
  int id = 10;

  List<SortList> sort;

  List<RangeSliderData> rangeSliders;
  double padding = 0.0;
  Icon actionIconTab = Icon(Icons.search, color: Colors.white, size: 5.w);
  Icon actionIconMob = Icon(Icons.search, color: Colors.white, size: 6.w);
  Widget appBarTitle;

  UsedCarForSaleState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          print("call1");
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          print("call2");
          _buildSearchList();
        });
      }
    });
  }

  List<MotorsParse> _buildSearchList() {
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
      /*_searchList = result
          .where((element) =>
              element.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();*/
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

  List<MotorsParse> _buildSortList() {
    if (id == 10) result.sort((b, a) => (a.acf.price).compareTo(b.acf.price));
    if (id == 1) result.sort((a, b) => (a.acf.price).compareTo(b.acf.price));
    if (id == 2) result.sort((b, a) => (a.acf.price).compareTo(b.acf.price));
    if (id == 3) result.sort((a, b) => (a.acf.price).compareTo(b.acf.price));
    if (id == 4) result.sort((b, a) => (a.acf.price).compareTo(b.acf.price));

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

  final categories = ServiceMotors();
  //final categories = ServicesMob.getPosts();
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
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
    incrementPriceStart = "0";
    incrementPriceEnd = "450000";
    incrementYearStart = "1990";
    incrementYearEnd = "2021";
    incrementKMStart = "0";
    incrementKMEnd = "150000";
    loading = true;
    _IsSearching = false;

    rangeSliders = _rangeSliderDefinitions();
    categories.getPosts(widget.carModelAPI).then((categories) {
      setState(() {
        countries = categories;
        _searchList = categories;
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

  List<MotorsParse> _buildFilterList() {
    if (widget.choice == 1) //for Used Cars
      _searchList = countries
          .where((element) =>
              int.parse(element.acf.price) >=
                  _currentRangeValuesPriceTest.start &&
              int.parse(element.acf.kilometersUsed) >=
                  _currentRangeValuesKM.start &&
              int.parse(element.acf.yearOfManuf) >=
                  _currentRangeValuesYear.start)
          .toList();
    if (widget.choice == 2) //For Heavy Vehicle
      _searchList = countries
          .where((element) =>
              int.parse(element.acf.price) >=
                  _currentRangeValuesPriceTest.start &&
              int.parse(element.acf.kilometerHeavyveh) >=
                  _currentRangeValuesKM.start &&
              int.parse(element.acf.yearHeavyveh) >=
                  _currentRangeValuesYear.start)
          .toList();
    if (widget.choice == 3) //For MotorCycle
      _searchList = countries
          .where((element) =>
              int.parse(element.acf.price) >=
                  _currentRangeValuesPriceTest.start &&
              int.parse(element.acf.kilometersMotorcycle) >=
                  _currentRangeValuesKM.start &&
              int.parse(element.acf.yearOfManfMotorcycle) >=
                  _currentRangeValuesYear.start)
          .toList();

    result = _searchList;
    return _searchList;
  }

  Widget build(BuildContext context) {
    print(widget.carModelAPI);
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
    appBarTitle = new Text("${translator.translate("${widget.title}")}",
        style: new TextStyle(color: Colors.white, fontSize: 4.w));
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      paddding50 = 50.w;
      paddding52 = 3.2.w;

      translator.currentLanguage == 'en' ? subString = 20 : subString = 28;
      translator.currentLanguage == 'en' ? subString2 = 35 : subString2 = 30;
      if (SizerUtil.deviceType == DeviceType.mobile) {
        leadingSize = 0.3.w;
        paddding49 = 35.w;
        paddding29 = 0;
        paddding30 = 3.w;
        paddding31 = 68.w;
        paddding32 = 3.w;
        paddding33 = 1.w;
        paddding34 = 30.w;
        //?????????????? ???? ?????? ??????????????
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
        //???????????? ???? ?????? ?????????????? ?? ????????????
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
        leadingSize = 0.3.w;

        paddding44 = 13.w;

        paddding5 = 12.w;
        paddding29 = 25.w;
        paddding30 = 5.w;
        //???????????? ????????????
        translator.currentLanguage == 'en'
            ? paddding31 = 30.h
            : paddding31 = 30.h;
        paddding7 = 31.h;

        paddding32 = 1.w;
        paddding33 = 1.w;
        paddding11 = 25.w;
        paddding12 = 8.w;
        //???????????? ????????????????????
        paddding35 = 33.5.h;
        //font size
        paddding36 = 3.7.w;
        //??????????????
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
        //???????????? ???? ?????? ?????????????? ?? ????????????
        translator.currentLanguage == 'en'
            ? paddding23 = 148.w
            : paddding23 = 122.w;
        paddding39 = 6.w;
        paddding47 = 14.w;
        //???????????? ?????????? ????????????
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
        //???????????? ?????????? ????????????
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

          //???????????? ???? ?????? ?????????????? ?? ????????????
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
        //???????????? ????????????
        translator.currentLanguage == 'en'
            ? paddding31 = 30.h
            : paddding31 = 30.h;
        paddding7 = 31.h;
        paddding32 = 1.w;
        paddding33 = 1.w;
        paddding11 = 25.w;

        paddding12 = 8.w;
        //???????????? ????????????????????
        paddding35 = 33.5.h;
        //font size
        paddding36 = 3.7.w;
        //??????????????
        translator.currentLanguage == 'en'
            ? paddding14 = 0.7.w
            : paddding14 = 0.00002.w;
        translator.currentLanguage == 'en' ? subString = 15 : subString = 15;
        translator.currentLanguage == 'en' ? subString2 = 30 : subString2 = 30;
        paddding40 = 4.2.w;
        paddding52 = 2.3.w;
        paddding46 = 5.w;
        //???????????? ???? ?????? ?????????????? ?? ????????????
        translator.currentLanguage == 'en'
            ? paddding23 = 130.w
            : paddding23 = 122.w;
        paddding39 = 6.w;
        paddding47 = 14.w;
        //???????????? ?????????? ????????????
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
        //???????????? ?????????? ????????????
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
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context,
                                                  void Function(void Function())
                                                      setState) {
                                            return /* GestureDetector(
                                              onTap: () =>
                                                  Navigator.of(context).pop(),
                                              child:*/
                                                Container(
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.001),
                                              child: DraggableScrollableSheet(
                                                  initialChildSize: paddding16,
                                                  maxChildSize: paddding16,
                                                  builder: (context,
                                                      ScrollController
                                                          scrollController) {
                                                    return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft: const Radius
                                                                .circular(15.0),
                                                            topRight: const Radius
                                                                .circular(15.0),
                                                          ),
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          controller:
                                                              scrollController,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            2.h,
                                                                        left: 4
                                                                            .w),
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
                                                                      TextStyle(
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
                                                                labels:
                                                                    RangeLabels(
                                                                  _currentRangeValuesPriceTest
                                                                      .start
                                                                      .round()
                                                                      .toString(),
                                                                  _currentRangeValuesPriceTest
                                                                      .end
                                                                      .round()
                                                                      .toString(),
                                                                ),
                                                                onChanged:
                                                                    (values) {
                                                                  setState(() {
                                                                    _currentRangeValuesPriceTest
                                                                            .start =
                                                                        values
                                                                            .start;

                                                                    _currentRangeValuesPriceTest
                                                                        .end = (_currentRangeValuesPriceTest.start ==
                                                                                0 &&
                                                                            values.end <
                                                                                5000
                                                                        ? _currentRangeValuesPriceTest
                                                                            .end
                                                                        : values
                                                                            .end);

                                                                    incrementPriceStart = _currentRangeValuesPriceTest
                                                                        .start
                                                                        .round()
                                                                        .toString();

                                                                    incrementPriceEnd =
                                                                        _currentRangeValuesPriceTest
                                                                            .end
                                                                            .round()
                                                                            .toString();
                                                                  });
                                                                },
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            paddding17,
                                                                        foregroundDecoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.blueGrey,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              width: paddding18,
                                                                              height: paddding19,
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
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
                                                                                        int currentValue = int.parse(incrementPriceStart);
                                                                                        int incValue = int.parse(incrementPriceEnd);

                                                                                        setState(() {
                                                                                          /*
                                                                                currentValue =
                                                                                    currentValue +
                                                                                        5000;

                                                                                incrementPriceStart =
                                                                                    (currentValue).toString(); // incrementing value
                                                                                _currentRangeValuesPriceTest.start =
                                                                                    currentValue;*/

                                                                                          currentValue = currentValue + 5000;

                                                                                          incrementPriceStart = (currentValue <= incValue ? currentValue : incrementPriceStart).toString(); // incrementing value

                                                                                          //   incrementPriceStart = (incrementPriceStart == (445000).toString() ? currentValue : incrementPriceStart).toString(); // incrementing value

                                                                                          _currentRangeValuesPriceTest.start = double.parse(incrementPriceStart);

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
                                                                                      /* int currentValue = int.parse(incrementPriceStart);
                                                                            setState(
                                                                                () {
                                                                              currentValue =
                                                                                  currentValue -
                                                                                      5000;
                                                                              incrementPriceStart = (currentValue > 0
                                                                                      ? currentValue
                                                                                      : 0)
                                                                                  .toString(); // decrementing value

                                                                              _currentRangeValuesPriceTest
                                                                                  .start = (currentValue > 0
                                                                                      ? currentValue
                                                                                      : 0)
                                                                                  .toDouble();*/

                                                                                      int currentValue = int.parse(incrementPriceStart);
                                                                                      setState(() {
                                                                                        currentValue = currentValue - 5000;
                                                                                        incrementPriceStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                        _currentRangeValuesPriceTest.start = (currentValue > 0 && currentValue <= _currentRangeValuesPriceTest.end ? currentValue : 0).toDouble();
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              // child: Text(incrementPriceStart.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "")),
                                                                              child: Text(
                                                                                incrementPriceStart,
                                                                                style: TextStyle(
                                                                                  fontSize: paddding41,
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            paddding17,
                                                                        foregroundDecoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.blueGrey,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              width: paddding18,
                                                                              height: paddding19,
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
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
                                                                                        int currentValue = int.parse(incrementPriceEnd);
                                                                                        setState(() {
                                                                                          currentValue = currentValue + 5000;

                                                                                          incrementPriceEnd = (currentValue < 450000 ? currentValue : 450000).toString();

                                                                                          _currentRangeValuesPriceTest.end = (currentValue < 450000 ? currentValue : 450000).toDouble();
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
                                                                                      int currentValue = int.parse(incrementPriceEnd);
                                                                                      setState(() {
                                                                                        currentValue = currentValue - 5000;

                                                                                        incrementPriceEnd = (currentValue >= _currentRangeValuesPriceTest.start ? currentValue : incrementPriceEnd).toString(); // decrementing value
                                                                                        incrementPriceEnd = (incrementPriceEnd == (0).toString() ? incrementPriceEnd = "5000" : incrementPriceEnd).toString();
                                                                                        _currentRangeValuesPriceTest.end = double.parse(incrementPriceEnd);
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Text(incrementPriceEnd,
                                                                                  style: TextStyle(
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
                                                              Text(
                                                                  "${translator.translate("ByYear")}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        paddding40,
                                                                  )),
                                                              RangeSlider(
                                                                activeColor:
                                                                    Colors.grey,
                                                                values:
                                                                    _currentRangeValuesYear,
                                                                min: 1990,
                                                                max: 2021.0,
                                                                //   divisions: 50,
                                                                labels:
                                                                    RangeLabels(
                                                                  _currentRangeValuesYear
                                                                      .start
                                                                      .round()
                                                                      .toString(),
                                                                  _currentRangeValuesYear
                                                                      .end
                                                                      .round()
                                                                      .toString(),
                                                                ),
                                                                onChanged:
                                                                    (RangeValues
                                                                        values1) {
                                                                  setState(() {
                                                                    _currentRangeValuesYear
                                                                            .start =
                                                                        values1
                                                                            .start;
                                                                    _currentRangeValuesYear
                                                                        .end = (_currentRangeValuesYear.start ==
                                                                                0 &&
                                                                            values1.end <
                                                                                1990
                                                                        ? _currentRangeValuesYear
                                                                            .end
                                                                        : values1
                                                                            .end);

                                                                    incrementYearStart = _currentRangeValuesYear
                                                                        .start
                                                                        .round()
                                                                        .toString();

                                                                    incrementYearEnd =
                                                                        _currentRangeValuesYear
                                                                            .end
                                                                            .round()
                                                                            .toString();
                                                                  });
                                                                },
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            paddding17,
                                                                        foregroundDecoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.blueGrey,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              width: paddding18,
                                                                              height: paddding19,
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
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
                                                                                        int currentValue = int.parse(incrementYearStart);
                                                                                        int incValue = int.parse(incrementYearEnd);

                                                                                        setState(() {
                                                                                          currentValue++;
                                                                                          incrementYearStart = (currentValue <= incValue ? currentValue : incrementYearStart).toString();

                                                                                          _currentRangeValuesYear.start = double.parse(incrementYearStart);
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
                                                                                      int currentValue = int.parse(incrementYearStart);

                                                                                      setState(() {
                                                                                        currentValue--;
                                                                                        incrementYearStart = (currentValue > 1990 ? currentValue : 1990).toString(); // decrementing value

                                                                                        _currentRangeValuesYear.start = (currentValue > 1990 && currentValue <= _currentRangeValuesYear.end ? currentValue : 1990).toDouble();
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Text(incrementYearStart,
                                                                                  style: TextStyle(
                                                                                    fontSize: paddding41,
                                                                                  )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            paddding17,
                                                                        foregroundDecoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.blueGrey,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              width: paddding18,
                                                                              height: paddding19,
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
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
                                                                                        int currentValue = int.parse(incrementYearEnd);
                                                                                        setState(() {
                                                                                          currentValue++;

                                                                                          incrementYearEnd = (currentValue < 2021 ? currentValue : 2021).toString();

                                                                                          _currentRangeValuesYear.end = (currentValue < 2021 ? currentValue : 2021).toDouble();
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
                                                                                      int currentValue = int.parse(incrementYearEnd);
                                                                                      setState(() {
                                                                                        currentValue--;

                                                                                        incrementYearEnd = (currentValue >= _currentRangeValuesYear.start ? currentValue : incrementYearEnd).toString(); // decrementing value
                                                                                        incrementYearEnd = (incrementYearEnd == (0).toString() ? incrementYearEnd = "1990" : incrementYearEnd).toString();
                                                                                        _currentRangeValuesYear.end = double.parse(incrementYearEnd);
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Text(incrementYearEnd,
                                                                                  style: TextStyle(
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
                                                              Text(
                                                                  "${translator.translate("ByKm")}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        paddding40,
                                                                  )),
                                                              RangeSlider(
                                                                activeColor:
                                                                    Colors.grey,
                                                                values:
                                                                    _currentRangeValuesKM,
                                                                min: 0,
                                                                max: 150000,
                                                                divisions: 15,
                                                                labels:
                                                                    RangeLabels(
                                                                  _currentRangeValuesKM
                                                                      .start
                                                                      .round()
                                                                      .toString(),
                                                                  _currentRangeValuesKM
                                                                      .end
                                                                      .round()
                                                                      .toString(),
                                                                ),
                                                                onChanged:
                                                                    (RangeValues
                                                                        values1) {
                                                                  setState(() {
                                                                    _currentRangeValuesKM
                                                                            .start =
                                                                        values1
                                                                            .start;
                                                                    _currentRangeValuesKM
                                                                        .end = (_currentRangeValuesKM.start ==
                                                                                0 &&
                                                                            values1.end <
                                                                                5000
                                                                        ? _currentRangeValuesKM
                                                                            .end
                                                                        : values1
                                                                            .end);

                                                                    incrementKMStart = _currentRangeValuesKM
                                                                        .start
                                                                        .round()
                                                                        .toString();

                                                                    incrementKMEnd =
                                                                        _currentRangeValuesKM
                                                                            .end
                                                                            .round()
                                                                            .toString();
                                                                  });
                                                                },
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            paddding17,
                                                                        foregroundDecoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.blueGrey,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              width: paddding18,
                                                                              height: paddding19,
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
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
                                                                                        int currentValue = int.parse(incrementKMStart);
                                                                                        int incValue = int.parse(incrementKMEnd);

                                                                                        setState(() {
                                                                                          currentValue = currentValue + 10000;

                                                                                          incrementKMStart = (currentValue <= incValue ? currentValue : incrementKMStart).toString();
                                                                                          _currentRangeValuesKM.start = double.parse(incrementKMStart);
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
                                                                                      int currentValue = int.parse(incrementKMStart);
                                                                                      setState(() {
                                                                                        currentValue = currentValue - 10000;
                                                                                        incrementKMStart = (currentValue > 0 ? currentValue : 0).toString(); // decrementing value

                                                                                        _currentRangeValuesKM.start = (currentValue > 0 && currentValue <= _currentRangeValuesKM.end ? currentValue : 0).toDouble();
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Text(incrementKMStart,
                                                                                  style: TextStyle(
                                                                                    fontSize: paddding41,
                                                                                  )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            paddding17,
                                                                        foregroundDecoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.blueGrey,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              width: paddding18,
                                                                              height: paddding19,
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
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
                                                                                        int currentValue = int.parse(incrementKMEnd);
                                                                                        setState(() {
                                                                                          currentValue = currentValue + 10000;

                                                                                          incrementKMEnd = (currentValue < 150000 ? currentValue : 150000).toString();

                                                                                          _currentRangeValuesKM.end = (currentValue < 150000 ? currentValue : 150000).toDouble();
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
                                                                                      double currentValue = double.parse(incrementKMEnd);
                                                                                      setState(() {
                                                                                        currentValue = currentValue - 10000;

                                                                                        incrementKMEnd = (currentValue >= _currentRangeValuesKM.start ? currentValue : incrementKMEnd).toString(); // decrementing value
                                                                                        incrementKMEnd = (incrementKMEnd == (0).toString() ? incrementKMEnd = "10000" : incrementKMEnd).toString();
                                                                                        _currentRangeValuesKM.end = double.parse(incrementKMEnd);
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Text(incrementKMEnd,
                                                                                  style: TextStyle(
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
                                                              SizedBox(
                                                                  height:
                                                                      paddding28),
                                                              Container(
                                                                  height:
                                                                      paddding27,
                                                                  width: double
                                                                      .infinity,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            spreadRadius:
                                                                                2,
                                                                            blurRadius:
                                                                                3,
                                                                            offset: Offset(6,
                                                                                0),
                                                                            color:
                                                                                Colors.black38)
                                                                      ]),
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 10.0,
                                                                              right: 10),
                                                                          child:
                                                                              MaterialButton(
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                                                            elevation:
                                                                                3,
                                                                            height:
                                                                                paddding20,
                                                                            minWidth:
                                                                                double.infinity,
                                                                            color:
                                                                                Colors.orange,
                                                                            child: Text("${translator.translate("Apply Filter")}",
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontSize: paddding40,
                                                                                )),
                                                                            onPressed:
                                                                                () {
                                                                              _buildFilterList();
                                                                              _handleSearchStart();
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ])),
                                                            ],
                                                          ),
                                                        ));
                                                  }),
                                            );
                                          });
                                        }); /////
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
                if (orientation == Orientation.landscape && !loading)
                  Expanded(
                    child: _buildListView2(2, false, paddding38),
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

  Widget createGridItem(int position, List<MotorsParse> data, int index,
      bool padding, double padding2, double padding3, double stringL) {
    //// 190 ????????????
    ////130 ????????
    // ignore: unused_local_variable
    var color = Colors.white;
    // ignore: unused_local_variable
    var icondata = Icons.add;

    var result = "0";
    if (data[index].acf.price.isNotEmpty) {
      result = NumberFormat.compactCurrency(
        decimalDigits: 2,
        symbol: '',
      ).format(double.parse(data[index].acf.price));
    }

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return BuyItemPage(index: index, section: 1, data: countries , sectionDataNumber:widget.choice );
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
                        for (int i = 0; i < data[index].acf.gallery.length; i++)
                          watermark("${data[index].acf.gallery[i]}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: frostedText(Center(
                          child: Text("$result",
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
                if (widget.choice == 1)
                  motorsService.usedCars(padding3, paddding36, paddding30,
                      substring3, data, index),
                if (widget.choice == 2)
                  motorsService.motorcycle(padding3, paddding36, paddding30,
                      substring3, data, index),
                if (widget.choice == 3)
                  motorsService.autoAccessories(padding3, paddding36,
                      paddding30, substring3, data, index),
                if (widget.choice == 4)
                  motorsService.heavyVehicles(padding3, paddding36, paddding30,
                      substring3, data, index),
                if (widget.choice == 5)
                  motorsService.boat(padding3, paddding36, paddding30,
                      substring3, data, index),
                if (widget.choice == 6)
                  motorsService.carforRent(
                      padding3, paddding36, paddding30, substring3, data, index)
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
            crossAxisCount: number, childAspectRatio: 0.95),
        itemCount: _searchList.length,
        itemBuilder: (BuildContext context, int index) {
          if ((_searchList[index]
              .lang
              .toLowerCase()
              .contains(RegExp(r'[a-z]')))) {
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
                        hintText: translator.translate("Search By Model"),
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
                        hintText: translator.translate("Search By Model"),
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
        translator.translate("${widget.title}"),
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
        translator.translate("${widget.title}"),
        style: TextStyle(color: Colors.white, fontSize: 4.w),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}
