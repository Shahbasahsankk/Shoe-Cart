import 'package:flutter/material.dart';

import '../../../helper/sizedboxes/app_sizedboxes.dart';
import 'custom_product_card.dart';
import 'custom_textplusicon_widget.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({
    super.key,
    required this.headLine,
    required this.descriptionOne,
    required this.descriptionTwo,
    required this.descriptionThree,
    required this.descriptionFour,
    required this.offerOne,
    required this.offerTwo,
    required this.offerThree,
    required this.offerFour,
    required this.imagePathOne,
    required this.imagePathTwo,
    required this.imagePathThree,
    required this.imagePathFour,
    required this.containerColor,
    required this.ontap,
    required this.ontap2,
    required this.ontap3,
    required this.ontap4,
    required this.ontap5,
  });
  final String headLine;
  final String descriptionOne;
  final String descriptionTwo;
  final String descriptionThree;
  final String descriptionFour;
  final String offerOne;
  final String offerTwo;
  final String offerThree;
  final String offerFour;
  final String imagePathOne;
  final String imagePathTwo;
  final String imagePathThree;
  final String imagePathFour;
  final Color containerColor;
  final void Function() ontap;
  final void Function() ontap2;
  final void Function() ontap3;
  final void Function() ontap4;
  final void Function() ontap5;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      width: double.infinity,
      decoration: BoxDecoration(
        color: containerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustonTextPlusIconWidget(
              text: headLine,
              ontap: ontap,
            ),
            AppSizedBoxes.sizedboxH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomProductCard(
                  description: descriptionOne,
                  imagePath: imagePathOne,
                  offer: offerOne,
                  ontap: ontap2,
                ),
                CustomProductCard(
                  description: descriptionTwo,
                  imagePath: imagePathTwo,
                  offer: offerTwo,
                  ontap: ontap3,
                )
              ],
            ),
            AppSizedBoxes.sizedboxH35,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomProductCard(
                  description: descriptionThree,
                  imagePath: imagePathThree,
                  offer: offerThree,
                  ontap: ontap4,
                ),
                CustomProductCard(
                  description: descriptionFour,
                  imagePath: imagePathFour,
                  offer: offerFour,
                  ontap: ontap5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
