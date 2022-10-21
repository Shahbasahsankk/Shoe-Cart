import 'dart:async';

import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpScreenProvider with ChangeNotifier {
  int timeRemaining = 30;
  Timer? timer;
  bool enableResend = false;
  bool clear = false;
  bool otpDone = false;
  String code = '';

  void setResendVisibility(bool newValue) {
    enableResend = newValue;
    timeRemaining = 30;
    clear = true;
    notifyListeners();
  }

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void verifyCode(context){
    if(code.length!=4){
     Fluttertoast.showToast(msg: 'Please enter OTP',backgroundColor: AppColors.redColor);
    }else{
      Navigator.of(context).pushReplacementNamed(RouteNames.newPasswordScreen);
    }
  }

  void changeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeRemaining != 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }
}
