import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:flutter/material.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({
    super.key,
    required this.ontap1,
    required this.ontap2,
  });
  final void Function() ontap1;
  final void Function() ontap2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ontap1,
              child: const Icon(
                Icons.remove,
                color: AppColors.blackcolor,
              ),
            ),
            AppSizedBoxes.sizedboxW3,
            const FittedBox(
              child: Text(
                '1',
                style: TextStyle(
                  color: AppColors.blackcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            AppSizedBoxes.sizedboxW3,
            GestureDetector(
              onTap: ontap2,
              child: const Icon(
                Icons.add,
                color: AppColors.blackcolor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
