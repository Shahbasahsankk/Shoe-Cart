import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';

class AddressProvider with ChangeNotifier {
  final String address1 = 'address1';
  String? addressType = 'address1';
  void addressChange(String? value) {
    addressType = value.toString();
    notifyListeners();
  }

  void toOrderSummaryScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.orderSummaryScreen);
  }
}
