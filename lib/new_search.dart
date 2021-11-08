///////////////////////////هذا السيرش العادي/////////////////////////////////
/*
import 'package:flutter/material.dart';
import 'package:oxydu/services.dart';

import 'Post.dart';

class YourPage extends StatefulWidget {
  @override
  State createState() => YourPageState();
}

class YourPageState extends State<YourPage> {
  final servic = Services();
  List<Post> countries;
  RangeValues _currentRangeValuesPrice =   RangeValues(10, 500);
  RangeValues _currentRangeValuesPriceTest =   RangeValues(10, 500);
  RangeValues _currentRangeValuesKM =   RangeValues(10, 500);
  RangeValues _currentRangeValuesYear =   RangeValues(10, 2000);
  int maxx, minn;
  RangeValues values;
  TextEditingController controller = new TextEditingController();
  String filter = "";
  List<Post> posts;
  bool loading;
  bool flag = false;
  int count1 = 0, count2 = 0;
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation; // Option 2

  @override
  void initState() {
    super.initState();
    //fill countries with objects
    loading = true;
    Services.getPosts().then((list) {
      setState(() {
        countries = list;
        loading = false;
      });
    }).catchError((err) {
      print("Error");
    });

    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  onPressed() {
    setState(() {
      flag = true;
      _currentRangeValuesPrice = _currentRangeValuesPriceTest;
      _buildListView();
    });

    /*  _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;*/
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
    /* 
    FloatingActionButton(
        onPressed: function,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: Colors.blue,
       /* child: Icon(
          icon,
          size: 36.0,
        )*/);*/
  }

  @override
  Widget build(BuildContext context) {
    print("i am filter$filter");

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 300,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: TextFormField(
            /* onTap: () {
              controller.clear();
              FocusScope.of(context).requestFocus(new FocusNode());
            },*/
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: new IconButton(
                icon: new Icon(Icons.close),
                onPressed: () {
                  controller.clear();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
              //  contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            ),
          ),
        ),
      ),
      body: new Material(
          color: Colors.transparent,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
/*
              new Padding(
                  padding:
                      new EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                  child: new TextField(
                    style: new TextStyle(fontSize: 18.0, color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: new Icon(Icons.search),
                      suffixIcon: new IconButton(
                        icon: new Icon(Icons.close),
                        onPressed: () {
                          controller.clear();
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      ),
                      hintText: "Search...",
                    ),
                    controller: controller,
                  )),*/

              DropdownButton(
                hint: Text(
                    'Please choose a location'), // Not necessary for Option 1
                value: _selectedLocation,
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue;
                  });
                },
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),
              button(onPressed),
              Text("By price"),
              RangeSlider(
                values: _currentRangeValuesPriceTest,
                min: 0,
                max: 500,
                divisions: 50,
                labels: RangeLabels(
                  _currentRangeValuesPriceTest.start.round().toString(),
                  _currentRangeValuesPriceTest.end.round().toString(),
                ),
                onChanged: (values) {
                  setState(() {
                    _currentRangeValuesPriceTest = values;
                  });
                },
              ),
              Text("by Year"),
              RangeSlider(
                values: _currentRangeValuesYear,
                min: 0,
                max: 2000.0,
                divisions: 50,
                labels: RangeLabels(
                  _currentRangeValuesYear.start.round().toString(),
                  _currentRangeValuesYear.end.round().toString(),
                ),
                onChanged: (RangeValues values1) {
                  setState(() {
                    _currentRangeValuesYear = values1;
                  });
                },
              ),
              Text("by km"),
              RangeSlider(
                values: _currentRangeValuesKM,
                min: 0,
                max: 500,
                divisions: 50,
                labels: RangeLabels(
                  _currentRangeValuesKM.start.round().toString(),
                  _currentRangeValuesKM.end.round().toString(),
                ),
                onChanged: (RangeValues values1) {
                  setState(() {
                    _currentRangeValuesKM = values1;
                  });
                },
              ),
              new Expanded(
                child: new Padding(
                    padding: new EdgeInsets.only(top: 8.0),
                    child: _buildListView()),
              )
            ],
          )),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index) {
          print(flag);
          if (_selectedLocation == "A") {
            if (filter.isEmpty &&
                (countries[index].age > _currentRangeValuesPrice.start) &&
                (countries[index].year > _currentRangeValuesYear.start) &&
                (countries[index].km > _currentRangeValuesKM.start) &&
                (flag)) {
              print("con1");
              return _buildRow(countries[index]);
            }

            if (countries[index]
                    .name
                    .toLowerCase()
                    .contains(filter.toLowerCase()) &&
                (countries[index].age > _currentRangeValuesPrice.start) &&
                (countries[index].year > _currentRangeValuesYear.start) &&
                (countries[index].km > _currentRangeValuesKM.start) &&
                (filter.isNotEmpty)) {
              print("con3");
              return _buildRow(countries[index]);
            } else {
              return new Container();
            }
            /* else {
            return new Container();*/
          }
          //  }
        });
  }

  Widget _buildRow(Post c) {
    return new ListTile(
        title: new Text(
          c.name,
        ),
        subtitle: new Text(
            "id${c.id.toString()}  and Km${c.km}  and year ${c.year} and price ${c.age}"));
  }
}
*/