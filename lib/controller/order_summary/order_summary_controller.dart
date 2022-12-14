import 'package:e_commerce_app/model/address/get_address_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/address/address_service.dart';
import 'package:flutter/cupertino.dart';

class OrderSummaryProvider with ChangeNotifier {
  AddressModel? address;
  bool loading = false;

  void toPaymentScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.paymentScreen);
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
      loading = false;
      notifyListeners();
    });
  }
}
