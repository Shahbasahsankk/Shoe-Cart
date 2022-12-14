import 'package:e_commerce_app/controller/cart/cart_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/model/order_summary/order_summary_screen_enum.dart';
import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:e_commerce_app/view/cart/widgets/cart_product.dart';
import 'package:e_commerce_app/view/cart/widgets/custom_cart_button.dart';
import 'package:e_commerce_app/view/cart/widgets/price_details_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_placeorderwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartScreenProvider =
        Provider.of<CartProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartScreenProvider.getCartItems();
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
        ),
        body: Consumer<CartProvider>(
          builder: (context, values, _) {
            return values.loading == true
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    width: double.infinity,
                    child: const Center(
                      child: LoadingWidget(),
                    ),
                  )
                : values.cartList == null || values.cartList!.products.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: Center(
                          child: Column(
                            children: const [
                              SizedBox(height: 130),
                              Image(
                                  image: AssetImage(
                                      'assets/cart&wishlist&orders assets/empty cart.png')),
                              Text(
                                'Cart is empty',
                                style: TextStyle(color: AppColors.whiteColor54),
                              )
                            ],
                          ),
                        ),
                      )
                    : Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Divider(thickness: 4),
                                  ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          CartProducts(
                                            image: values
                                                .cartList!
                                                .products[index]
                                                .product
                                                .image[0],
                                            proudctName: values.cartList!
                                                .products[index].product.name,
                                            size: values
                                                .cartList!.products[index].size,
                                            prouductPrice: values.cartList!
                                                .products[index].price,
                                            linethroughPrice: values.cartList!
                                                .products[index].discountPrice
                                                .toString(),
                                            offer: values.cartList!
                                                .products[index].product.offer
                                                .toString(),
                                            ontap1: () => values
                                                .incrementOrDecrementQuantity(
                                              -1,
                                              values.cartList!.products[index]
                                                  .product.id,
                                              values.cartList!.products[index]
                                                  .size,
                                              values.cartList!.products[index]
                                                  .qty,
                                            ),
                                            ontap2: () => values
                                                .incrementOrDecrementQuantity(
                                              1,
                                              values.cartList!.products[index]
                                                  .product.id,
                                              values.cartList!.products[index]
                                                  .size,
                                              values.cartList!.products[index]
                                                  .qty,
                                            ),
                                            quantity: values
                                                .cartList!.products[index].qty,
                                          ),
                                          AppSizedBoxes.sizedboxH8,
                                          const Divider(thickness: 1),
                                          AppSizedBoxes.sizedboxH5,
                                          Row(
                                            children: const [
                                              Text('Delivery by Tue Nov 15 |'),
                                              AppSizedBoxes.sizedboxW3,
                                              Text(
                                                'Free',
                                                style: TextStyle(
                                                    color:
                                                        AppColors.greenColor),
                                              ),
                                            ],
                                          ),
                                          AppSizedBoxes.sizedboxH8,
                                          const Divider(thickness: 1),
                                          AppSizedBoxes.sizedboxH5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomCartButton(
                                                text: 'Remove',
                                                onTap: () =>
                                                    values.removeFromCart(values
                                                        .cartList!
                                                        .products[index]
                                                        .product
                                                        .id),
                                                color: AppColors.redColor,
                                                icon:
                                                    Icons.delete_forever_sharp,
                                              ),
                                              AppSizedBoxes.sizedboxW15,
                                              CustomCartButton(
                                                text: 'Buy now',
                                                onTap: () =>
                                                    values.toAddressScreen(
                                                  context,
                                                  OrderSummaryScreenEnum
                                                      .buyOneProductOrderSummaryScreen,
                                                  values.cartList!.id,
                                                  values
                                                      .cartList!
                                                      .products[index]
                                                      .product
                                                      .id,
                                                ),
                                                color: AppColors.blueColor,
                                                icon: Icons.shopify,
                                              ),
                                            ],
                                          ),
                                          AppSizedBoxes.sizedboxH12,
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Divider(thickness: 3);
                                    },
                                    itemCount: values.cartList!.products.length,
                                  ),
                                  AppSizedBoxes.sizedboxH12,
                                  const Divider(thickness: 4),
                                  AppSizedBoxes.sizedboxH12,
                                  PriceDetailsWidget(
                                    itemCount:
                                        values.totalProductCount.toString(),
                                    amount: values.cartList!.totalDiscount
                                        .toString(),
                                    discount: values.totalSave.toString(),
                                    deliveryCharge: 'Free',
                                    totalAmount:
                                        values.cartList!.totalPrice.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomBottomPlaceOrderWidget(
                              ontap: () => cartScreenProvider.toAddressScreen(
                                context,
                                OrderSummaryScreenEnum.normalOrderSummaryScreen,
                                null,
                                null,
                              ),
                              totalAmount:
                                  values.cartList!.totalPrice.toString(),
                            ),
                          ),
                        ],
                      );
          },
        ),
      ),
    );
  }
}
