import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductProvider with ChangeNotifier {
  void addToCart() {
    Fluttertoast.showToast(
        msg: 'Item added to Cart', backgroundColor: AppColors.greenColor);
  }

  void toAddressScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.addressScreen);
  }
}
