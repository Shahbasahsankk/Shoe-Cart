import 'package:e_commerce_app/constants/api_url.dart';
import 'package:e_commerce_app/controller/home/home_screen_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/home/widgets/carousal_slider.dart';
import 'package:e_commerce_app/view/home/widgets/grid_view_products.dart';
import 'package:e_commerce_app/view/home/widgets/sales_widget.dart';
import 'package:e_commerce_app/view/home/widgets/shoe_cart.dart';
import 'package:e_commerce_app/view/home/widgets/shoe_circle_avatar_widget.dart';
import 'package:e_commerce_app/widgets/no_internet_view.dart';
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
      child: RefreshIndicator(
        color: AppColors.whiteColor,
        onRefresh: () => homeProvider.callHomeFunctions(),
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(
              double.infinity,
              100,
            ),
            child: ShoeCart(),
          ),
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  Consumer<HomeScreenProvider>(builder: (context, values, _) {
                return values.loading == true
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: const Center(
                          child: LoadingWidget(),
                        ),
                      )
                    : values.carousalList.isEmpty ||
                            values.categoryList.isEmpty ||
                            values.productList.isEmpty
                        ? noInternetView(context)
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CarousalSliderWidget(
                                carousals: values.carousalList,
                              ),
                              AppSizedBoxes.sizedboxH20,
                              SizedBox(
                                height: 90,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return AppSizedBoxes.sizedboxW10;
                                  },
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: values.categoryList.length,
                                  itemBuilder: (context, index) {
                                    return ShoeCircleAvatarWidget(
                                      imagePath:
                                          ("http://${ApiUrl.url}:5008/category/${values.categoryList[index].imagePath}"),
                                      text: values.categoryList[index].name,
                                      ontap: () =>
                                          homeProvider.toCollectionScreen(
                                        context,
                                        values.categoryList[index].name,
                                        values.categoryList[index].id,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              AppSizedBoxes.sizedboxH15,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  SalesWidget(
                                    imagePath:
                                        'assets/home_page_assets/kidsshoes_sales.jpeg',
                                    text1: 'Kids Shoes',
                                    text2: '50% SALE',
                                    // ontap: () => homeProvider.toCollectionScreen(
                                    //     context, 'Kids Shoes'),
                                  ),
                                  SalesWidget(
                                    imagePath:
                                        'assets/home_page_assets/menshoes_sales.jpeg',
                                    text1: 'Men Sneakers',
                                    text2: 'From ₹1300',
                                    // ontap: () => homeProvider.toCollectionScreen(
                                    //     context, 'Men Sneakers'),
                                  ),
                                  SalesWidget(
                                    imagePath:
                                        'assets/home_page_assets/womenshoes_sales.jpeg',
                                    text1: 'Women Loafers',
                                    text2: '35% SALE',
                                    // ontap: () => homeProvider.toCollectionScreen(
                                    //     context, 'Women Loafers'),
                                  )
                                ],
                              ),
                              AppSizedBoxes.sizedboxH15,
                              const GridViewProducts(
                                physics: NeverScrollableScrollPhysics(),
                              )
                            ],
                          );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
