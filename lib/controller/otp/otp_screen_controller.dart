import 'dart:async';

import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/otpscreen_enum_model.dart/otpscreen_enum.dart';
import 'package:e_commerce_app/model/signup_model/signup_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/view/new_password/model/newpassword_screen_model.dart';
import 'package:flutter/widgets.dart';

import '../../service/otp_service/otp_service.dart';
import '../../service/signup/signup_service.dart';
import '../../utils/app_toast.dart';

class OtpScreenProvider with ChangeNotifier {
  int timeRemaining = 30;
  Timer? timer;
  bool enableResend = false;
  bool clear = false;
  bool otpDone = false;
  String code = '';
  bool loading = false;

  void setResendVisibility(bool newValue, context, String email) {
    clear = true;
    notifyListeners();
    OtpService().sendOtp(email).then((value) {
      if (value != null) {
        clear = false;
        notifyListeners();
        enableResend = newValue;
        timeRemaining = 30;
      } else {
        return null;
      }
    });
  }

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void verifyCode(context, SignUpModel model, OtpScreenEnum screenChek) async {
    if (code.length != 4) {
      AppToast.showToast('Please enter OTP', AppColors.redColor);
    } else {
      if (timeRemaining == 0) {
        AppToast.showToast('Otp timedout', AppColors.redColor);
      } else {
        loading = true;
        notifyListeners();
        if (screenChek == OtpScreenEnum.forgotOtpScreen) {
          await OtpService().verifyOtp(model.email, code).then((value) {
            if (value != null) {
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
        } else if (screenChek == OtpScreenEnum.signUpOtpScreen) {
          await OtpService().verifyOtp(model.email, code).then((value) async {
            if (value != null) {
              await SignUpService().signUp(model, context).then((value) {
                if (value != null) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteNames.bottomNav, (route) => false);
                  loading = false;
                  notifyListeners();
                } else {
                  loading = false;
                  notifyListeners();
                }
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
