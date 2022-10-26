
import 'package:e_commerce_app/controller/bottom_nav/bottom_nav_bar_controller.dart';
import 'package:e_commerce_app/controller/forgot_password/forgot_password_controller.dart';
import 'package:e_commerce_app/controller/home/home_screen_controller.dart';
import 'package:e_commerce_app/controller/new_password/new_password_controller.dart';
import 'package:e_commerce_app/controller/onBoard/onboard_controller.dart';
import 'package:e_commerce_app/controller/otp/otp_screen_controller.dart';
import 'package:e_commerce_app/controller/signIn/sign_in_controller.dart';
import 'package:e_commerce_app/controller/signUp/signup_controller.dart';
import 'package:e_commerce_app/controller/splash/splash_controller.dart';
import 'package:e_commerce_app/controller/welcome/welcome_controller.dart';
import 'package:e_commerce_app/routes/route_functions.dart';
import 'package:e_commerce_app/view/signIn/sign_in_screen.dart';
import 'package:e_commerce_app/view/signup/signup_screen.dart';
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
        ChangeNotifierProvider(create: (context)=>SplashProvider()),
        ChangeNotifierProvider(create: (context)=>WelcomeProvider()),
        ChangeNotifierProvider(create: (context)=>OnBoardProvider()),
        ChangeNotifierProvider(create: (context)=>SignUpProvider()),
        ChangeNotifierProvider(create: (context)=>SignInProvider()),
        ChangeNotifierProvider(create: (context)=>ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (context)=>OtpScreenProvider()),
        ChangeNotifierProvider(create: (context)=>NewPasswordProvider()),
        ChangeNotifierProvider(create: (context)=>HomeScreenProvider()),
        ChangeNotifierProvider(create: (context)=>BottomNavBarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
        home:  SignInScreen(),
      ),
    );
  }
}

