import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class MyFavorites extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavoritesScreenState();
  }
}

class FavoritesScreenState extends State<MyFavorites>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  double paddding12, paddding11;
  Widget build(BuildContext context) {
    if (SizerUtil.deviceType == DeviceType.tablet) {
      paddding12 = 8.w;
      paddding11 = 25.w;
    }
    if (SizerUtil.deviceType == DeviceType.mobile) paddding11 = 25.w;
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GridView.count(
          // physics: new NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(20, (index) {
            return Container(
              child: createGridItem(
                  6, "Product Name 5", "Product Description", "1200000"),
            );
          }),
        ),
      ),
    );
  }

  Widget createGridItem(
      int position, String title, String description, String price) {
    var color = Colors.white;
    var result = "0";
    if (price.isNotEmpty) {
      result = NumberFormat.compactCurrency(
        decimalDigits: 2,
        symbol: '',
      ).format(double.parse(price));
    }

    switch (position) {
      case 0:
        color = Colors.grey;

        break;
      case 1:
        color = Colors.grey;

        break;
      case 2:
        color = Colors.grey;

        break;
      case 3:
        color = Colors.grey;

        break;
      case 4:
        color = Colors.grey;

        break;
      case 5:
        color = Colors.grey;

        break;
      case 6:
        color = Colors.white;

        break;
      case 7:
        color = Colors.orange;

        break;
    }

    return Builder(builder: (context) {
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

      return Card(
        elevation: 6,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Stack(children: [
                SizedBox(
                    height: 120,
                    child: ClipRRect(
                      child: Image.network(
                        'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )),
                //  Padding(
                //  padding: const EdgeInsets.fromLTRB(0, 5, 220, 20),
                //child:
                Container(
                    child: frostedText(Center(
                  child: Text("$result",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 4.5.w,
                        fontWeight: FontWeight.bold,
                      )),
                ))),
                //),
              ]),
              SizedBox(height: 2.w),
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 4.w),
                ),
              ),
              Flexible(
                child: new Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 3.5.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
