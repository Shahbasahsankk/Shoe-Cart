import 'dart:async';
import 'dart:developer';

import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/signup_model/signup_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/signup/otp_service.dart';
import 'package:e_commerce_app/service/signup/signup_service.dart';
import 'package:e_commerce_app/view/signup/widgets/signup_arguement_model.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpProvider with ChangeNotifier {
  SignUpProvider() {
    clearControllers();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isNotVisible = true;
  int timeRemaining = 30;
  Timer? timer;
  bool enableResend = false;
  bool clear = false;
  bool otpDone = false;
  String code = '';

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    mobileNumberController.clear();
    isNotVisible = true;
  }

  String? numberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length != 10) {
      return 'Number must be 10 digits';
    } else {
      return null;
    }
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 9) {
      return 'Short password';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    } else if (value != passwordController.text) {
      return 'Password do not match';
    } else {
      return null;
    }
  }

  void passwordHide() {
    isNotVisible = !isNotVisible;
    notifyListeners();
  }

  void toSignUpOtpScreen(context, currentState) async {
    final SignUpModel model = SignUpModel(
      fullName: nameController.text,
      email: emailController.text,
      number: mobileNumberController.text,
      password: passwordController.text,
    );

    if (currentState.validate()) {
      await SignUpService().signUp(model, context);
    }
  }

  void toBottonNav(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
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

  void verifyCode(context, SignUpModel model) async {
    if (code.length != 4) {
      Fluttertoast.showToast(
          msg: 'Please enter OTP', backgroundColor: AppColors.redColor);
    } else {
      await OtpService().verifyOtp(model, context, code);
    }
  }
}
