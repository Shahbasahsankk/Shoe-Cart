import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/cart/widgets/proudct_quantity.dart';
import 'package:e_commerce_app/view/cart/widgets/prouduct_descripton.dart';
import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({
    super.key,
    required this.image,
    required this.proudctName,
    required this.size,
    required this.prouductPrice,
    required this.linethroughPrice,
    required this.offer,
    required this.ontap1,
    required this.ontap2,
  });
  final String image;
  final String proudctName;
  final String size;
  final String prouductPrice;
  final String linethroughPrice;
  final String offer;
  final void Function() ontap1;
  final void Function() ontap2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  color: AppColors.whiteColor54,
                  child: Image(
                    height: 110,
                    width: 110,
                    fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                ),
              ],
            ),
            AppSizedBoxes.sizedboxW15,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizedBoxes.sizedboxH5,
                Text(
                  proudctName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSizedBoxes.sizedboxH5,
                Text('Size:$size'),
                AppSizedBoxes.sizedboxH5,
                CartPruductTextStyle(
                  text1: linethroughPrice,
                  text2: prouductPrice,
                  text3: offer,
                ),
                AppSizedBoxes.sizedboxH12,
                ProductQuantity(
                  ontap1: ontap1,
                  ontap2: ontap2,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
