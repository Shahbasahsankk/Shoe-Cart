import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  void toAddressScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.addressScreen);
  }
}
