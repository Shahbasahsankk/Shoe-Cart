import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/view/home/widgets/product_description_style2.dart';
import 'package:flutter/material.dart';

import '../../../helper/sizedboxes/app_sizedboxes.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: const TextStyle(fontSize: 18),
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
        ProductDescriptionStyleTwo(
          text1: linethroughPrice,
          text2: currentPrice,
          text3: offer,
          fontsize: 20,
          fonsize2: 17,
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
