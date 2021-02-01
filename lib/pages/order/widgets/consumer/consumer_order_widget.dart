import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers/order_owner_notifier.dart';
import 'owner/owner_confirmed.dart';
import 'owner/owner_unconfirmed.dart';

class ConsumerOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (context.select<OrderOwnerNotifier, bool>((e) => e.isOwnerConfirmed))
          ConfirmedOwner()
        else
          OwnerUnconfirmed(),
      ],
    );
  }
}
