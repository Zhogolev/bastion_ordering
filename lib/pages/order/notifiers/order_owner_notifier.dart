import 'package:flutter/material.dart';

import '../../../main.dart';

class OrderOwnerNotifier extends ChangeNotifier {
  final OrderOwner _owner = OrderOwner();

  bool _updating = false;

  OrderOwner get owner => _owner;

  OrderOwnerNotifier();

  bool get isOtherConsumer => _owner.isOtherConsumer;

  bool get isOwnerConfirmed => _owner.userConfirmed;

  bool get isUpdating => _updating;

  void setOtherConsumer({bool isOtherConsumer = false}) {
    _owner.isOtherConsumer = isOtherConsumer;
    notifyListeners();
  }

  void setUserPhoneNumber(String newNumber) => _owner.phoneNumber = newNumber;

  Future<void> runUserConfirmation() {
    _updating = true;
    notifyListeners();

    ///todo implement репозиторий
    return Future.delayed(Duration(seconds: 3), () {
      _updating = false;
      _owner.userConfirmed = _owner.phoneNumber.isNotEmpty;
      notifyListeners();
    });
  }
}
