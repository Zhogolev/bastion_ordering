// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/entities/shop_location.dart';
import 'design/theme.dart';
import 'pages/order/notifiers/delivery_notifier.dart';
import 'pages/order/notifiers/order_owner_notifier.dart';
import 'pages/order/order_page.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main() {
  runApp(
    const MyApp(),
  );
}

class OrderOwner {
  String phoneNumber;
  String name;
  String email;
  bool isOtherConsumer;
  String otherConsumerName;
  String otherConsumerPhone;
  bool userConfirmed;

  OrderOwner(
      {this.phoneNumber = '',
      this.name = '',
      this.email = '',
      this.isOtherConsumer = false,
      this.otherConsumerName = '',
      this.userConfirmed = false,
      this.otherConsumerPhone = ''});
}

class DeliveryOffer {
  String title;
  String conditionDescription;
  String price;
  String leadingConditionDescription;
}

class Delivery {
  double price;
  DateTime time;
  DateTime date;
  List<DeliviryLocation> asd;
}

enum PaymentType {
  /// Только такие типы на дизайне
  debitCard,
  creditCard,
  cash
}

enum Currency { rub, usd }

class Order {
  double price;
  double sale;
  double currency;
  PaymentType type;
  bool isConditionApproved;
  bool isRecallNeeded;
  bool didConsultantHelp;
}

class Total {
  final Delivery delivery;
  final Order order;
  final OrderOwner owner;

  Total({this.delivery, this.order, this.owner});
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  /// todo add localization
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiProvider(
      providers: [
        ChangeNotifierProvider<OrderOwnerNotifier>(
            create: (_) => OrderOwnerNotifier()),
        FutureProvider<Delivery>(
          create: (_) => Future.delayed(
            Duration(seconds: 3),
            () {
              return Delivery();
            },
          ),
          lazy: false,
        ),
        ProxyProvider<Delivery, DeliveryNotifier>(
            update: (_, delivery, __) => DeliveryNotifier(delivery)),
        ProxyProvider3<OrderOwnerNotifier, Delivery, Order, Total>(
            update: (_, owner, delivery, order, __) =>
                Total(order: order, delivery: delivery, owner: owner.owner))
      ],
      child: Theme(data: mainTheme, child: OrderPaymentConditionPage()),
    ));
  }
}
