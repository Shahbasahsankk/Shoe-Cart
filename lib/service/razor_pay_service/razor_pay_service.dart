import 'dart:developer';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayService {
  void openRazorPay(Razorpay razorPay, options) {
    try {
      razorPay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }
}
