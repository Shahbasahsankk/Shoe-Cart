import 'dart:isolate';

import 'package:e_commerce_app/model/login_model/login_model.dart';
import 'package:e_commerce_app/service/signin/signin_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../routes/rout_names.dart';

class SignInProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isNotVisible = true;
  bool loading = false;

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
      return 'Please enter password';
    } else {
      return null;
    }
  }

  String? numberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length != 10) {
      return 'Invalid mobile number';
    } else {
      return null;
    }
  }

  void passwordHide() {
    isNotVisible = !isNotVisible;
    notifyListeners();
  }

  void toSignUpScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.signUpScreen);
  }

  void toForgotPasswordScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.forgotPasswordScreen);
  }

  void login(context) async {
    loading = true;
    notifyListeners();
    final LoginModel model = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );
    await SignInService().login(context, model);
    loading = false;
    notifyListeners();
  }
}
