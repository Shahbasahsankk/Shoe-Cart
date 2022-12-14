import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: AppColors.whiteColor,
        size: 35,
        secondRingColor: AppColors.dullWhitecolor,
        thirdRingColor: AppColors.dullWhitecolor,
      ),
    );
  }
}
