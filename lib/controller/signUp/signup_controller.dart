import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/widgets.dart';

class SignUpProvider with ChangeNotifier {
  final TextEditingController nameController= TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isNotVisible = true;

  String? nameValidation(String? value){
    if(value==null||value.isEmpty){
      return 'Please enter your name';
    }else{
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


  void toBottonNav(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
  }
}
