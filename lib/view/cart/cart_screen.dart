import 'package:e_commerce_app/controller/cart/cart_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AddressRow(
                      name: 'John Wick',
                      pinCode: '673636',
                      address: 'Willington House, Cambridge Road, Enland, Uk',
                      ontap: () {},
                    ),
                    AppSizedBoxes.sizedboxH8,
                    const Divider(thickness: 4),
                    CartProducts(
                      image: 'assets/home_page_assets/kidsshoes_sales.jpeg',
                      proudctName: 'Men Formal shoes',
                      size: '27',
                      prouductPrice: '849',
                      linethroughPrice: '1499',
                      offer: '43% off',
                      ontap1: () {},
                      ontap2: () {},
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
                          style: TextStyle(color: AppColors.greenColor),
                        ),
                      ],
                    ),
                    AppSizedBoxes.sizedboxH8,
                    const Divider(thickness: 1),
                    AppSizedBoxes.sizedboxH5,
                    Center(
                      child: Container(
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.dullWhitecolor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.delete_forever_sharp,
                              color: AppColors.redColor,
                            ),
                            AppSizedBoxes.sizedboxW5,
                            Text('Remove')
                          ],
                        ),
                      ),
                    ),
                    AppSizedBoxes.sizedboxH12,
                    const Divider(thickness: 4),
                    AppSizedBoxes.sizedboxH12,
                    const PriceDetailsWidget(
                      itemCount: 1,
                      amount: '849',
                      discount: '651',
                      deliveryCharge: 'Free',
                      totalAmount: '849',
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomPlaceOrderWidget(
                ontap: () => cartScreenProvider.toAddressScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
