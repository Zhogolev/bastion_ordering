import 'package:flutter/material.dart';

import '../../../../units/app_constants.dart';
import '../../order_type_card.dart';

class DeliveryOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    String selectedRadio = '';
    return Column(
      children: [
        OrderTypeCard(
          address:
              'г. Омск, ул. 75-ой Гваредйской бригады, 18 «Б», 37, 3 подъезд, 1 этаж',
          title: 'Почтоматы 24/7 и пункты выдачи',
          subtitle: 'Доставка до более, чем 1500 пунктов выдача от 357₽',
        ),
        OrderTypeCard(
          address:
              'г. Омск, ул. 75-ой Гваредйской бригады, 18 «Б», 37, 3 подъезд, 1 этаж',
          title: 'Почтоматы 24/7 и пункты выдачи',
          subtitle: 'Доставка до более, чем 1500 пунктов выдача от 357₽',
        ),
        OrderTypeCard(
          address:
              'г. Омск, ул. 75-ой Гваредйской бригады, 18 «Б», 37, 3 подъезд, 1 этаж',
          title: 'Почтоматы 24/7 и пункты выдачи',
          subtitle: 'Доставка до более, чем 1500 пунктов выдача от 357₽',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDims.d3,
          ),
          child: Text(
            'Служба и время доставки',
            style: theme.textTheme.headline5,
          ),
        ),

        /// todo here
        StatefulBuilder(builder: (context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              {'a': 'Курьерская доставка', 'b': 'Доставка до двери от 150 ₽'},
              {'a': 'Курьерская доставка', 'b': 'Доставка до двери от 350 ₽'},
              {'a': 'Курьерская доставка', 'b': 'Доставка до двери от 250 ₽'}
            ].map((element) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<dynamic>(
                    value: element['b'],
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() => selectedRadio = value);
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${element['a']}',
                          style: theme.textTheme.headline2
                              .copyWith(fontWeight: FontWeight.w500)),
                      Text('${element['b']}', style: theme.textTheme.subtitle2),
                    ],
                  )
                ],
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
