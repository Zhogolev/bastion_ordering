import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifiers/order_owner_notifier.dart';
import '../../../order_check_box_container.dart';
import '../../../order_page.dart';
import '../../../order_text_field.dart';

class ConfirmedOwner extends StatelessWidget {
  final String _name;
  final String _phone;
  final String _email;

  const ConfirmedOwner({Key key, String name, String phone, String email})
      : _name = name ?? '',
        _phone = phone ?? '',
        _email = email ?? '',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        OrderTextField(
            controller: TextEditingController()..text = _phone,
            enabled: false,
            padding: blockPadding,
            hintText: 'Телефон получателя',
            keyboardType: TextInputType.number),
        OrderTextField(
          controller: TextEditingController()..text = _name,
          enabled: false,
          padding: padding,
          hintText: 'Имя получателя',
        ),
        OrderTextField(
            controller: TextEditingController()..text = _email,
            enabled: false,
            padding: padding,
            hintText: 'E-mail',
            keyboardType: TextInputType.emailAddress),
        Padding(
          padding: blockPadding,
          child: Text(
            'Если вы хотите изменить телефон,  то свяжитесь с нами по горячей линии  8 800 200-78-80 и мы постараемся вам помочь.',
            style: textTheme.subtitle2,
          ),
        ),
        OrderCheckboxContainer(),
        if (context
            .select<OrderOwnerNotifier, bool>((e) => e.isOtherConsumer)) ...[
          OrderTextField(
            padding: padding,
            hintText: 'Имя получателя',
          ),
          OrderTextField(
              padding: padding,
              hintText: 'Телефон получателя',
              keyboardType: TextInputType.number),
        ]
      ],
    );
  }
}
