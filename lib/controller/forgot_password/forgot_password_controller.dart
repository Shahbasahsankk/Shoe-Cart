import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/view/forgot_password/widgets/reset_method.dart';
import 'package:e_commerce_app/view/otp/model/otp_screen_arguement_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool isSmsSelected = false;
  bool isMailSelected = false;
  final TextEditingController resetController = TextEditingController();

  void toOtpScreen(context) {
    final args = OtpArguementModel(text: isMailSelected==true?'sha@gmail.com':'+91 99••••••89');
    if (isMailSelected == true) {
      Navigator.of(context).pushReplacementNamed(RouteNames.otpScreen, arguments: args);
    } else if (isSmsSelected == true) {
      Navigator.of(context).pushReplacementNamed(RouteNames.otpScreen, arguments: args);
    } else {
      Fluttertoast.showToast(
        msg: 'Please select a way to reset password',
        backgroundColor: AppColors.redColor,
      );
    }
    
  }

  void mailSelected() {
    isMailSelected = true;
    isSmsSelected = false;
    notifyListeners();
  }

  void smsSelected() {
    isMailSelected = false;
    isSmsSelected = true;
    notifyListeners();
  }

  void getResetMethod(context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return const ResetMethod();
      },
    );
    
  }

  String? mailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }

  String? numberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your number';
    } else if (value.length != 10) {
      return 'Invalid number';
    } else {
      return null;
    }
  }
}
