import 'dart:async';

import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/signup_model/signup_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/view/new_password/widgets/model/newpassword_screen_model.dart';
import 'package:flutter/widgets.dart';

import '../../service/signup/otp_service.dart';
import '../../utils/app_toast.dart';

class OtpScreenProvider with ChangeNotifier {
  int timeRemaining = 30;
  Timer? timer;
  bool enableResend = false;
  bool clear = false;
  bool otpDone = false;
  String code = '';
  bool loading = false;

  void setResendVisibility(bool newValue, context, phone) async {
    await OtpService().sendOtp(context, phone).then((value) {
      if (value == true) {
        enableResend = newValue;
        timeRemaining = 30;
        clear = true;
        notifyListeners();
      } else {
        return null;
      }
    });
  }

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void verifyCode(context, SignUpModel model) async {
    if (code.length != 4) {
      AppToast.showToast('Please enter OTP', AppColors.redColor);
    } else {
      if (timeRemaining == 0) {
        AppToast.showToast('Otp timedout', AppColors.redColor);
      } else {
        loading = true;
        notifyListeners();
        await OtpService().verifyOtp(model.number, context, code).then((value) {
          if (value == true) {
            final args = NewPasswordScreenArguementsModel(model: model);
            Navigator.of(context)
                .pushReplacementNamed(RouteNames.newPasswordScreen,
                    arguments: args)
                .then((value) {
              loading = false;
              notifyListeners();
            });
          } else {
            null;
            loading = false;
            notifyListeners();
          }
        });
      }
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
