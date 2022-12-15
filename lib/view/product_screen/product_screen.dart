import 'package:e_commerce_app/controller/cart/cart_controller.dart';
import 'package:e_commerce_app/controller/product_screen/product_screen_controller.dart';
import 'package:e_commerce_app/controller/wishlist/wishlist_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/model/order_summary/order_summary_screen_enum.dart';
import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:e_commerce_app/view/product_screen/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/view/product_screen/widgets/product_description.dart';
import 'package:e_commerce_app/view/product_screen/widgets/product_images_carousal_view.dart';
import 'package:e_commerce_app/view/product_screen/widgets/sizechart_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.productId = productId;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productProvider.getAProduct();
      productProvider.productSize = null;
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
        ),
        body: Consumer3<ProductProvider, WishListProvider, CartProvider>(
          builder: (context, values, values2, values3, _) {
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
                            Stack(
                              children: [
                                ImageCarousalsWidget(images: product!.image),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 9, top: 8),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () =>
                                          values2.addOrRemoveFromWishList(
                                              values.product!.id.toString()),
                                      child: Icon(
                                        values2.favouriteProducts
                                                .contains(values.product!.id)
                                            ? Icons.favorite
                                            : Icons.favorite_outline_outlined,
                                        color: values2.favouriteProducts
                                                .contains(values.product!.id)
                                            ? AppColors.redColor
                                            : AppColors.blackcolor,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AppSizedBoxes.sizedboxH12,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ProductDescription(
                                    productName: product.name,
                                    rating: product.rating,
                                    linethroughPrice:
                                        '₹${product.discountPrice}',
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
                                        style: TextStyle(
                                            color: AppColors.blueColor),
                                      ),
                                    ],
                                  ),
                                  AppSizedBoxes.sizedboxH12,
                                  SizeChartGridView(
                                    sizeList: product.size,
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
                                text: values3.cartItemsId
                                        .contains(values.product!.id)
                                    ? 'Go to cart'
                                    : 'Add to cart',
                                ontap: () => values3.cartItemsId
                                        .contains(values.product!.id)
                                    ? values.goToCart(context)
                                    : values3.addToCart(
                                        values.product!.id.toString(),
                                        values.productSize,
                                        null),
                              ),
                              CustomBottomContainer(
                                  containerColor: AppColors.yellowColor,
                                  text: 'Buy now',
                                  ontap: () {
                                    values3.cartItemsId
                                            .contains(values.product!.id)
                                        ? null
                                        : values3.addToCart(
                                            values.product!.id.toString(),
                                            values.productSize,
                                            OrderSummaryScreenEnum
                                                .buyOneProductOrderSummaryScreen);
                                    values.toAddressScreen(
                                        context,
                                        OrderSummaryScreenEnum
                                            .buyOneProductOrderSummaryScreen,
                                        values3.cartList!.id,
                                        product.id);
                                  }),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
