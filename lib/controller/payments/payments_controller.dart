import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/razor_pay_service/razor_pay_service.dart';
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

  var options = {
    'key': 'rzp_test_RVe81OqJboapJ6',
    'amount': 50000,
    'name': 'ShoeCart',
    'description': 'Sneaker Shoes',
    'prefill': {
      'contact': '7856123494',
      'email': 'sh@gmail.com',
    },
  };

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
      RazorPayService().openRazorPay(razorPay, options);
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    success = true;
    notifyListeners();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'Payment Canceled', backgroundColor: AppColors.redColor);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: 'External Wallet');
  }

  void redirectToOrderScreen(context) {
    success = false;
    notifyListeners();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.orderScreen, (route) => false);
  }
}
