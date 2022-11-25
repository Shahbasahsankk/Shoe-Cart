import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OnBoardProvider with ChangeNotifier {
  late PageController pageController;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void toSignInScreen(context) async {
    await storage.write(key: 'onboard', value: 'completed');
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
  }
}
