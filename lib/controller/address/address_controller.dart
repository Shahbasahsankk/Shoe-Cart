import 'dart:developer';

import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/address/address_screen_enum_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/utils/app_toast.dart';
import 'package:e_commerce_app/view/add_address/model/addaddress_arguement_model.dart';
import 'package:e_commerce_app/view/order_summery/model/order_summery_argument_model.dart';
import 'package:flutter/cupertino.dart';

import '../../service/address/address_service.dart';

class AddressProvider with ChangeNotifier {
  String? addressId;
  bool loading = false;

  void toOrderSummaryScreen(context) {
    if (addressId == null) {
      AppToast.showToast('Select an address', AppColors.redColor);
    } else {
      final args = OrderSummaryArguementModel(addressId: addressId!);
      log(addressId.toString());
      Navigator.of(context)
          .pushNamed(RouteNames.orderSummaryScreen, arguments: args);
    }
  }

  void toAddNewAddressScreen(context, AddressScreenEnum addressScreenCheck) {
    log(addressScreenCheck.toString());
    final args =
        AddNewAddressArguemnetModel(addressScreenCheck: addressScreenCheck);
    Navigator.of(context)
        .pushNamed(RouteNames.addNewAddressScreen, arguments: args);
  }

  void toEditAddressScreen(
      context, AddressScreenEnum addressScreenCheck, String addressId) {
    log(addressScreenCheck.toString());
    final args = AddNewAddressArguemnetModel(
        addressScreenCheck: addressScreenCheck, addressId: addressId);
    Navigator.of(context)
        .pushNamed(RouteNames.addNewAddressScreen, arguments: args);
  }

  void deleteAddress(String addressId) async {
    loading = true;
    notifyListeners();
    await AddressService().deleteAddress(addressId).then((value) {
      if (value != null) {
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
