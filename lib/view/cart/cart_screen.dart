import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/cart/widgets/address_row.dart';
import 'package:e_commerce_app/view/cart/widgets/cart_product.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
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
                    AppSizedBoxes.sizedboxH8,
                    const Divider(thickness: 1),
                    AppSizedBoxes.sizedboxH5,
                    Container(
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
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.dullWhitecolor,
                    ),
                  ),
                ),
                height: 60,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      AppSizedBoxes.sizedboxW15,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Total Amount',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('849')
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          color: AppColors.yellowColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: Text(
                            'Place Order',
                            style: TextStyle(
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      AppSizedBoxes.sizedboxW10,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
