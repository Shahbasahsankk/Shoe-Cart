import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/textstyles/app_textstyles.dart';
import 'package:flutter/material.dart';

class CustomButtonOne extends StatelessWidget {
  const CustomButtonOne({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function() onTap;
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
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.customButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
