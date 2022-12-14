import 'package:e_commerce_app/controller/add_new_address/add_new_address_controller.dart';
import 'package:e_commerce_app/controller/address/address_controller.dart';
import 'package:e_commerce_app/controller/bottom_nav/bottom_nav_bar_controller.dart';
import 'package:e_commerce_app/controller/cart/cart_controller.dart';
import 'package:e_commerce_app/controller/confirm_order/confirm_order_controller.dart';
import 'package:e_commerce_app/controller/forgot_password/forgot_password_controller.dart';
import 'package:e_commerce_app/controller/home/home_screen_controller.dart';
import 'package:e_commerce_app/controller/new_password/new_password_controller.dart';
import 'package:e_commerce_app/controller/onBoard/onboard_controller.dart';
import 'package:e_commerce_app/controller/order_summary/order_summary_controller.dart';
import 'package:e_commerce_app/controller/otp/otp_screen_controller.dart';
import 'package:e_commerce_app/controller/payments/payments_controller.dart';
import 'package:e_commerce_app/controller/product_screen/product_screen_controller.dart';
import 'package:e_commerce_app/controller/profile/profile_controller.dart';
import 'package:e_commerce_app/controller/signIn/sign_in_controller.dart';
import 'package:e_commerce_app/controller/signUp/signup_controller.dart';
import 'package:e_commerce_app/controller/splash/splash_controller.dart';
import 'package:e_commerce_app/controller/welcome/welcome_controller.dart';
import 'package:e_commerce_app/controller/wishlist/wishlist_controller.dart';
import 'package:e_commerce_app/routes/route_functions.dart';
import 'package:e_commerce_app/view/address/address_screen.dart';
import 'package:e_commerce_app/view/splash/splash_screen.dart';
import 'package:e_commerce_app/widgets/navigator_key_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => WelcomeProvider()),
        ChangeNotifierProvider(create: (context) => OnBoardProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (context) => OtpScreenProvider()),
        ChangeNotifierProvider(create: (context) => NewPasswordProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderSummaryProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => ConfirmOrderProvider()),
        ChangeNotifierProvider(create: (context) => AddNewAddressProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'ShoeCart',
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
        home: const SplashScreen(),
      ),
    );
  }
}
