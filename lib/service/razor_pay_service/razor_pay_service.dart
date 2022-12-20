import 'package:e_commerce_app/utils/app_exceptions.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayService {
  void openRazorPay(Razorpay razorPay, options) {
    try {
      razorPay.open(options);
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
  }
}
