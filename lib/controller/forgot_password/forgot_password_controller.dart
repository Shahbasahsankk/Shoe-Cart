import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordProvider with ChangeNotifier{
  void toOtpScreen(context){
    Navigator.of(context).pushNamed(RouteNames.otpScreen);
  }
}