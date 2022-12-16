import 'dart:developer';

import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/razor_pay_service/razor_pay_service.dart';
import 'package:e_commerce_app/widgets/navigator_key_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider with ChangeNotifier {
  final String onlinePayment = 'Online Payment';
  final String cashOnDelivery = 'Cash On Delivery';
  String paymentType = 'Online Payment';
  bool isVisible = false;
  Razorpay razorPay = Razorpay();
  bool success = false;
  BuildContext? ctx;
  Map<String, dynamic> options = {};

  void setTotalAmount(amount) {
    final total = "${(num.parse(amount) * 100)}";
    final amountPayable = total.toString();
    setOptions(amountPayable);
  }

  void setOptions(String amountPayable) {
    options = {
      'key': 'rzp_test_RVe81OqJboapJ6',
      'amount': amountPayable,
      'name': 'ShoeCart',
      'description': 'Shoes',
      'prefill': {
        'contact': '7856123494',
        'email': 'shoeCart@gmail.com',
      },
    };
    notifyListeners();
  }

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
    } else if (paymentType == onlinePayment) {
      log('opening razor pay');
      RazorPayService().openRazorPay(razorPay, options);
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.of(NavigationService.navigatorKey.currentContext!)
        .pushNamedAndRemoveUntil(RouteNames.orderScreen, (route) => false);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'Payment Canceled', backgroundColor: AppColors.redColor);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: 'External Wallet');
  }
}
