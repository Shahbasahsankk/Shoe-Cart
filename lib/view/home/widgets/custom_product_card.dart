import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    required this.description,
    required this.imagePath,
    required this.offer,
    required this.ontap,
  });
  final String imagePath;
  final String description;
  final String offer;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                fit: BoxFit.fill,
                image: AssetImage(imagePath),
              ),
              AppSizedBoxes.sizedboxH8,
              Text(
                description,
                style: const TextStyle(color: AppColors.blackcolor),
              ),
              AppSizedBoxes.sizedboxH5,
              Text(
                offer,
                style: const TextStyle(
                  color: AppColors.greenColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
