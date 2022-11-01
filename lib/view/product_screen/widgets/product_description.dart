import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../helper/sizedboxes/app_sizedboxes.dart';
import '../../home/widgets/product_textdescription_style.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.productName,
    required this.rating,
    required this.ratingInWords,
    required this.linethroughPrice,
    required this.currentPrice,
    required this.offer,
  });
  final String productName;
  final String rating;
  final String ratingInWords;
  final String linethroughPrice;
  final String currentPrice;
  final String offer;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          productName,
          style: const TextStyle(fontSize: 25),
        ),
        AppSizedBoxes.sizedboxH8,
        Row(
          children: [
            Container(
              width: 40,
              color: AppColors.greenColor,
              child: Row(
                children: [
                  Text(
                    rating,
                    style: const TextStyle(color: AppColors.whiteColor),
                  ),
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: AppColors.whiteColor,
                  )
                ],
              ),
            ),
            AppSizedBoxes.sizedboxW5,
            Text(ratingInWords),
          ],
        ),
        AppSizedBoxes.sizedboxH8,
        ProductTextdesciptionStyle(
          text1: linethroughPrice,
          text2: currentPrice,
          text3: offer,
          fontsize: 20,
        ),
        AppSizedBoxes.sizedboxH8,
        const Divider(
          thickness: 3,
          color: AppColors.whiteColor70,
        ),
      ],
    );
  }
}
