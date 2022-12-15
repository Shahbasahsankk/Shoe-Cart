import 'package:e_commerce_app/model/address/get_address_model.dart';
import 'package:e_commerce_app/model/cart/get_single_cart_model.dart';
import 'package:e_commerce_app/model/order_summary/order_summary_screen_enum.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/address/address_service.dart';
import 'package:flutter/cupertino.dart';

import '../../service/cart/cart_service.dart';

class OrderSummaryProvider with ChangeNotifier {
  OrderSummaryProvider() {
    startLoading();
  }
  AddressModel? address;
  bool loading = false;
  List<GetSingelCartProduct> product = [];
  int? totalSave;

  void toPaymentScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.paymentScreen);
  }

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void getSingleAddress(String addressId) async {
    loading = true;
    notifyListeners();
    await AddressService().getSingleAddress(addressId).then((value) {
      if (value != null) {
        address = value;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void checkScreen(
      OrderSummaryScreenEnum screenCheck, String? productId, String? cartId) {
    if (screenCheck == OrderSummaryScreenEnum.normalOrderSummaryScreen) {
      return;
    } else if (screenCheck ==
        OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen) {
      getSingleCartProduct(productId!, cartId!);
    }
  }

  void getSingleCartProduct(String productId, String cartId) async {
    await CartService().getSingleCartProduct(productId, cartId).then((value) {
      if (value != null) {
        product = value;
        notifyListeners();
        totalSave = product[0].discountPrice.toInt() - product[0].price.toInt();
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
