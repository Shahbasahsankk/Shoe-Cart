import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';
import '../../../helper/textstyles/app_textstyles.dart';

class ShoeCart extends StatelessWidget {
  const ShoeCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blackcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              height: 80,
              width: 50,
              image: AssetImage('assets/splash_screen_assets/shoe_logo.png'),
            ),
            AppSizedBoxes.sizedboxW3,
            Text(
              'ShoeCart',
              style: AppTextStyles.textStyle4,
            ),
          ],
        ),
      ),
    );
  }
}
