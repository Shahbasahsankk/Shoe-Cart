import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/otpscreen_enum_model.dart/otpscreen_enum.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/forgot_password/forgot_password_service.dart';
import 'package:e_commerce_app/utils/app_toast.dart';
import 'package:flutter/material.dart';

import '../../view/otp/model/otp_screen_arguement_model.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool loading = false;
  final TextEditingController findAccountController = TextEditingController();

  void toOtpScreen(context, FormState currentState) async {
    if (currentState.validate()) {
      loading = true;
      notifyListeners();
      await ForgotPasswordService()
          .getUser(findAccountController.text)
          .then((value) {
        if (value != null) {
          final args = OtpArguementModel(
              model: value, checkScreen: OtpScreenEnum.forgotOtpScreen);
          Navigator.of(context).pushNamed(
            RouteNames.otpScreen,
            arguments: args,
          );
          loading = false;
          notifyListeners();
        } else {
          loading = false;
          notifyListeners();
          AppToast.showToast('No user Found', AppColors.redColor);
        }
      });
    }
  }

  String? findAccountTextfieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }
}
