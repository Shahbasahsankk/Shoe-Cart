import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/product_screen/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/view/product_screen/widgets/product_description.dart';
import 'package:e_commerce_app/view/product_screen/widgets/sizechart_grid.dart';
import 'package:flutter/material.dart';

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        const Image(
                          width: double.infinity,
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/home_page_assets/men_loafer2.jpeg'),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.blackcolor),
                            child: const Icon(
                              Icons.favorite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppSizedBoxes.sizedboxH12,
                    const ProductDescription(
                      productName: 'KS STORE Loafer Men(Light Green)',
                      rating: '4.5',
                      ratingInWords: '4 ratings',
                      linethroughPrice: '699',
                      currentPrice: '₹270',
                      offer: '61% off',
                    ),
                    AppSizedBoxes.sizedboxH8,
                    const Text(
                      'Offers & Coupons',
                      style: TextStyle(fontSize: 16),
                    ),
                    AppSizedBoxes.sizedboxH8,
                    RichText(
                      text: const TextSpan(
                          text: 'ShoeCart Offer: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Use Coupon NKSHOECART071 to get 15% off',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                    ),
                    AppSizedBoxes.sizedboxH12,
                    const Divider(
                      thickness: 3,
                      color: AppColors.whiteColor70,
                    ),
                    AppSizedBoxes.sizedboxH8,
                    Row(
                      children: const [
                        Text(
                          'Size-UK/India',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Icon(
                          Icons.insert_chart_outlined_rounded,
                          color: AppColors.blueColor,
                        ),
                        AppSizedBoxes.sizedboxW3,
                        Text(
                          'Size Chart',
                          style: TextStyle(color: AppColors.blueColor),
                        ),
                      ],
                    ),
                    AppSizedBoxes.sizedboxH12,
                    SizeChartGridView(ontap: () {}),
                    AppSizedBoxes.sizedboxH80,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: const [
                    CustomBottomContainer(
                      containerColor: AppColors.whiteColor,
                      text: 'Add to cart',
                    ),
                    CustomBottomContainer(
                      containerColor: AppColors.yellowColor,
                      text: 'Buy now',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
