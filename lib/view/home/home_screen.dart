import 'package:e_commerce_app/controller/home/home_screen_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/home/widgets/carousal_slider.dart';
import 'package:e_commerce_app/view/home/widgets/custom_borderproductview.dart';
import 'package:e_commerce_app/view/home/widgets/custom_discount_grab_everyoneslist_container.dart';
import 'package:e_commerce_app/view/home/widgets/prefferedsize_appbar.dart';
import 'package:e_commerce_app/view/home/widgets/sales_widget.dart';
import 'package:e_commerce_app/view/home/widgets/shoe_circle_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(
            double.infinity,
            130,
          ),
          child: PrefferedSizeAppBarWidget(),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<HomeScreenProvider>(builder: (context, values, _) {
              return values.loading == true
                  ? const Center(
                      child: LoadingWidget(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CarousalSliderWidget(
                          carousals: values.carousalList,
                        ),
                        AppSizedBoxes.sizedboxH20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ShoeCircleAvatarWidget(
                              imagePath: 'assets/home_page_assets/sneaker.png',
                              text: 'Sneakers',
                              ontap: () => homeProvider.toCollectionScreen(
                                  context, 'Sneakers'),
                            ),
                            AppSizedBoxes.sizedboxW10,
                            ShoeCircleAvatarWidget(
                              imagePath: 'assets/home_page_assets/sports.png',
                              text: 'Sports',
                              ontap: () => homeProvider.toCollectionScreen(
                                  context, 'Sports'),
                            ),
                            AppSizedBoxes.sizedboxW10,
                            ShoeCircleAvatarWidget(
                              imagePath: 'assets/home_page_assets/formal.png',
                              text: 'Formals',
                              ontap: () => homeProvider.toCollectionScreen(
                                  context, 'Formals'),
                            ),
                            AppSizedBoxes.sizedboxW10,
                            ShoeCircleAvatarWidget(
                              imagePath: 'assets/home_page_assets/boots.png',
                              text: 'Boots',
                              ontap: () => homeProvider.toCollectionScreen(
                                  context, 'Boots'),
                            ),
                            AppSizedBoxes.sizedboxW10,
                            ShoeCircleAvatarWidget(
                              imagePath: 'assets/home_page_assets/loafer.png',
                              text: 'Loafers',
                              ontap: () => homeProvider.toCollectionScreen(
                                  context, 'Loafers'),
                            ),
                          ],
                        ),
                        AppSizedBoxes.sizedboxH15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SalesWidget(
                              imagePath:
                                  'assets/home_page_assets/kidsshoes_sales.jpeg',
                              text1: 'Kids Shoes',
                              text2: '50% SALE',
                              ontap: () => homeProvider.toCollectionScreen(
                                  context, 'Kids Shoes'),
                            ),
                            SalesWidget(
                              imagePath:
                                  'assets/home_page_assets/menshoes_sales.jpeg',
                              text1: 'Men Sneakers',
                              text2: 'From ₹1300',
                              ontap: () => homeProvider.toCollectionScreen(
                                  context, 'Men Sneakers'),
                            ),
                            SalesWidget(
                              imagePath:
                                  'assets/home_page_assets/womenshoes_sales.jpeg',
                              text1: 'Women Loafers',
                              text2: '35% SALE',
                              ontap: () => homeProvider.toCollectionScreen(
                                  context, 'Women Loafers'),
                            )
                          ],
                        ),
                        AppSizedBoxes.sizedboxH15,
                        CustomContainerWidget(
                          headLine: 'Discounts for you',
                          descriptionOne: 'Mens Sneakers',
                          descriptionTwo: 'Womens Sports',
                          descriptionThree: 'Womens Boots',
                          descriptionFour: 'Kids Wears',
                          offerOne: 'Min 40% off',
                          offerTwo: 'Min 60% off',
                          offerThree: 'Min 25% off',
                          offerFour: 'Min 55% off',
                          imagePathOne:
                              'assets/home_page_assets/sneakers_minimum.jpeg',
                          imagePathTwo:
                              'assets/home_page_assets/women_sports_off.jpeg',
                          imagePathThree:
                              'assets/home_page_assets/women_boots_off.jpeg',
                          imagePathFour:
                              'assets/home_page_assets/kids_shoes_off.jpeg',
                          containerColor: Colors.teal[100]!,
                          ontap: () => homeProvider.toCollectionScreen(
                              context, 'All offers'),
                          ontap2: () => homeProvider.toCollectionScreen(
                              context, 'Men Sneakers'),
                          ontap3: () => homeProvider.toCollectionScreen(
                              context, 'Women Sports'),
                          ontap4: () => homeProvider.toCollectionScreen(
                              context, 'women Boots'),
                          ontap5: () => homeProvider.toCollectionScreen(
                              context, 'Kids Wears'),
                        ),
                        AppSizedBoxes.sizedboxH15,
                        const CustomBorderProductViewContainer(
                          productName1:
                              'STELVIO Lace-Up Ankle-Length Combat Boots',
                          productName2:
                              'GULASS WICK Mocassins Casual Loafers for Men',
                          productName3:
                              'GO21 Mid-Top Colourblock Lace-Up Sneakers For Men',
                          imagePath1: 'assets/home_page_assets/men_boots1.jpeg',
                          imagePath2:
                              'assets/home_page_assets/men_loafer2.jpeg',
                          imagePath3:
                              'assets/home_page_assets/men_sneaker1.jpeg',
                          linethroughPrice1: '₹3299',
                          linethroughPrice2: '₹999',
                          linethroughPrice3: '₹2499',
                          currentPrice1: '₹1155',
                          currentPrice2: '₹520',
                          currentPrice3: '₹1100',
                          offer1: '65% off',
                          offer2: '48% off',
                          offer3: '56% off',
                        ),
                        AppSizedBoxes.sizedboxH15,
                        CustomContainerWidget(
                          headLine: 'Grab or Gone',
                          descriptionOne: 'Mens Sports',
                          descriptionTwo: 'Women Sneakers',
                          descriptionThree: 'Men Loafers',
                          descriptionFour: 'Kids Wears',
                          offerOne: 'From ₹699',
                          offerTwo: 'Under ₹1199',
                          offerThree: 'Up to 80% Off',
                          offerFour: 'From 499',
                          imagePathOne:
                              'assets/home_page_assets/mens_sports_off1.jpeg',
                          imagePathTwo:
                              'assets/home_page_assets/women_sneakers_off1.jpeg',
                          imagePathThree:
                              'assets/home_page_assets/men_loafer1.jpeg',
                          imagePathFour:
                              'assets/home_page_assets/kids_shoes_off2.jpeg',
                          containerColor: AppColors.whiteColor70,
                          ontap: () => homeProvider.toCollectionScreen(
                              context, 'All offers'),
                          ontap2: () => homeProvider.toCollectionScreen(
                              context, 'Men Sports'),
                          ontap3: () => homeProvider.toCollectionScreen(
                              context, 'Women Sneakers'),
                          ontap4: () => homeProvider.toCollectionScreen(
                              context, 'Men Loafers'),
                          ontap5: () => homeProvider.toCollectionScreen(
                              context, 'Kids Wears'),
                        ),
                        AppSizedBoxes.sizedboxH15,
                        const CustomBorderProductViewContainer(
                          productName1: 'Lavie Women Tan Brown Solid Derby',
                          productName2: 'Boys Navy Blue Textured Go Run 400 V2',
                          productName3: 'ECCO SHAPE 35 SARTORELLE',
                          imagePath1:
                              'assets/home_page_assets/women_formals1.jpeg',
                          imagePath2:
                              'assets/home_page_assets/kids_sports.jpeg',
                          imagePath3:
                              'assets/home_page_assets/women_boots1.jpeg',
                          linethroughPrice1: '₹1999',
                          linethroughPrice2: '₹2199',
                          linethroughPrice3: '₹14999',
                          currentPrice1: '₹1399',
                          currentPrice2: '₹2999',
                          currentPrice3: '₹12499',
                          offer1: '30% off',
                          offer2: '36% off',
                          offer3: '20% off',
                        ),
                        AppSizedBoxes.sizedboxH15,
                        CustomContainerWidget(
                          headLine: "On Everybod's List",
                          descriptionOne: 'Men Formals',
                          descriptionTwo: 'Women Loafers',
                          descriptionThree: 'Men Boots',
                          descriptionFour: 'Women Formals',
                          offerOne: '10% Off',
                          offerTwo: 'Upto 25% Off',
                          offerThree: 'From ₹2299',
                          offerFour: 'Under ₹1500',
                          imagePathOne:
                              'assets/home_page_assets/men_formals_off1.jpeg',
                          imagePathTwo:
                              'assets/home_page_assets/women_loafers_off1.jpeg',
                          imagePathThree:
                              'assets/home_page_assets/men_boots_off1.jpeg',
                          imagePathFour:
                              'assets/home_page_assets/women_formals_off1.jpeg',
                          containerColor: AppColors.whiteColor38,
                          ontap: () => homeProvider.toCollectionScreen(
                              context, 'All offers'),
                          ontap2: () => homeProvider.toCollectionScreen(
                              context, 'Men Formals'),
                          ontap3: () => homeProvider.toCollectionScreen(
                              context, 'women Loafers'),
                          ontap4: () => homeProvider.toCollectionScreen(
                              context, 'Men Boots'),
                          ontap5: () => homeProvider.toCollectionScreen(
                              context, 'Women Formals'),
                        ),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
