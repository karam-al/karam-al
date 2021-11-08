import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'notes_service.dart';

class HeavyVehiclesInputForm extends StatefulWidget {
  @override
  _HeavyVehiclesInputFormState createState() => _HeavyVehiclesInputFormState();
}

class _HeavyVehiclesInputFormState extends State<HeavyVehiclesInputForm> {
  final myController = TextEditingController();
  dynamic _index = 10, _index2;
  dynamic newValuee;
  dynamic _selectedLocationcartype3,
      _selectedLocationTrucks,
      _selectedLocationBuses,
      _selectedLocationForklift,
      _selectedLocationTrailer,
      _selectedLocationCranes,
      _selectedLocationTankers,
      _selectedLocationPartsEngines,
      _selectedLocationother;
  /////////////////////////////////////

  double padding = 0, padding2 = 0, leadingSize = 0;
  dynamic price, heavyVehiclesAPI, heavyVehiclesAPIChild;
  dynamic title, description;
  File imageFile, imageFile2;
  final picker = ImagePicker();
  List<dynamic> heavyVehicles,
      bodyCondition,
      mechanicalCondition,
      sellerType,
      capacityWeight,
      noOfCylinders,
      horsePower,
      otherHeavyVehicles,
      warranty,
      trucks,
      buses,
      partsEngines,
      forkLifts,
      trailes,
      cranes,
      tankers,
      fuelType; // Option 2

  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  chooseImage(ImageSource source, dynamic x) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (x == 1) imageFile = File(pickedFile.path);
      if (x == 2) imageFile2 = File(pickedFile.path);
    });
  }

  /* bool _phoneNumberValidator(dynamic value) {
    Pattern pattern = r'\d';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return true;
    else
      return false;
  }*/

  Widget _buildDropDown(dynamic text, List<dynamic> list, dynamic choice,
      dynamic _selectedLocation2) {
    return DropdownButtonFormField(
      validator: (value) =>
          value == null ? translator.translate('Required') : null,
      isExpanded: true,
      decoration: InputDecoration(
          fillColor: Colors.grey,
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
          labelStyle: TextStyle(fontSize: 4.w),
          contentPadding: EdgeInsets.fromLTRB(15, padding, 15, 0),
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
          )),
      selectedItemBuilder: (BuildContext context) {
        return list.map<Widget>((dynamic text) {
          return Text(
            text,
            overflow: TextOverflow.ellipsis,
          );
        }).toList();
      },
      items: list.map<DropdownMenuItem<dynamic>>((dynamic text) {
        return DropdownMenuItem<dynamic>(
          value: text,
          child: Column(
            children: [
              Text(text, maxLines: 3, overflow: TextOverflow.ellipsis),
              Divider(),
              SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
      hint: Text(text),
      value: _selectedLocation2,
      onChanged: (dynamic newValue) {
        setState(() {
          _index2 = list.indexOf(newValue);
          if (translator.currentLanguage == 'en') {
            if (choice == 0) {
              if (_index == 0) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 6310;
                }
                if (_index2 == 1) heavyVehiclesAPIChild = 7713;
                if (_index2 == 2) heavyVehiclesAPIChild = 1631;
                if (_index2 == 3) heavyVehiclesAPIChild = 7727;
                if (_index2 == 4) heavyVehiclesAPIChild = 7735;
                if (_index2 == 5) heavyVehiclesAPIChild = 7743;
                if (_index2 == 6) heavyVehiclesAPIChild = 6332;
                if (_index2 == 7) heavyVehiclesAPIChild = 6338;
                if (_index2 == 8) heavyVehiclesAPIChild = 1633;
                if (_index2 == 9) heavyVehiclesAPIChild = 6342;
                if (_index2 == 10) heavyVehiclesAPIChild = 7749;
                if (_index2 == 11) heavyVehiclesAPIChild = 7757;
                if (_index2 == 13) heavyVehiclesAPIChild = 7761;
              }
              _selectedLocationTrucks = newValue;
            }
            if (choice == 1) {
              if (_index == 1) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 1657;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 1659;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 1661;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 1663;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 1665;
                }
              }
              _selectedLocationBuses = newValue;
            }
            if (choice == 2) {
              if (_index == 2) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 6352;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 1692;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 6366;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 1696;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 7777;
                }
              }
              _selectedLocationForklift = newValue;
            }
            if (choice == 3) {
              if (_index == 3) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 7791;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 6374;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 1639;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 7797;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 7801;
                }
                if (_index2 == 5) {
                  heavyVehiclesAPIChild = 7805;
                }
                if (_index2 == 6) {
                  heavyVehiclesAPIChild = 1641;
                }
                if (_index2 == 7) {
                  heavyVehiclesAPIChild = 6390;
                }
                if (_index2 == 8) {
                  heavyVehiclesAPIChild = 6398;
                }
                if (_index2 == 9) {
                  heavyVehiclesAPIChild = 6402;
                }
                if (_index2 == 11) {
                  heavyVehiclesAPIChild = 1643;
                }
              }
              _selectedLocationTrailer = newValue;
            }
            if (choice == 4) {
              if (_index == 4) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 1677;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 7825;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 6406;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 1679;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 1681;
                }
              }
              _selectedLocationCranes = newValue;
            }
            if (choice == 5) {
              if (_index == 5) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 7845;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 1649;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 7863;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 1651;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 7857;
                }
              }
              _selectedLocationTankers = newValue;
            }
            if (choice == 6) {
              if (_index == 6) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 7873;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 7879;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 7895;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 7899;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 7905;
                }
                if (_index2 == 5) {
                  heavyVehiclesAPIChild = 7913;
                }
                if (_index2 == 6) {
                  heavyVehiclesAPIChild = 6434;
                }
              }
              _selectedLocationPartsEngines = newValue;
            }

            if (choice == 7) {
              if (_index2 == 0) {
                heavyVehiclesAPIChild = 6410;
              }
              if (_index2 == 1) {
                heavyVehiclesAPIChild = 1702;
              }
              if (_index2 == 2) {
                heavyVehiclesAPIChild = 1704;
              }
              if (_index2 == 3) {
                heavyVehiclesAPIChild = 1706;
              }
              if (_index2 == 4) {
                heavyVehiclesAPIChild = 1708;
              }
              if (_index2 == 5) {
                heavyVehiclesAPIChild = 7919;
              }
              _selectedLocationother = newValue;
            }
          }
          if (translator.currentLanguage == 'ar') {
            if (choice == 0) {
              if (_index == 0) {
                if (_index2 == 0) heavyVehiclesAPIChild = 6330;
                if (_index2 == 1) heavyVehiclesAPIChild = 7719;
                if (_index2 == 2) heavyVehiclesAPIChild = 1637;
                if (_index2 == 3) heavyVehiclesAPIChild = 7731;
                if (_index2 == 4) heavyVehiclesAPIChild = 7737;
                if (_index2 == 5) heavyVehiclesAPIChild = 7747;
                if (_index2 == 6) heavyVehiclesAPIChild = 6334;
                if (_index2 == 7) heavyVehiclesAPIChild = 6340;
                if (_index2 == 8) heavyVehiclesAPIChild = 1635;
                if (_index2 == 9) heavyVehiclesAPIChild = 6344;
                if (_index2 == 10) heavyVehiclesAPIChild = 7753;
                if (_index2 == 11) heavyVehiclesAPIChild = 7759;
                if (_index2 == 13) heavyVehiclesAPIChild = 7763;
              }
              _selectedLocationTrucks = newValue;
            }
            if (choice == 1) {
              if (_index == 1) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 1669;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 1671;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 1673;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 1675;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 1667;
                }
              }
              _selectedLocationBuses = newValue;
            }
            if (choice == 2) {
              if (_index == 2) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 6372;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 1694;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 6368;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 1698;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 7779;
                }
              }
              _selectedLocationForklift = newValue;
            }
            if (choice == 3) {
              if (_index == 3) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 7795;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 6384;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 1645;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 7799;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 7803;
                }
                if (_index2 == 5) {
                  heavyVehiclesAPIChild = 7807;
                }
                if (_index2 == 6) {
                  heavyVehiclesAPIChild = 1647;
                }
                if (_index2 == 7) {
                  heavyVehiclesAPIChild = 6396;
                }
                if (_index2 == 8) {
                  heavyVehiclesAPIChild = 6400;
                }
                if (_index2 == 9) {
                  heavyVehiclesAPIChild = 6404;
                }
                if (_index2 == 11) {
                  heavyVehiclesAPIChild = 1688;
                }
              }
              _selectedLocationTrailer = newValue;
            }
            if (choice == 4) {
              if (_index == 4) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 1685;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 7829;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 6408;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 1683;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 1690;
                }
              }
              _selectedLocationCranes = newValue;
            }
            if (choice == 5) {
              if (_index == 5) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 7855;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 1653;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 7865;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 1655;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 7861;
                }
              }
              _selectedLocationTankers = newValue;
            }
            if (choice == 6) {
              if (_index == 6) {
                if (_index2 == 0) {
                  heavyVehiclesAPIChild = 7875;
                }
                if (_index2 == 1) {
                  heavyVehiclesAPIChild = 7881;
                }
                if (_index2 == 2) {
                  heavyVehiclesAPIChild = 7897;
                }
                if (_index2 == 3) {
                  heavyVehiclesAPIChild = 7903;
                }
                if (_index2 == 4) {
                  heavyVehiclesAPIChild = 9157;
                }
                if (_index2 == 5) {
                  heavyVehiclesAPIChild = 7915;
                }
                if (_index2 == 6) {
                  heavyVehiclesAPIChild = 6436;
                }
              }
              _selectedLocationPartsEngines = newValue;
            }

            if (choice == 7) {
              if (_index2 == 0) {
                heavyVehiclesAPIChild = 6412;
              }
              if (_index2 == 1) {
                heavyVehiclesAPIChild = 1712;
              }
              if (_index2 == 2) {
                heavyVehiclesAPIChild = 1714;
              }
              if (_index2 == 3) {
                heavyVehiclesAPIChild = 1716;
              }
              if (_index2 == 4) {
                heavyVehiclesAPIChild = 1718;
              }
              if (_index2 == 5) {
                heavyVehiclesAPIChild = 7923;
              }
              _selectedLocationother = newValue;
            }
          }
        });
      },
    );
  }

  Widget _buildName(BuildContext context, double x, dynamic text,
      dynamic choice, dynamic choice2) {
    return Container(
      width: x,
      child: TextFormField(
        keyboardType: choice2 == 1 ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15, padding2, 15, 0),
            isDense: true,
            errorStyle: TextStyle(fontSize: 11.0),
            labelText: text,
            labelStyle: TextStyle(fontSize: 4.w),
            enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: new BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.black, width: 1.0))),
        style: new TextStyle(color: Colors.black),
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) return translator.translate('Required');
          if (choice == 2) {
            if (value.isEmpty) return translator.translate('Required');
            if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
                    .hasMatch(value) &&
                !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
                    .hasMatch(value))
              return translator.translate('Please enter numbers');
          }
        },
        onSaved: (value) {
          if (choice == 1) title = value;
          if (choice == 2)
            price = NumberUtility.changeDigit(value, NumStrLanguage.English);
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    trucks = [
      translator.translate("Cab-Chassis"),
      translator.translate("Cherry Picker"),
      translator.translate("Crane Truck"),
      translator.translate("Curtain Sider"),
      translator.translate("Dual Cab"),
      translator.translate("Fire Truck"),
      translator.translate("Prime Mover"),
      translator.translate("Refrigerated Truck"),
      translator.translate("Service Vehicle"),
      translator.translate("Tipper"),
      translator.translate("Tow & Tilt"),
      translator.translate("Wrecking"),
      translator.translate("Other"),
    ];

    buses = [
      translator.translate("City Bus"),
      translator.translate("Coach"),
      translator.translate("Coaster"),
      translator.translate("School Bus"),
      translator.translate("Other"),
    ];

    forkLifts = [
      translator.translate("All Terrain"),
      translator.translate("Diesel"),
      translator.translate("Electric"),
      translator.translate("Side Loader"),
      translator.translate("Other"),
    ];

    trailes = [
      translator.translate("B Double"),
      translator.translate("Curtain Sider"),
      translator.translate("Dog Trailer"),
      translator.translate("Dolly Trailer"),
      translator.translate("Drop Decker"),
      translator.translate("Extendable Trailer"),
      translator.translate("Flat Deck"),
      translator.translate("Low Loader"),
      translator.translate("Refrigerated Trailer"),
      translator.translate("Tipper"),
      translator.translate("Other"),
    ];
    cranes = [
      translator.translate("All Terrain Cranes"),
      translator.translate("Tower Cranes"),
      translator.translate("Tractor Cranes"),
      translator.translate("Truck Loading"),
      translator.translate("Other"),
    ];
    tankers = [
      translator.translate("Fiberglass Tank"),
      translator.translate("Fuel Tank"),
      translator.translate("Stainless Steel Tank"),
      translator.translate("Water Tank"),
      translator.translate("Other"),
    ];

    partsEngines = [
      translator.translate("Bus Parts"),
      translator.translate("Crane Parts"),
      translator.translate("Forklift Parts"),
      translator.translate("Tanker Parts"),
      translator.translate("Trailer Parts"),
      translator.translate("Truck Parts"),
      translator.translate("Other PartsEngines"),
    ];

    otherHeavyVehicles = [
      translator.translate("Agriculture Vehicles"),
      translator.translate("RVs & Motorhomes"),
      translator.translate("Site Dumpers"),
      translator.translate("Sweepers"),
      translator.translate("Tractors"),
      translator.translate("Winches"),
    ];

    heavyVehicles = [
      translator.translate("Trucks"),
      translator.translate("Buses"),
      translator.translate("Forklifts"),
      translator.translate("Trailes"),
      translator.translate("Cranes"),
      translator.translate("Tankers"),
      translator.translate("Parts & Engines"),
      translator.translate("other Heavy Vehicles"),
    ];

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      padding = 6.w;
      padding2 = 7.w;
      if (SizerUtil.deviceType == DeviceType.tablet) {
        padding = 5.w;
        padding2 = 6.w;
      }
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Transform.scale(
              scale: leadingSize,
              child: IconButton(
                icon: Icon(Icons.arrow_back_sharp),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
          title: Text(
            translator.translate("Add Heavy Vehicles"),
            style: TextStyle(color: Colors.black, fontSize: 5.5.w),
          ),
          elevation: 0,
          backgroundColor: Colors.white10,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(5.w),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 5.w,
                    ),
                    _buildName(context, MediaQuery.of(context).size.width,
                        translator.translate("Title"), 1, 2),
                    SizedBox(
                      height: 5.w,
                    ),
                    DropdownButtonFormField(
                      validator: (value) => value == null
                          ? translator.translate('Required')
                          : null,
                      isExpanded: true,
                      hint: Text("${translator.translate("Choose Type")}",
                          style: TextStyle(fontSize: 4.w)),
                      value: _selectedLocationcartype3,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          focusColor: Colors.grey,
                          hoverColor: Colors.grey,
                          contentPadding:
                              EdgeInsets.fromLTRB(15, padding, 15, 0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(5.0),
                            ),
                          )),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocationcartype3 = newValue;
                          _index = heavyVehicles.indexOf(newValue);
                          if (translator.currentLanguage == 'ar') {
                            if (_index == 0) {
                              heavyVehiclesAPI = 1629;
                            }
                            if (_index == 1) {
                              heavyVehiclesAPI = 1619;
                            }
                            if (_index == 2) {
                              heavyVehiclesAPI = 1623;
                            }
                            if (_index == 3) {
                              heavyVehiclesAPI = 1627;
                            }
                            if (_index == 4) {
                              heavyVehiclesAPI = 1621;
                            }
                            if (_index == 5) {
                              heavyVehiclesAPI = 1625;
                            }
                            if (_index == 6) {
                              heavyVehiclesAPI = 6432;
                            }
                            if (_index == 7) {
                              heavyVehiclesAPI = 1617;
                            }
                          }
                          if (translator.currentLanguage == 'en') {
                            if (_index == 0) {
                              heavyVehiclesAPI = 1603;
                            }
                            if (_index == 1) {
                              heavyVehiclesAPI = 1605;
                            }
                            if (_index == 2) {
                              heavyVehiclesAPI = 1607;
                            }
                            if (_index == 3) {
                              heavyVehiclesAPI = 1609;
                            }
                            if (_index == 4) {
                              heavyVehiclesAPI = 1611;
                            }
                            if (_index == 5) {
                              heavyVehiclesAPI = 1613;
                            }
                            if (_index == 6) {
                              heavyVehiclesAPI = 6430;
                            }
                            if (_index == 7) {
                              heavyVehiclesAPI = 1615;
                            }
                          }
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return heavyVehicles.map<Widget>((dynamic text) {
                          return Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList();
                      },
                      items: heavyVehicles
                          .map<DropdownMenuItem<dynamic>>((dynamic text) {
                        return DropdownMenuItem<dynamic>(
                          value: text,
                          child: Column(
                            children: [
                              Text(text,
                                  maxLines: 3, overflow: TextOverflow.ellipsis),
                              Divider(),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    /* _buildDropDown(
                        translator.translate("Select price per"), per, 1),*/
                    if (_index == 0)
                      _buildDropDown(translator.translate("Choose Type"),
                          trucks, 0, _selectedLocationTrucks),
                    if (_index == 1)
                      _buildDropDown(translator.translate("Choose Type"), buses,
                          1, _selectedLocationBuses),
                    if (_index == 2)
                      _buildDropDown(translator.translate("Choose Type"),
                          forkLifts, 2, _selectedLocationForklift),
                    if (_index == 3)
                      _buildDropDown(translator.translate("Choose Type"),
                          trailes, 3, _selectedLocationTrailer),
                    if (_index == 4)
                      _buildDropDown(translator.translate("Choose Type"),
                          cranes, 4, _selectedLocationCranes),
                    if (_index == 5)
                      _buildDropDown(translator.translate("Choose Type"),
                          tankers, 5, _selectedLocationTankers),
                    if (_index == 6)
                      _buildDropDown(translator.translate("Choose Type"),
                          cranes, 6, _selectedLocationother),
                    if (_index == 0 ||
                        _index == 1 ||
                        _index == 2 ||
                        _index == 3 ||
                        _index == 4 ||
                        _index == 5 ||
                        _index == 6)
                      SizedBox(
                        height: 5.w,
                      ),
                    _buildName(context, MediaQuery.of(context).size.width,
                        translator.translate("Price"), 2, 1),
                    SizedBox(
                      height: 5.w,
                    ),
                    TextField(
                      maxLines: 8,
                      controller: myController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 4.w),
                          hintText:
                              translator.translate("Write your description"),
                          fillColor: Colors.grey,
                          focusColor: Colors.grey,
                          hoverColor: Colors.grey,
                          contentPadding:
                              EdgeInsets.fromLTRB(15, padding, 15, 0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(5.0),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Divider(thickness: 1),
                    Text(
                      translator.translate("Image"),
                      style: TextStyle(color: Colors.black, fontSize: 5.w),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    imageFile != null
                        ? Container(
                            height: 50.w,
                            width: 50.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: FileImage(imageFile),
                            )),
                          )
                        : Container(),
                    Row(
                      children: [
                        Container(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.w
                              : 10.w,
                          width: SizerUtil.deviceType == DeviceType.mobile
                              ? 30.w
                              : 25.w,
                          child: OutlinedButton(
                            onPressed: () {
                              chooseImage(ImageSource.camera, 1);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.black,
                                  size: 5.w,
                                ),
                                Text(
                                  translator.translate("Camera"),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 3.5.w),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.w
                              : 10.w,
                          width: SizerUtil.deviceType == DeviceType.mobile
                              ? 30.w
                              : 25.w,
                          child: OutlinedButton(
                            onPressed: () {
                              chooseImage(ImageSource.gallery, 1);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.black,
                                  size: 5.w,
                                ),
                                Text(
                                  translator.translate("Galary"),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 3.5.w),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    /*imageFile2 != null
                        ? Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: FileImage(imageFile2),
                            )),
                          )
                        : Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(color: Colors.grey)),
                    Row(
                      children: [
                        Container(
                          height: 12.w,
                          width: 25.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[300],
                            ),
                            onPressed: () {
                              chooseImage(ImageSource.camera, 2);
                            },
                            child: Text(
                              translator.translate("Camera"),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          height: 12.w,
                          width: 25.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[300],
                            ),
                            onPressed: () {
                              chooseImage(ImageSource.gallery, 2);
                            },
                            child: Text(
                              translator.translate("Galary"),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),*/
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.w
                              : 10.w,
                          width: SizerUtil.deviceType == DeviceType.mobile
                              ? 25.w
                              : 20.w,
                          child: ElevatedButton(
                            child: Text(
                              translator.translate("Next"),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 4.w),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            onPressed: () {
                              if (!_formKey.currentState.validate()) return;

                              _formKey.currentState.save();
                              print(heavyVehiclesAPIChild);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HeavyVehiclesInputForm2(
                                        heavyVehiclesAPI: heavyVehiclesAPI,
                                        heavyVehiclesAPIChild:
                                            heavyVehiclesAPIChild,
                                        price: price,
                                        title: title,
                                        description: myController.text,
                                        selectedLocation: _index);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.w)
                  ]),
            ),
          ),
        ));
  }
}

class HeavyVehiclesInputForm2 extends StatefulWidget {
  final dynamic price,
      heavyVehiclesAPI,
      heavyVehiclesAPIChild,
      selectedLocation;
  final dynamic title, description;
  HeavyVehiclesInputForm2({
    @required this.heavyVehiclesAPI,
    @required this.heavyVehiclesAPIChild,
    @required this.price,
    @required this.title,
    @required this.description,
    @required this.selectedLocation,
  });

  @override
  _HeavyVehiclesInputForm2State createState() =>
      _HeavyVehiclesInputForm2State();
}

class _HeavyVehiclesInputForm2State extends State<HeavyVehiclesInputForm2>
    with AutomaticKeepAliveClientMixin {
  NotesServicee get notesService => GetIt.I<NotesServicee>();
  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic phoneNumber,
      discount,
      capacityWeight,
      price,
      yearofmanufacture,
      kilometers;
  dynamic _selectedLocationBodyCondition,
      _selectedLocationMechanicalCondition,
      _selectedLocationSellerType,
      _selectedLocationNoofCylinders,
      _selectedLocationHorsePower,
      _selectedLocationWarranty,
      _selectedLocationFuelType,
      model,
      make,
      location;

  List<dynamic> type = ["ok"],
      bodyCondition,
      mechanicalCondition,
      sellerType,
      noOfCylinders,
      horsePower,
      warranty,
      trucks,
      buses,
      forkLifts,
      trailes,
      cranes,
      tankers,
      fuelType; // Option 2

  dynamic heavyVehicles;
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  Widget _buildDropDown(dynamic text, List<dynamic> list, dynamic choice,
      dynamic _selectedLocation2) {
    return DropdownButtonFormField(
      validator: (value) =>
          value == null ? translator.translate('Required') : null,
      isExpanded: true,
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 4.5.w),
          fillColor: Colors.grey,
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
          contentPadding: EdgeInsets.fromLTRB(15, padding, 15, 0),
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
          )),
      selectedItemBuilder: (BuildContext context) {
        return list.map<Widget>((dynamic text) {
          return Text(
            text,
            overflow: TextOverflow.ellipsis,
          );
        }).toList();
      },
      items: list.map<DropdownMenuItem<dynamic>>((dynamic location) {
        return DropdownMenuItem<dynamic>(
          value: location,
          child: Column(
            children: [
              Text(location, maxLines: 3, overflow: TextOverflow.ellipsis),
              Divider(),
              SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
      hint: Text(text),
      value: _selectedLocation2,
      onChanged: (dynamic newValue) {
        setState(() {
          if (choice == 0) {
            _selectedLocationBodyCondition = newValue;
          }
          if (choice == 1) {
            _selectedLocationMechanicalCondition = newValue;
          }
          if (choice == 2) {
            _selectedLocationSellerType = newValue;
          }
          if (choice == 4) {
            _selectedLocationNoofCylinders = newValue;
          }
          if (choice == 5) {
            _selectedLocationHorsePower = newValue;
          }
          if (choice == 6) {
            _selectedLocationWarranty = newValue;
          }
          if (choice == 7) {
            _selectedLocationFuelType = newValue;
          }
        });
      },
    );
  }

  Widget _buildName(BuildContext context, double x, dynamic text,
      dynamic choice, dynamic choice2) {
    return Container(
      width: x,
      child: TextFormField(
        keyboardType: choice2 == 1 ? TextInputType.number : TextInputType.text,

        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15, padding2, 15, 0),
            isDense: true,
            errorStyle: TextStyle(fontSize: 11.0),
            labelText: text,
            labelStyle: TextStyle(fontSize: 4.5.w),
            enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: new BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.black, width: 1.0))),
        style: new TextStyle(color: Colors.black),
        // ignore: missing_return
        validator: (dynamic value) {
          if (value.isEmpty) return translator.translate('Required');
          if (choice == 1 ||
              choice == 2 ||
              choice == 5 ||
              choice == 6 ||
              choice == 7) {
            if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
                    .hasMatch(value) &&
                !RegExp(r'^[+-]?([\u0660-\u0669]+([.][\u0660-\u0669]*)?|[.][\u0660-\u0669]+)$')
                    .hasMatch(value))
              return translator.translate('Please enter numbers');
          }
        },
        onSaved: (value) {
          if (choice == 1) {
            phoneNumber = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 2) {
            discount = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 3) {
            model = value;
          }
          if (choice == 4) {
            make = value;
          }
          if (choice == 5) {
            yearofmanufacture = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 6) {
            kilometers = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 7) {
            capacityWeight = NumberUtility.changeDigit(value, NumStrLanguage.English);
          }
          if (choice == 8) {
            location = value;
          }
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    bodyCondition = [
      translator.translate("Perfect inside and Out"),
      translator.translate("No Accidents, very few faults"),
      translator.translate("A bit of wear & tear,all repaired"),
      translator.translate("Normal wear & tear,a few issues"),
      translator.translate("Lots of wear & tear to the body"),
    ];
    mechanicalCondition = [
      translator.translate("Perfect inside and Out2"),
      translator.translate("Minor faults, all fixed"),
      translator.translate("Major faults, all fixed"),
      translator.translate("Major faults fixed, small remain"),
      translator.translate("Ongoing minor & major faults"),
    ];
    sellerType = [
      translator.translate("Owner"),
      translator.translate("Dealer"),
      translator.translate("Dealership-Certified Pre-Owned"),
    ];
    noOfCylinders = [
      "2",
      "4",
      "6",
      "8",
      "10",
      "12",
      translator.translate("unknown")
    ];
    horsePower = [
      translator.translate("Less than 150 HP"),
      translator.translate("150 - 200 HP"),
      translator.translate("200 - 300 HP"),
      translator.translate("300 - 400 HP"),
      translator.translate("400+ HP"),
      translator.translate("unknown2"),
    ];
    warranty = [
      translator.translate("Yes2"),
      translator.translate("No"),
      translator.translate("Does not Apply"),
    ];
    fuelType = [
      translator.translate("Electric2"),
      translator.translate("Hybird"),
      translator.translate("Diesel"),
      translator.translate("Gasoline"),
    ];

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      padding3 = 20.h;
      padding = 6.w;
      padding2 = 7.w;
      if (SizerUtil.height < 600) padding3 = 30.h;
      if (SizerUtil.height < 735 && SizerUtil.height > 650) padding3 = 35.h;
      if (SizerUtil.height < 1290 && SizerUtil.height >= 738) padding3 = 45.h;
      padding2 = 7.w;
      if (SizerUtil.deviceType == DeviceType.tablet) {
        padding = 5.w;
        padding2 = 6.w;
        padding3 = 35.h;
        if (SizerUtil.height > 1600) padding3 = 45.h;
      }
    }
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Transform.scale(
            scale: leadingSize,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        title: Text(
          translator.translate("Add Heavy Vehicles"),
          style: TextStyle(color: Colors.black, fontSize: 5.5.w),
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5.w),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 6.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(context, 42.w,
                          translator.translate("Your phone number"), 1, 1),
                      _buildName(context, 42.w,
                          translator.translate("Discount"), 2, 1),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("BodyCondition"),
                      bodyCondition, 0, _selectedLocationBodyCondition),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(
                      translator.translate("Mechanical Condition"),
                      mechanicalCondition,
                      1,
                      _selectedLocationMechanicalCondition),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Seller Type"),
                      sellerType, 2, _selectedLocationSellerType),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildName(
                          context, 42.w, translator.translate("Model2"), 3, 2),
                      _buildName(
                          context, 42.w, translator.translate("Make"), 4, 2),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("year of manufacture"), 5, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("kilometers"), 6, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Capacity Weight"), 7, 1),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("No of Cylinders"),
                      noOfCylinders, 4, _selectedLocationNoofCylinders),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Horse Power"),
                      horsePower, 5, _selectedLocationHorsePower),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Warranty"), warranty, 6,
                      _selectedLocationWarranty),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildDropDown(translator.translate("Fuel Type"), fuelType, 7,
                      _selectedLocationFuelType),
                  SizedBox(
                    height: 5.w,
                  ),
                  _buildName(context, double.infinity,
                      translator.translate("Location"), 8, 2),
                  SizedBox(
                    height: 15.w,
                  ),
                  /* _buildDropDown(
                    translator.translate("BodyCondition"),
                    heavyVehicles,
                    1,
                  ),*/
                  Row(
                    children: [
                      Container(
                        height: SizerUtil.deviceType == DeviceType.mobile
                            ? 12.w
                            : 10.w,
                        width: SizerUtil.deviceType == DeviceType.mobile
                            ? 25.w
                            : 20.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            translator.translate("Prev"),
                            style:
                                TextStyle(color: Colors.white, fontSize: 4.w),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: SizerUtil.deviceType == DeviceType.mobile
                            ? 12.w
                            : 10.w,
                        width: SizerUtil.deviceType == DeviceType.mobile
                            ? 25.w
                            : 20.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                          ),
                          onPressed: () async {
                            if (translator.currentLanguage == 'ar') {
                              heavyVehicles = 461;
                            }
                            if (translator.currentLanguage == 'en') {
                              heavyVehicles = 455;
                            }
                            if (!_formKey.currentState.validate()) return;

                            _formKey.currentState.save();
                            await notesService.heavyVehicles(
                                heavyVehicles,
                                widget.title,
                                widget.price,
                                widget.description,
                                widget.heavyVehiclesAPI,
                                widget.heavyVehiclesAPIChild,
                                phoneNumber,
                                discount,
                                _selectedLocationBodyCondition,
                                _selectedLocationMechanicalCondition,
                                _selectedLocationSellerType,
                                model,
                                make,
                                capacityWeight,
                                _selectedLocationNoofCylinders,
                                _selectedLocationHorsePower,
                                _selectedLocationWarranty,
                                _selectedLocationFuelType,
                                location,
                                widget.selectedLocation,
                                kilometers,
                                yearofmanufacture,context);
                          },
                          child: Text(
                            translator.translate("Submit"),
                            style:
                                TextStyle(color: Colors.white, fontSize: 4.w),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
