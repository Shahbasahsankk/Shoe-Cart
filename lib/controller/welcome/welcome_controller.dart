import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/widgets.dart';

class WelcomeProvider with ChangeNotifier {
  void toOnboardScreens(context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.onBoardScreen, (route) => false);
  }
}
