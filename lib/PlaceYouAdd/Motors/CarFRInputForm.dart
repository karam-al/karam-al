import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'notes_service.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CFRInputform extends StatefulWidget {
  final dynamic forRentType, price;
  final dynamic title, description, pricePer;
  CFRInputform({
    @required this.forRentType,
    @required this.pricePer,
    @required this.price,
    @required this.title,
    @required this.description,
  });
  @override
  _CFRInputformState createState() => _CFRInputformState();
}

class _CFRInputformState extends State<CFRInputform>
    with AutomaticKeepAliveClientMixin {
  NotesServicee get notesService => GetIt.I<NotesServicee>();
  double padding = 0, padding2 = 0, padding3 = 0, leadingSize = 0;
  dynamic location, carType;
  dynamic phoneNumber, discount, carForRent;
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
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
            labelStyle: TextStyle(fontSize: 5.w),
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
          if (choice == 1 || choice == 2) {
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
            carType = value;
          }
          if (choice == 4) {
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
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      print(SizerUtil.height);
      padding3 = 20.h;
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
          translator.translate("Add Car For Rent"),
          style: TextStyle(color: Colors.black, fontSize: 5.5.w),
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: Container(
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
                    _buildName(
                        context, 42.w, translator.translate("Discount"), 2, 1),
                  ],
                ),
                SizedBox(
                  height: 5.w,
                ),
                _buildName(context, double.infinity,
                    translator.translate("CarType2"), 3, 2),
                SizedBox(
                  height: 5.w,
                ),
                _buildName(context, double.infinity,
                    translator.translate("Location"), 4, 2),
                /*SizedBox(
                  height: 25.h,
                ),*/
                Spacer(),
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
                          style: TextStyle(color: Colors.white, fontSize: 4.w),
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
                          if (!_formKey.currentState.validate()) return;

                          _formKey.currentState.save();
                          if (translator.currentLanguage == 'ar') {
                            carForRent = 6457;
                          }
                          if (translator.currentLanguage == 'en') {
                            carForRent = 6455;
                          }
                          await notesService.carsForRent(
                              widget.title,
                              widget.forRentType,
                              widget.pricePer,
                              widget.price,
                              widget.description,
                              phoneNumber,
                              discount,
                              carType,
                              location,
                              carForRent,context);
                        },
                        child: Text(
                          translator.translate("Submit"),
                          style: TextStyle(color: Colors.white, fontSize: 4.w),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
