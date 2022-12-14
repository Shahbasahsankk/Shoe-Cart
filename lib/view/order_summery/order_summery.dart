import 'package:e_commerce_app/controller/add_new_address/add_new_address_controller.dart';
import 'package:e_commerce_app/controller/order_summary/order_summary_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
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
  });
  final String addressId;
  @override
  Widget build(BuildContext context) {
    final orderSummaryProvider =
        Provider.of<OrderSummaryProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<OrderSummaryProvider>(
                    builder: (context, values, _) {
                  return values.loading == true
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: double.infinity,
                          child: const LoadingWidget(),
                        )
                      : values.address == null
                          ? const SizedBox()
                          : Column(
                              children: [
                                const Divider(thickness: 1),
                                AppSizedBoxes.sizedboxH15,
                                AddressWidget(
                                  name: values.address!.fullName,
                                  addressType: values.address!.title,
                                  address:
                                      "${values.address!.address}, ${values.address!.landMark}, ${values.address!.place}, ${values.address!.state}, ${values.address!.pin}",
                                  phone: values.address!.phone,
                                ),
                                const Divider(thickness: 4),
                                AppSizedBoxes.sizedboxH5,
                                CartProducts(
                                  image: '2122images-1669193837839.jpeg',
                                  proudctName: 'Men Formal shoes',
                                  size: '27',
                                  prouductPrice: 849,
                                  linethroughPrice: '1499',
                                  offer: '43% off',
                                  ontap1: () {},
                                  ontap2: () {},
                                  quantity: 2,
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
                                const PriceDetailsWidget(
                                  itemCount: '1',
                                  amount: '849',
                                  discount: '651',
                                  deliveryCharge: 'Free',
                                  totalAmount: '849',
                                ),
                                AppSizedBoxes.sizedboxH80,
                              ],
                            );
                }),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomPlaceOrderWidget(
                ontap: () => orderSummaryProvider.toPaymentScreen(context),
                totalAmount: '234',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
