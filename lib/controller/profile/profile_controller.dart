import 'package:e_commerce_app/model/order_summary/order_summary_screen_enum.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/profile/profile_service.dart';
import 'package:e_commerce_app/view/address/model/address_screen_arguement_model.dart';
import 'package:e_commerce_app/widgets/navigator_key_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool loading = false;

  void logOut(context) async {
    loading = true;
    notifyListeners();
    ProfileService().logOutUser().then((value) async {
      if (value != null) {
        await storage.delete(key: 'token');
        await storage.delete(key: 'refreshToken');
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void goToSettingPage() {
    // code to go to settingpage
  }

  void goToAddressPage() {
    final args = AddressScreenArguementModel(
      screenCheck: OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen,
    );
    Navigator.of(NavigationService.navigatorKey.currentContext!)
        .pushNamed(RouteNames.addressScreen, arguments: args);
  }

  void goToNotificationSettings() {
    // code to goto notification page
  }

  void aboutApp() {
    // code for about app
  }
}
