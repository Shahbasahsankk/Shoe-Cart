import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? onboardValue;
  String? signInValue;

  void splash(context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    onboardValue = await storage.read(key: 'onboard');
    signInValue = await storage.read(key: 'token');
    if (signInValue != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.bottomNav, (route) => false);
    } else {
      if (onboardValue != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.signInScreen, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.welcomeScreen, (route) => false);
      }
    }
  }
}
