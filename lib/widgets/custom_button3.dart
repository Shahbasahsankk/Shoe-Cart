import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonThree extends StatelessWidget {
  const CustomButtonThree({
    super.key,
    required this.onTap,
    required this.imagePath,
  });
  final void Function() onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 60,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.lightDarkBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child:Center(
          child: Image(
                height: 25,
                width: 25,
                image: AssetImage(imagePath),
              ),
        ),
      ),
    );
  }
}
