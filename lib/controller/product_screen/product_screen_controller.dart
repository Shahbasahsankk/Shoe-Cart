import 'dart:developer';

import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/home_models/product_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../service/home/home_service.dart';

class ProductProvider with ChangeNotifier {
  int? sizeChartIndex;
  bool loading = false;
  Product? product;

  void addToCart() {
    Fluttertoast.showToast(
        msg: 'Item added to Cart', backgroundColor: AppColors.greenColor);
  }

  void toAddressScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.addressScreen);
  }

  void sizeSelect(int index) {
    sizeChartIndex = index;
    notifyListeners();
  }

  void getAProduct(productId, context) async {
    await HomeService().getAProduct(productId).then((value) {
      if (value != null) {
        product = value;
        notifyListeners();
        Navigator.of(context).pushNamed(RouteNames.productScreen);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }
}
