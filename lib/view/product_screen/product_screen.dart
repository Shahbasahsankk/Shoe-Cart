import 'package:e_commerce_app/controller/home/home_screen_controller.dart';
import 'package:e_commerce_app/controller/product_screen/product_screen_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/model/home_models/product_model.dart';
import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:e_commerce_app/view/product_screen/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/view/product_screen/widgets/product_description.dart';
import 'package:e_commerce_app/view/product_screen/widgets/product_images_carousal_view.dart';
import 'package:e_commerce_app/view/product_screen/widgets/sizechart_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
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
        body: Consumer<ProductProvider>(builder: (context, values, _) {
          final product = values.product;
          return values.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                )
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageCarousalsWidget(images: product!.image!),
                          AppSizedBoxes.sizedboxH12,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ProductDescription(
                                  productName: product.name!,
                                  rating: product.rating!,
                                  ratingInWords: '${product.rating} ratings',
                                  linethroughPrice: '₹${product.discountPrice}',
                                  currentPrice: '₹${product.price}',
                                  offer: '${product.offer}% off',
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
                                      style:
                                          TextStyle(color: AppColors.blueColor),
                                    ),
                                  ],
                                ),
                                AppSizedBoxes.sizedboxH12,
                                SizeChartGridView(
                                  sizeList: product.size!,
                                ),
                                AppSizedBoxes.sizedboxH80,
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            CustomBottomContainer(
                              containerColor: AppColors.whiteColor,
                              text: 'Add to cart',
                              ontap: () => productProvider.addToCart(),
                            ),
                            CustomBottomContainer(
                              containerColor: AppColors.yellowColor,
                              text: 'Buy now',
                              ontap: () =>
                                  productProvider.toAddressScreen(context),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
        }),
      ),
    );
  }
}
