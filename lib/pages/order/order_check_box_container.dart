import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../units/app_constants.dart';
import 'notifiers/order_owner_notifier.dart';

class OrderCheckboxContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: AppDims.d4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppDims.d5,
            height: AppDims.d5,
            decoration: BoxDecoration(
                border: Border.all(color: theme.primaryColor, width: 2),
                borderRadius: AppBorders.inputs),
            child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                final notifier = context.read<OrderOwnerNotifier>();
                notifier.setOtherConsumer(
                    isOtherConsumer: !notifier.isOtherConsumer);
              },
              child: context.select<OrderOwnerNotifier, bool>(
                      (notifier) => notifier.isOtherConsumer)
                  ? SvgPicture.asset(
                      'assets/common/ok_sign_black.svg',
                      fit: BoxFit.fill,
                      color: theme.primaryColor,
                    )
                  : SizedBox(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppDims.d3),
            child: SizedBox(
                width: 100,
                child: Text('Другой покупатель',
                    style: theme.textTheme.headline2
                        .copyWith(fontWeight: FontWeight.w500))),
          )
        ],
      ),
    );
  }
}
