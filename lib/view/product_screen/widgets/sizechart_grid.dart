import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SizeChartGridView extends StatelessWidget {
  const SizeChartGridView({
    super.key,
    required this.ontap,
  });
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
        childAspectRatio: 1 / 0.5,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.transparentColor,
              border: Border.all(
                color: AppColors.whiteColor54,
              ),
            ),
            child: const Center(
              child: Text('7'),
            ),
          ),
        );
      },
    );
  }
}
