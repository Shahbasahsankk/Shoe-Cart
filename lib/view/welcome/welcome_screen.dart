import 'package:e_commerce_app/controller/welcome/welcome_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeProvider= Provider.of<WelcomeProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_){
      welcomeProvider.toOnboardScreens(context);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.welcomeScreenBgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/welcome_and_onboard_screen_assets/welcome1.png'),
            ),
            Text(
              'Welcome To 👋',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Text(
              'SHOESTORE',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'The best shoe app of the century',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Text(
              'for your daily needs',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
