import 'package:flutter/material.dart';
import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';
import '../../../helper/textstyles/app_textstyles.dart';

class SalesWidget extends StatelessWidget {
  const SalesWidget({
    super.key,
    required this.imagePath,
    required this.text1,
    required this.text2,
    // required this.ontap,
  });
  final String imagePath;
  final String text1;
  final String text2;
  // final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
            ),
            AppSizedBoxes.sizedboxH5,
            Text(
              text1,
              style: const TextStyle(
                color: AppColors.blackcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text2,
              style: AppTextStyles.textstyle5,
            )
          ],
        ),
      ),
    );
  }
}
