import 'package:flutter/material.dart';

import './widgets/consumer/consumer_order_widget.dart';
import '../../units/app_constants.dart';
import 'main_app_bar.dart';
import 'order_step_row.dart';
import 'widgets/consumer/consumer_order_widget.dart';
import 'widgets/delivery/delivery_order_widget.dart';
import 'widgets/payment_widget.dart';

const EdgeInsets padding = EdgeInsets.only(top: AppDims.d2);
const EdgeInsets blockPadding = EdgeInsets.only(top: AppDims.d4);

///todo вынести все в локаль
class OrderPaymentConditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var selectedRadio = '';
    return Scaffold(
      appBar: MainAppBar(
        onPressed: () {},
        onLeadingPressed: () {},
        leadingText: 'Оформление заказа',
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppDims.d4),
        children: [
          StepRow(
              number: '1',
              title: 'Подтвердите ваш телефон',
              padding: blockPadding),
          ConsumerOrderWidget(),
          StepRow(
              number: '2',
              title: 'Выберите способ доставки',
              padding: blockPadding),
          DeliveryOrderWidget(),
          StepRow(
              number: '3', title: 'Выберите способ оплаты', padding: padding),
          PaymentWidget()
        ],
      ),
    );
  }
}
