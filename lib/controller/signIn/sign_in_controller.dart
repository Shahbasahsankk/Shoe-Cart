import 'dart:developer';

import 'package:e_commerce_app/model/login_model/login_model.dart';
import 'package:e_commerce_app/service/signin/signin_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/rout_names.dart';

class SignInProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isNotVisible = true;
  bool loading = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();

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
    emailController.clear();
    passwordController.clear();
    Navigator.of(context).pushNamed(RouteNames.signUpScreen);
  }

  void toForgotPasswordScreen(context) {
    emailController.clear();
    passwordController.clear();
    Navigator.of(context).pushNamed(RouteNames.findMyAccount);
  }

  void login(context) async {
    loading = true;
    notifyListeners();
    final LoginModel model = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );
    await SignInService().login(model).then((value) {
      if (value != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void googleSignin(context) async {
    loading = true;
    notifyListeners();
    await SignInService().googleSignIn(googleSignIn).then((value) {
      if (value != null) {
        log(value.toString());
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
