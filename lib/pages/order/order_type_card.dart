import '../../data/entities/city.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../units/app_constants.dart';
import 'address_location/address_location.dart';
import 'notifiers/order_owner_notifier.dart';

const spacer5 = SizedBox(
  height: 3,
);

///todo вынести в локаль
class OrderTypeCard extends StatelessWidget {
  final EdgeInsets padding;
  final String title;
  final String subtitle;
  final String address;

  const OrderTypeCard(
      {Key key,
      this.padding = const EdgeInsets.only(top: AppDims.d2),
      this.title = '',
      this.address = '',

      /// todo
      this.subtitle = 'Не выбран'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget child = Container(
      padding:
          EdgeInsets.symmetric(vertical: AppDims.d3, horizontal: AppDims.d3)
              .copyWith(right: AppDims.d5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.darkAccentColor,
        ),
        borderRadius: AppBorders.inputs,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.headline6.copyWith(fontSize: 16),
          ),
          spacer5,
          Text(subtitle, style: theme.textTheme.subtitle1),
          if (context
              .select<OrderOwnerNotifier, bool>((e) => e.isOwnerConfirmed)) ...[
            Container(
                margin: EdgeInsets.only(bottom: 10, top: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.darkAccentColor,
                  ),
                  borderRadius: AppBorders.changeLocation,
                ),
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => AddressLocation(
                              city: City('Омск'),
                            )));
                  },
                  child: Text(
                    /// todo
                    'Изменить адрес',
                    style: TextStyle(
                        color: AppColors.darkAccentColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Divider(),

            /// todo
            Text('Адрес доставки',
                style: theme.textTheme.subtitle1.copyWith(fontSize: 10)),
            spacer5,
            Text(
              address,
              style: theme.textTheme.headline1
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ]
        ],
      ),
    );

    if (padding != null) {
      return Padding(padding: padding, child: child);
    }
    return child;
  }
}
