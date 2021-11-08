import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;
//TextEditingController controller = TextEditingController();

class Icrement extends StatefulWidget {
  @override
  _IcrementState createState() => _IcrementState();
}

class _IcrementState extends State<Icrement> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget icrement1(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          width: 150.0,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Colors.blueGrey,
              width: 2.0,
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  controller: controller,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    // ignore: deprecated_member_use
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Container(
                width: 30,
                height: 38.0,
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
                          size: 18.0,
                        ),
                        onTap: () {
                          int currentValue = int.parse(controller.text);
                          setState(() {
                            currentValue = currentValue + 10000;
                            controller.text =
                                (currentValue).toString(); // incrementing value
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
                        int currentValue = int.parse(controller.text);
                        setState(() {
                          print("Setting state");
                          currentValue--;
                          controller.text =
                              (currentValue > 0 ? currentValue : 0)
                                  .toString(); // decrementing value
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RangeSliderData {
  double min;
  double max;
  double lowerValue;
  double upperValue;
  int divisions;
  bool showValueIndicator;
  int valueIndicatorMaxDecimals;
  bool forceValueIndicator;
  Color overlayColor;
  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color valueIndicatorColor;
  Color activeTickMarkColor;

  static const Color defaultActiveTrackColor = const Color(0xFF0175c2);
  static const Color defaultInactiveTrackColor = const Color(0x3d0175c2);
  static const Color defaultActiveTickMarkColor = const Color(0x8a0175c2);
  static const Color defaultThumbColor = const Color(0xFF0175c2);
  static const Color defaultValueIndicatorColor = const Color(0xFF0175c2);
  static const Color defaultOverlayColor = const Color(0x290175c2);

  RangeSliderData({
    this.min,
    this.max,
    this.lowerValue,
    this.upperValue,
    this.divisions,
    this.showValueIndicator: true,
    this.valueIndicatorMaxDecimals: 1,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
  });

  // Returns the values in text format, with the number
  // of decimals, limited to the valueIndicatedMaxDecimals
  //
  String get lowerValueText =>
      lowerValue.toStringAsFixed(valueIndicatorMaxDecimals);
  String get upperValueText =>
      upperValue.toStringAsFixed(valueIndicatorMaxDecimals);

  // Builds a RangeSlider and customizes the theme
  // based on parameters
  //
  Widget build(BuildContext context, frs.RangeSliderCallback callback) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          /* Container(
            constraints: BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: Text(lowerValueText),
          ),*/
          Expanded(
            child: SliderTheme(
              // Customization of the SliderTheme
              // based on individual definitions
              // (see rangeSliders in _RangeSliderSampleState)
              data: SliderTheme.of(context).copyWith(
                overlayColor: overlayColor,
                activeTickMarkColor: activeTickMarkColor,
                activeTrackColor: activeTrackColor,
                inactiveTrackColor: inactiveTrackColor,
                //trackHeight: 8.0,
                thumbColor: thumbColor,
                valueIndicatorColor: valueIndicatorColor,
                /*    showValueIndicator: showValueIndicator
                    ? ShowValueIndicator.always
                    : ShowValueIndicator.onlyForDiscrete,*/
              ),
              child: frs.RangeSlider(
                min: min,
                max: max,
                lowerValue: lowerValue,
                upperValue: upperValue,
                divisions: divisions,
                showValueIndicator: showValueIndicator,
                valueIndicatorMaxDecimals: valueIndicatorMaxDecimals,
                onChanged: (double lower, double upper) {
                  // call
                  callback(lower, upper);
                },
              ),
            ),
          ),
          /* Container(
            constraints: BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: Text(upperValueText),
          ),*/
        ],
      ),
    );
  }
}
