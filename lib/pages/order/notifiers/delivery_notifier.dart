import 'package:flutter/material.dart';

import '../../../main.dart';


class DeliveryNotifier extends ChangeNotifier {
  final Delivery _delivery;

  bool _updating = false;

  bool get isUpdating => _updating;

  DeliveryNotifier(Delivery delivery) : _delivery = delivery;

  Future<void> runUserConfirmation() {
    _updating = true;
    notifyListeners();

    /// todo implement it
    return Future.delayed(Duration(seconds: 3), () {
      _updating = false;

      notifyListeners();
    });
  }
}
