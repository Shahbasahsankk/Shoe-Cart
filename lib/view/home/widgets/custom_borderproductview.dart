import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/home/widgets/productview_container.dart';
import 'package:flutter/material.dart';

import '../../../helper/colors/app_colors.dart';

class CustomBorderProductViewContainer extends StatelessWidget {
  const CustomBorderProductViewContainer({
    super.key,
    required this.productName1,
    required this.productName2,
    required this.productName3,
    required this.imagePath1,
    required this.imagePath2,
    required this.imagePath3,
    required this.linethroughPrice1,
    required this.linethroughPrice2,
    required this.linethroughPrice3,
    required this.currentPrice1,
    required this.currentPrice2,
    required this.currentPrice3,
    required this.offer1,
    required this.offer2,
    required this.offer3,
  });
  final String productName1;
  final String productName2;
  final String productName3;
  final String imagePath1;
  final String imagePath2;
  final String imagePath3;
  final String linethroughPrice1;
  final String linethroughPrice2;
  final String linethroughPrice3;
  final String currentPrice1;
  final String currentPrice2;
  final String currentPrice3;
  final String offer1;
  final String offer2;
  final String offer3;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
                right: BorderSide(
                  color: Colors.grey,
                  width: 1,
                )),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 130,
                  width: 300,
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    imagePath1,
                  ),
                ),
                AppSizedBoxes.sizedboxH5,
                Text(
                  productName1,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
                AppSizedBoxes.sizedboxH5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      linethroughPrice1,
                      style: const TextStyle(
                        color: AppColors.whiteColor54,
                        decoration: TextDecoration.lineThrough,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppSizedBoxes.sizedboxW5,
                    Text(
                      currentPrice1,
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppSizedBoxes.sizedboxW5,
                    Text(
                      offer1,
                      style: const TextStyle(
                        color: AppColors.greenColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            ProductViewContainer(
              imagePath: imagePath2,
              productName: productName2,
              linethroughPrice: linethroughPrice2,
              currentPrice: currentPrice2,
              offer: offer2,
            ),
            ProductViewContainer(
              imagePath: imagePath3,
              productName: productName3,
              linethroughPrice: linethroughPrice3,
              currentPrice: currentPrice3,
              offer: offer3,
            ),
          ],
        )
      ],
    );
  }
}
