import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../units/app_constants.dart';
import '../../../notifiers/order_owner_notifier.dart';
import '../../../order_text_field.dart';

const SizedBox spacer10 = SizedBox(height: 10);
const SizedBox spacer5 = SizedBox(height: 5);

class OwnerUnconfirmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    double size = 50;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      spacer10,
      Text(
        'Введите ваш номер телефона',
        style: theme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.w500),
      ),
      spacer5,
      if (context.select<OrderOwnerNotifier, bool>((data) => !data.isUpdating))
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: OrderTextField(
                  onTextChanged:
                      context.read<OrderOwnerNotifier>().setUserPhoneNumber,
                  hintText: 'Телефон получателя',
                  keyboardType: TextInputType.number),
            ),
            Container(
              margin: EdgeInsets.only(left: AppDims.d3),
              width: size,
              height: size,
              child: MaterialButton(
                shape: CircleBorder(
                    side: BorderSide(width: 2, color: theme.accentColor)),
                onPressed: () {
                  context.read<OrderOwnerNotifier>().runUserConfirmation();
                },
                child: Center(
                  child: SvgPicture.asset(
                    'assets/common/ok_sign_black.svg',
                    fit: BoxFit.fill,
                    color: theme.primaryColor,
                  ),
                ),
              ),
            )
          ],
        )
      else

        /// todo implement normal updating
        Row(
          children: [
            Text('Updating....'),
          ],
        ),
      spacer5,
      Text(
        'Мы отправим вам код подтверждения',
        style: theme.textTheme.subtitle1.copyWith(color: AppColors.textColor),
      ),
      spacer5,
      RichText(
          text: TextSpan(
              text: 'или авторизуйтесь ',
              style: theme.textTheme.headline4,
              children: [
            TextSpan(
                text: 'по паролю',
                style: theme.textTheme.headline4.copyWith(
                  color: AppColors.accentColor,
                  decoration: TextDecoration.underline,
                ),

                ///todo implement
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Stub'))))
          ]))
    ]);
  }
}
