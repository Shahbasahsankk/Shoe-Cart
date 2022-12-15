import 'package:e_commerce_app/controller/cart/cart_controller.dart';
import 'package:e_commerce_app/controller/order_summary/order_summary_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/model/order_summary/order_summary_screen_enum.dart';
import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:e_commerce_app/view/order_summery/widgets/address_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_placeorderwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/widgets/cart_product.dart';
import '../cart/widgets/price_details_widget.dart';

class OrderSummeryScreen extends StatelessWidget {
  const OrderSummeryScreen({
    super.key,
    required this.addressId,
    required this.screenCheck,
    this.cartId,
    this.productId,
  });
  final String addressId;
  final OrderSummaryScreenEnum screenCheck;
  final String? cartId;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    final orderSummaryProvider =
        Provider.of<OrderSummaryProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orderSummaryProvider.checkScreen(screenCheck, productId, cartId);
      orderSummaryProvider.getSingleAddress(addressId);
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Summary'),
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Consumer2<OrderSummaryProvider, CartProvider>(
            builder: (context, values, cartValues, _) {
          return values.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: double.infinity,
                  child: const LoadingWidget(),
                )
              : values.address == null
                  ? const SizedBox()
                  : Stack(
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                AddressWidget(
                                  name: values.address!.fullName,
                                  addressType: values.address!.title,
                                  address:
                                      "${values.address!.address}, ${values.address!.landMark}, ${values.address!.place}, ${values.address!.state}, ${values.address!.pin}",
                                  phone: values.address!.phone,
                                ),
                                const Divider(thickness: 4),
                                AppSizedBoxes.sizedboxH5,
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CartProducts(
                                      image: screenCheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? cartValues.cartList!.products[index]
                                              .product.image[0]
                                          : values.product[0].product.image[0],
                                      proudctName: screenCheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? cartValues.cartList!.products[index]
                                              .product.name
                                          : values.product[0].product.name,
                                      size: screenCheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? cartValues
                                              .cartList!.products[index].size
                                          : values.product[0].size,
                                      prouductPrice: screenCheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? cartValues.cartList!.products[index]
                                              .product.price
                                          : values.product[0].price,
                                      linethroughPrice: screenCheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? cartValues.cartList!.products[index]
                                              .product.discountPrice
                                              .toString()
                                          : values.product[0].discountPrice
                                              .toString(),
                                      offer: screenCheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? cartValues.cartList!.products[index]
                                              .product.offer
                                              .toString()
                                          : values.product[0].product.offer
                                              .toString(),
                                      ontap1: () async {
                                        screenCheck ==
                                                OrderSummaryScreenEnum
                                                    .normalOrderSummaryScreen
                                            ? await cartValues
                                                .incrementOrDecrementQuantity(
                                                -1,
                                                cartValues.cartList!
                                                    .products[index].product.id,
                                                cartValues.cartList!
                                                    .products[index].size,
                                                cartValues.cartList!
                                                    .products[index].qty,
                                              )
                                                .then((value) {
                                                values.getSingleCartProduct(
                                                    productId!, cartId!);
                                              })
                                            : await cartValues
                                                .incrementOrDecrementQuantity(
                                                -1,
                                                values.product[0].product.id,
                                                values.product[0].size,
                                                values.product[0].qty,
                                              )
                                                .then((value) {
                                                values.getSingleCartProduct(
                                                    productId!, cartId!);
                                              });
                                      },
                                      ontap2: () async {
                                        screenCheck ==
                                                OrderSummaryScreenEnum
                                                    .normalOrderSummaryScreen
                                            ? await cartValues
                                                .incrementOrDecrementQuantity(
                                                1,
                                                cartValues.cartList!
                                                    .products[index].product.id,
                                                cartValues.cartList!
                                                    .products[index].size,
                                                cartValues.cartList!
                                                    .products[index].qty,
                                              )
                                                .then((value) {
                                                values.getSingleCartProduct(
                                                    productId!, cartId!);
                                              })
                                            : await cartValues
                                                .incrementOrDecrementQuantity(
                                                1,
                                                values.product[0].product.id,
                                                values.product[0].size,
                                                values.product[0].qty,
                                              )
                                                .then((value) {
                                                values.getSingleCartProduct(
                                                    productId!, cartId!);
                                              });
                                      },
                                      quantity: screenCheck ==
                                              OrderSummaryScreenEnum
                                                  .normalOrderSummaryScreen
                                          ? cartValues
                                              .cartList!.products[index].qty
                                          : values.product[0].qty,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(thickness: 1);
                                  },
                                  itemCount: screenCheck ==
                                          OrderSummaryScreenEnum
                                              .normalOrderSummaryScreen
                                      ? cartValues.cartList!.products.length
                                      : 1,
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
                                          color: AppColors.greenColor),
                                    ),
                                  ],
                                ),
                                AppSizedBoxes.sizedboxH12,
                                const Divider(thickness: 4),
                                AppSizedBoxes.sizedboxH12,
                                PriceDetailsWidget(
                                  itemCount: screenCheck ==
                                          OrderSummaryScreenEnum
                                              .normalOrderSummaryScreen
                                      ? cartValues.totalProductCount.toString()
                                      : values.product[0].qty.toString(),
                                  amount: screenCheck ==
                                          OrderSummaryScreenEnum
                                              .normalOrderSummaryScreen
                                      ? cartValues.cartList!.totalPrice
                                          .toString()
                                      : values.product[0].price.toString(),
                                  discount: screenCheck ==
                                          OrderSummaryScreenEnum
                                              .normalOrderSummaryScreen
                                      ? cartValues.totalSave.toString()
                                      : values.totalSave.toString(),
                                  deliveryCharge: 'Free',
                                  totalAmount: screenCheck ==
                                          OrderSummaryScreenEnum
                                              .normalOrderSummaryScreen
                                      ? cartValues.cartList!.totalPrice
                                          .toString()
                                      : values.product[0].price.toString(),
                                ),
                                AppSizedBoxes.sizedboxH80,
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomBottomPlaceOrderWidget(
                            ontap: () =>
                                orderSummaryProvider.toPaymentScreen(context),
                            totalAmount: screenCheck ==
                                    OrderSummaryScreenEnum
                                        .normalOrderSummaryScreen
                                ? cartValues.cartList!.totalPrice.toString()
                                : values.product[0].price.toString(),
                          ),
                        ),
                      ],
                    );
        }),
      ),
    );
  }
}
