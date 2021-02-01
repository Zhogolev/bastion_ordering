import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainAppBar extends AppBar {
  MainAppBar(
      {@required VoidCallback onPressed,
      @required VoidCallback onLeadingPressed,
      @required String leadingText})
      : super(
            elevation: 1,
            backgroundColor: Colors.white,
            leading: MaterialButton(
              onPressed: onLeadingPressed ?? () {},
              child: SvgPicture.asset('assets/common/back_arrow_black.svg'),
            ),
            title: GestureDetector(
              onTap:  () => onPressed(),
              child: Text(
                leadingText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            titleSpacing: 0,
            centerTitle: false);
}
