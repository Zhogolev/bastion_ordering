import 'package:flutter/material.dart';

import '../../../data/entities/city.dart';
import '../main_app_bar.dart';

class AddressLocation extends StatelessWidget {
  final City city;

  /// todo change on
  const AddressLocation({Key key, @required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        onPressed: () {
          print('stub');
        },
        leadingText: city.city,
        onLeadingPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Container(),
    );
  }
}
