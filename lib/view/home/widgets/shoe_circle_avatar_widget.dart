import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class ShoeCircleAvatarWidget extends StatelessWidget {
  const ShoeCircleAvatarWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.ontap,
  });

  final String imagePath;
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.whiteColor54,
            child: Center(
              child: Image(
                height: 80,
                width: 80,
                image: NetworkImage(imagePath),
              ),
            ),
          ),
          AppSizedBoxes.sizedboxH8,
          Text(text),
        ],
      ),
    );
  }
}
