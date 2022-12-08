import 'package:e_commerce_app/controller/add_new_address/add_new_address_controller.dart';
import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';
import 'custom_small_textfield.dart';

class LocationAndPincode extends StatelessWidget {
  const LocationAndPincode({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewAddressProvider>(builder: (context, values, _) {
      return values.loading == true
          ? const Center(child: LoadingWidget())
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSmallTextFormfield(
                      controller: values.pincodeController,
                      keyboardType: TextInputType.number,
                      action: TextInputAction.next,
                      hint: 'Enter pin code',
                      validator: (value) => values.pinCodeValidation(value),
                    ),
                    GestureDetector(
                      onTap: () => values.useMyLocation(),
                      child: Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.location_on_rounded),
                            Text('Use my location'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                AppSizedBoxes.sizedboxH8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSmallTextFormfield(
                      controller: values.stateController,
                      keyboardType: TextInputType.text,
                      action: TextInputAction.next,
                      hint: 'Enter state',
                      validator: (value) => values.namesHouseandAreaValiator(
                          value, 'Please enter your state'),
                    ),
                    CustomSmallTextFormfield(
                      controller: values.cityController,
                      keyboardType: TextInputType.text,
                      action: TextInputAction.next,
                      hint: 'Enter city',
                      validator: (value) => values.namesHouseandAreaValiator(
                          value, 'Please enter your city'),
                    ),
                  ],
                ),
              ],
            );
    });
  }
}