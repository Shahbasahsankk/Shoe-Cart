import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:flutter/material.dart';

class CustomButtonTwo extends StatelessWidget {
  const CustomButtonTwo({
    super.key,
    required this.text,
    required this.onTap,
    required this.imagePath,
  });
  final String text;
  final void Function() onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.lightDarkBackgroundColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 25,
              width: 25,
              image: AssetImage(imagePath),
            ),
            AppSizedBoxes.sizedboxW5,
            Text(
              text,
              style: const TextStyle(color: AppColors.whiteColor,fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
