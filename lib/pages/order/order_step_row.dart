import 'package:flutter/material.dart';

import '../../units/app_constants.dart';

class StepRow extends StatelessWidget {
  final String number;
  final String title;
  final Color leadColor;
  final Color leadTextColor;
  final EdgeInsets padding;

  const StepRow(
      {this.number = '1',
      this.title = '',
      this.leadColor,
      this.leadTextColor,
      this.padding});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color _leadColor = leadColor ?? theme.primaryColor;
    TextTheme textTheme = theme.textTheme;

    Widget child = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: AppDims.roundLeadRowIconSize,
          width: AppDims.roundLeadRowIconSize,
          decoration: BoxDecoration(color: _leadColor, shape: BoxShape.circle),
          child: Center(
              child: Text(
            number,
            style: textTheme.headline3.copyWith(
                color: leadTextColor ?? Colors.white,
                fontWeight: FontWeight.normal),
          )),
        ),
        Container(
          padding: EdgeInsets.only(left: AppDims.p3),
          child: Text(
            title,
            style: textTheme.headline3.copyWith(color: leadTextColor),
          ),
        )
      ],
    );

    if (padding != null) {
      return Padding(
        padding: padding,
        child: child,
      );
    }
    return child;
  }
}
