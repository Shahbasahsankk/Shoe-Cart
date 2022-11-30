import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/home_models/product_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../service/home/home_service.dart';

class ProductProvider with ChangeNotifier {
  ProductProvider() {
    loadingStart();
  }
  int? sizeChartIndex;
  bool loading = false;
  Product? product;
  String? productId;

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

  void getAProduct() async {
    loading = true;
    notifyListeners();
    await HomeService().getAProduct(productId!).then((value) {
      if (value != null) {
        sizeChartIndex = null;
        notifyListeners();
        product = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  void loadingStart() {
    loading = true;
    notifyListeners();
  }
}
