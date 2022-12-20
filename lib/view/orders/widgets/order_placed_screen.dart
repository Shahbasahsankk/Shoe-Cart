import 'package:e_commerce_app/controller/bottom_nav/bottom_nav_bar_controller.dart';
import 'package:e_commerce_app/controller/order_controller/myorder_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/orders/widgets/order_address_widget.dart';
import 'package:e_commerce_app/view/orders/widgets/placed_container.dart';
import 'package:e_commerce_app/view/orders/widgets/send_order_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/loading_widget.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Divider divider = Divider(thickness: 2);
    final myOrdersProvider =
        Provider.of<MyOrdersProvider>(context, listen: false);
    final bottomNavProvider =
        Provider.of<BottomNavBarProvider>(context, listen: false);
    bottomNavProvider.currentIndex = 2;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myOrdersProvider.getSingleOrder('pass order id');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Consumer<MyOrdersProvider>(builder: (context, values, _) {
          return values.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSizedBoxes.sizedboxH8,
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        onPressed: () => values.closeOrderPlacedScreen(context),
                        icon: const Icon(
                          Icons.close,
                          size: 28,
                        ),
                      ),
                    ),
                    AppSizedBoxes.sizedboxH15,
                    PlacedContainer(
                      itemCount: '2',
                      totalAmount: '4567',
                      onTap: () => values.goToOrderDetialsScreen(context),
                    ),
                    AppSizedBoxes.sizedboxH15,
                    const Divider(
                      thickness: 2,
                      color: AppColors.dullWhitecolor,
                    ),
                    AppSizedBoxes.sizedboxH12,
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Delivery by Tue,Nov 22nd 2022',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider(thickness: 2),
                    AppSizedBoxes.sizedboxH8,
                    const OrderAddressWidget(
                      name: 'John luther',
                      number: '90909090',
                      pin: '909090',
                      state: 'Kerala',
                      area: 'airport road devathiyal',
                      address: 'kalluvalappil house,devathiyal',
                    ),
                    divider,
                    AppSizedBoxes.sizedboxH8,
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: GestureDetector(
                        onTap: () => values.goToHomePage(context),
                        child: Container(
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.dullWhitecolor),
                          ),
                          child: const Center(
                            child: Text('Continue Shopping'),
                          ),
                        ),
                      ),
                    ),
                    AppSizedBoxes.sizedboxH8,
                    divider,
                    AppSizedBoxes.sizedboxH15,
                    SendOrderDetails(
                      ontap: () => values.sendOrderDetials(),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
