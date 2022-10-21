import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/view/new_password/widgets/success_dialogue.dart';
import 'package:flutter/material.dart';

class NewPasswordProvider with ChangeNotifier {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isVisible = false;

  void visibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter new password';
    } else if (value.length < 8) {
      return 'Password too short';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    } else if (value != newPasswordController.text) {
      return 'Password do not match';
    } else {
      return null;
    }
  }

  void success(context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return const SuccessDialouge();
      },
    );
  }

  void toSignInScreen(context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
  }
}
