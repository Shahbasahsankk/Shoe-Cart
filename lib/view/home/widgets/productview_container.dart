import 'package:e_commerce_app/view/home/widgets/product_textdescription_style.dart';
import 'package:flutter/material.dart';

import '../../../helper/sizedboxes/app_sizedboxes.dart';

class ProductViewContainer extends StatelessWidget {
  const ProductViewContainer({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.linethroughPrice,
    required this.currentPrice,
    required this.offer,
  });
  final String imagePath;
  final String productName;
  final String linethroughPrice;
  final String currentPrice;
  final String offer;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.31,
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 60,
              width: 100,
              fit: BoxFit.fill,
              image: AssetImage(imagePath),
            ),
            AppSizedBoxes.sizedboxH3,
            Text(
              productName,
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            ProductTextdesciptionStyle(
              text1: linethroughPrice,
              text2: currentPrice,
              text3: offer,
            )
          ],
        ),
      ),
    );
  }
}
