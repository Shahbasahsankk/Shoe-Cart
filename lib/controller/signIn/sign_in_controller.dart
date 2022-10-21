import 'package:flutter/widgets.dart';

import '../../routes/rout_names.dart';

class SignInProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isNotVisible = true;

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

  void passwordHide() {
    isNotVisible = !isNotVisible;
    notifyListeners();
  }



  void toSignUpScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.signUpScreen);
  }
  void toForgotPasswordScreen(context){
    Navigator.of(context).pushNamed(RouteNames.forgotPasswordScreen);
  }

   void toBottomNav(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
  }
}
