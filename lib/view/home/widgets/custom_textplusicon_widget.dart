import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';

class CustonTextPlusIconWidget extends StatelessWidget {
  const CustonTextPlusIconWidget({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: AppColors.blackcolor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: ontap,
          child: const CircleAvatar(
            radius: 13,
            backgroundColor: AppColors.blueColor,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.blackcolor,
              size: 16,
            ),
          ),
        )
      ],
    );
  }
}
