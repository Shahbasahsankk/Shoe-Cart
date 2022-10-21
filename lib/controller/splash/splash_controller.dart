import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/widgets.dart';

class SplashProvider with ChangeNotifier {
  void splash(context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.welcomeScreen, (route) => false);
  }
}
