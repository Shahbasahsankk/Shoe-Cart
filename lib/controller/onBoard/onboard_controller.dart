import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/widgets.dart';

class OnBoardProvider with ChangeNotifier {
  late PageController pageController;
  toSignInScreen(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
  }
}
