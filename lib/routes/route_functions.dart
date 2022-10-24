import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/view/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce_app/view/home/home_screen.dart';
import 'package:e_commerce_app/view/new_password/new_password_screen.dart';
import 'package:e_commerce_app/view/onBoard/on_board_screen.dart';
import 'package:e_commerce_app/view/otp/model/otp_screen_arguement_model.dart';
import 'package:e_commerce_app/view/otp/otp_screen.dart';
import 'package:e_commerce_app/view/signIn/sign_in_screen.dart';
import 'package:e_commerce_app/view/signup/signup_screen.dart';
import 'package:e_commerce_app/view/welcome/welcome_screen.dart';
import 'package:e_commerce_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../view/splash/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case RouteNames.onBoardScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardScreen(),
        );
        case RouteNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
        case RouteNames.signInScreen:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
        case RouteNames.bottomNav:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
        case RouteNames.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
        case RouteNames.otpScreen:
        final args= settings.arguments as OtpArguementModel;
        return MaterialPageRoute(
          builder: (context) =>  OtpScreen(text: args.text,),
        );
        case RouteNames.newPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
        );
         case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
