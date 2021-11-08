import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ProfilePic extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.w,
      width: 30.w,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("asset/google.jpg"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 13.w,
              width: 13.w,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.asset("asset/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
