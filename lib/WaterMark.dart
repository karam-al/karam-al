import 'dart:ui';
import 'package:sizer/sizer.dart';

import 'package:flutter/material.dart';

 watermark(String img ) { 
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Image.network(img, fit: BoxFit.fill),
      Align(
          alignment: Alignment.center,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                width: double.maxFinite,
                height: 25.w,
                child: Opacity(
                    opacity: 0.4, child: Image.asset('asset/oxyduu.png')),
                /*Image.asset(
                    'asset/oxyduu.png',
                 //   color: const Color.fromRGBO(255, 255, 255, 0.4),
                  )*/
              )))
    ],
  );
}
