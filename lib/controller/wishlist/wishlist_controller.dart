import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  void toCartScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.cartScreen);
  }
}
