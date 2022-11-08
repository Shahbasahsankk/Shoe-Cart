import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';

class PaymentProvider with ChangeNotifier {
  final String onlinePayment = 'Online Payment';
  final String cashOnDelivery = 'Cash On Delivery';
  String paymentType = 'Online Payment';
  bool isVisible = false;

  paymentSelection(String? value) {
    if (value == onlinePayment) {
      isVisible = true;
      notifyListeners();
    } else if (value == cashOnDelivery) {
      isVisible = false;
      notifyListeners();
    }
    paymentType = value.toString();
    notifyListeners();
  }

  void order(context) {
    if (paymentType == cashOnDelivery) {
      Navigator.of(context).pushNamed(RouteNames.confirmOrderScreen);
    } else if (paymentType == onlinePayment) {}
  }
}
