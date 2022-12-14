import 'package:flutter/material.dart';
import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';
import '../../../helper/textstyles/app_textstyles.dart';

class ShoeCart extends StatelessWidget {
  const ShoeCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blackcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppSizedBoxes.sizedboxW15,
            const Image(
              height: 80,
              width: 50,
              image: AssetImage('assets/splash_screen_assets/shoe_logo.png'),
            ),
            AppSizedBoxes.sizedboxW3,
            const Text(
              'ShoeCart',
              style: AppTextStyles.textStyle4,
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            AppSizedBoxes.sizedboxW10,
          ],
        ),
      ),
    );
  }
}
