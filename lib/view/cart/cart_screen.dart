import 'package:e_commerce_app/controller/cart/cart_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:e_commerce_app/view/cart/widgets/address_row.dart';
import 'package:e_commerce_app/view/cart/widgets/cart_product.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
          actions: const [Icon(Icons.search)],
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
                : values.cartList!.products.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: const Center(
                          child: Text('Cart is empty'),
                        ),
                      )
                    : Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  AddressRow(
                                    name: 'John Wick',
                                    pinCode: '673636',
                                    address:
                                        'Willington House, Cambridge Road, Enland, Uk',
                                    ontap: () {},
                                  ),
                                  AppSizedBoxes.sizedboxH8,
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
                                                .products[index].product.offer,
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
                                          Center(
                                            child: GestureDetector(
                                              onTap: () =>
                                                  values.removeFromCart(values
                                                      .cartList!
                                                      .products[index]
                                                      .product
                                                      .id),
                                              child: Container(
                                                width: 120,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColors
                                                        .dullWhitecolor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons
                                                          .delete_forever_sharp,
                                                      color: AppColors.redColor,
                                                    ),
                                                    AppSizedBoxes.sizedboxW5,
                                                    Text('Remove')
                                                  ],
                                                ),
                                              ),
                                            ),
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
                                    itemCount: values.cartList!.products.length,
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
                              ontap: () =>
                                  cartScreenProvider.toAddressScreen(context),
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
