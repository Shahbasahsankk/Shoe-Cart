import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';

class OrderSummaryProvider with ChangeNotifier {
  void toPaymentScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.paymentScreen);
  }
}
