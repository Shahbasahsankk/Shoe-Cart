import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsPrice extends StatelessWidget {
  const DetailsPrice({
    super.key,
    required this.text1,
    required this.text2,
    this.fontWeight = FontWeight.normal,
    this.color1 = AppColors.whiteColor,
    this.color2 = AppColors.whiteColor,
  });
  final String text1;
  final String text2;
  final FontWeight fontWeight;
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontWeight: fontWeight,
            color: color1,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontWeight: fontWeight,
            color: color2,
          ),
        ),
      ],
    );
  }
}
