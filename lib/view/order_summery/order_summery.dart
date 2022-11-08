import 'package:e_commerce_app/controller/order_summary/order_summary_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/order_summery/widgets/address_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_placeorderwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/widgets/cart_product.dart';
import '../cart/widgets/price_details_widget.dart';

class OrderSummeryScreen extends StatelessWidget {
  const OrderSummeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderSummaryProvider =
        Provider.of<OrderSummaryProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Summary'),
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Divider(thickness: 1),
                    AppSizedBoxes.sizedboxH15,
                    const AddressWidget(
                      name: 'John Wick',
                      addressType: 'HOME',
                      address:
                          'Willington House, Cambridge Square, London city, United Kingdom, 674567',
                      phone: '9078563412',
                    ),
                    const Divider(thickness: 4),
                    AppSizedBoxes.sizedboxH5,
                    CartProducts(
                      image: 'assets/home_page_assets/formal.png',
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
                    AppSizedBoxes.sizedboxH80,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomPlaceOrderWidget(
                ontap: () => orderSummaryProvider.toPaymentScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
