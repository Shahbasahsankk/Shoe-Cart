import 'dart:io';

import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomContainer extends StatelessWidget {
  const CustomBottomContainer({
    super.key,
    required this.containerColor,
    required this.text,
  });
  final Color containerColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 2,
      color: containerColor,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.blackcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
