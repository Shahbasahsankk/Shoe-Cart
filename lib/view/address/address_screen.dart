import 'package:e_commerce_app/controller/address/address_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/view/address/widgets/address_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/sizedboxes/app_sizedboxes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider =
        Provider.of<AddressProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('Select Address'),
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Divider(thickness: 1),
                    AppSizedBoxes.sizedboxH5,
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.black54,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.add_sharp,
                            size: 28,
                            color: AppColors.blueColor,
                          ),
                          AppSizedBoxes.sizedboxW5,
                          Text(
                            'Add a new address',
                            style: TextStyle(
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    AppSizedBoxes.sizedboxH12,
                    const AddressContainer(
                      name: 'John Wick',
                      addressType: 'Home',
                      address:
                          'Willington House, Cambridge Square, London city, United Kingdom, 674567',
                      phone: '9078563412',
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () => addressProvider.toOrderSummaryScreen(context),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  color: AppColors.redColor,
                  child: const Center(
                      child: Text(
                    'DELIVER HERE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
