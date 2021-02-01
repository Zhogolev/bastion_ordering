import 'package:flutter/material.dart';

import '../../units/app_constants.dart';

typedef FunctionStringCallback = void Function(String string);

class OrderTextField extends StatelessWidget {
  final String hintText;
  final bool enabled;
  final EdgeInsets padding;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final FunctionStringCallback onTextChanged;

  const OrderTextField(
      {Key key,
      this.hintText = '',
      this.enabled = true,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.padding = const EdgeInsets.symmetric(vertical: AppDims.p2),
      this.onTextChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('OrderTextField rebuild');
    final theme = Theme.of(context);
    Widget child = TextField(
      onChanged: onTextChanged,

      ///todo можно добавить input formatter
      style: theme.textTheme.headline3.copyWith(
          color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),
      controller: controller,
      keyboardType: keyboardType,
      enabled: enabled,
      autocorrect: false,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: AppDims.p2, horizontal: AppDims.p3),
          hintText: hintText,
          hintStyle:
              theme.textTheme.headline3.copyWith(fontWeight: FontWeight.normal),
          border: InputBorder.none),
    );

    child = Container(
      decoration: BoxDecoration(
          color: enabled
              ? AppColors.enabledInputFieldColor
              : AppColors.disabledInputFieldColor,
          borderRadius: AppBorders.inputs,
          border: Border.all(
            color: enabled ? theme.primaryColor : AppColors.borderDisabledColor,
            width: enabled ? 2 : 1,
          )),
      child: child,
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
