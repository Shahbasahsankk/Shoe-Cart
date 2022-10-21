import 'package:e_commerce_app/controller/splash/splash_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/sizedboxes/app_sizedboxes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashProvider= Provider.of<SplashProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_){
      splashProvider.splash(context);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        extendBodyBehindAppBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/splash_screen_assets/shoe_logo.png'),
            ),
            AppSizedBoxes.sizedboxH20,
            Image(
              height: 80,
              width: 80,
              image:
                  AssetImage('assets/splash_screen_assets/shoe_splash.gif'),
            ),
          ],
        ),
      ),
    );
  }
}
