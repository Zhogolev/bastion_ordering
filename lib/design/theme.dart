import 'package:flutter/material.dart';

import '../units/app_constants.dart';

ThemeData mainTheme = ThemeData(
    fontFamily: 'Montserrat',
    primaryColor: AppColors.accentColor,
    accentColor: AppColors.accentColor,
    canvasColor: Colors.white,
    unselectedWidgetColor: AppColors.accentColor,
    primaryColorDark: AppColors.darkAccentColor,
    focusColor: AppColors.darkAccentColor,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    textTheme: const TextTheme(
        headline3: TextStyle(
            color: AppColors.headline3,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        headline1: TextStyle(
            color: AppColors.headline2,
            fontSize: 16,
            fontWeight: FontWeight.normal),
        headline4: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        headline2: TextStyle(
            color: Colors.black, fontSize: 16.5, fontWeight: FontWeight.normal),
        headline5: TextStyle(
            color: AppColors.headline2,
            fontSize: 14,
            fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            color: AppColors.subtitle1TextColor,
            fontSize: 12,
            fontWeight: FontWeight.w500),
        subtitle2: TextStyle(
            color: AppColors.subtitle2TextColor,
            fontSize: 12,
            fontWeight: FontWeight.normal)));
