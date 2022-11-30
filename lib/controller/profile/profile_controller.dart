import 'dart:developer';

import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void logOut(context) async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'refreshToken');
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
  }
}
