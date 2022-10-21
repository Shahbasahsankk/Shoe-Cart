import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(
        color: AppColors.lightDarkBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppSizedBoxes.sizedboxW15,
          const CircleAvatar(
            backgroundColor: AppColors.darkShadeBackgroundColor,
            radius: 40,
            child: Image(
              height: 40,
              width: 40,
              image: AssetImage(
                  'assets/forgot_ password_screen_assets/via_sms.png'),
            ),
          ),
          AppSizedBoxes.sizedboxW15,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Via SMS:'),
              AppSizedBoxes.sizedboxH5,
              Text('+91 99••••••89'),
            ],
          )
        ],
      ),
    );
  }
}
