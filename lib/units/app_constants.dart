import 'dart:ui';

import 'package:flutter/painting.dart';

abstract class AppColors {
  static const Color accentColor = Color(0xff02D3B4);
  static const Color darkAccentColor = Color(0xff02B694);

  static const Color headline3 = Color(0xff86ABB2);
  static const Color headline2 = Color(0xff86ABB2);
  static const Color subtitle2TextColor = Color(0xff808080);
  static const Color textColor = Color(0xff4C4C4C);

  static const Color borderDisabledColor = Color(0xff86ABB2);
  static const Color disableTextInputFieldColor = Color(0xff4C4C4C);

  static const Color subtitle1TextColor = Color(0xff828282);

  static const Color disabledInputFieldColor = Color(0xffDFEDEF);
  static const Color enabledInputFieldColor = Color(0xffFFFFFF);
}

abstract class AppDims {
  static const double p1 = 4;
  static const double p2 = 8;
  static const double p3 = 16;
  static const double p4 = 24;
  static const double p5 = 32;

  static const double d1 = 5;
  static const double d2 = 10;
  static const double d3 = 15;
  static const double d4 = 25;
  static const double d5 = 50;

  static const double roundLeadRowIconSize = 28;
}

abstract class AppBorders {
  static const inputs = BorderRadius.all(Radius.circular(5));
  static const changeLocation = BorderRadius.all(Radius.circular(25));
}
