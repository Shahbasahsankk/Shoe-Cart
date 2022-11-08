import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';

class ConfirmOrderProvider with ChangeNotifier {
  ConfirmOrderProvider() {
    generateCaptcha();
  }
  final TextEditingController captchaController = TextEditingController();
  String? captcha;

  void generateCaptcha() {
    captchaController.clear();
    var random = Random();
    var next = random.nextInt(900) + 100;

    captcha = next.toString();
    notifyListeners();
  }

  void toOrderScreen(context, FormState currentState) {
    if (currentState.validate()) {
      if (captchaController.text == captcha) {
        Navigator.of(context).pushReplacementNamed(RouteNames.orderScreen);
      } else if (captchaController.text != captcha) {
        generateCaptcha();
        Fluttertoast.showToast(
            msg: 'Incorrect captcha', backgroundColor: AppColors.redColor);
      }
    }
  }

  String? captchaValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Characters';
    } else if (value.length != 3) {
      return 'Enter characters Correctly';
    }
    return null;
  }
}
