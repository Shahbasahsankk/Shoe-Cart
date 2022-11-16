import 'package:e_commerce_app/controller/add_new_address/add_new_address_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/add_address/widgets/address_type_widget.dart';
import 'package:e_commerce_app/view/add_address/widgets/location_and_pincode.dart';
import 'package:e_commerce_app/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AddNewAddressProvider addNewAddressProvider =
        Provider.of<AddNewAddressProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('Add delivery address'),
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSizedBoxes.sizedboxH8,
                  CustomTextFormfield(
                    controller: addNewAddressProvider.fullNameController,
                    keyboardType: TextInputType.name,
                    action: TextInputAction.next,
                    icon: Icons.person,
                    hint: 'Full Name(Required)',
                    obscure: false,
                    validator: (value) =>
                        addNewAddressProvider.namesHouseandAreaValiator(
                      value,
                      'Please enter your first name',
                    ),
                  ),
                  AppSizedBoxes.sizedboxH8,
                  CustomTextFormfield(
                    controller: addNewAddressProvider.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    action: TextInputAction.next,
                    icon: Icons.phone,
                    hint: 'Phone Number(Required)',
                    obscure: false,
                    validator: (value) =>
                        addNewAddressProvider.phoneNumberValidator(value),
                  ),
                  AppSizedBoxes.sizedboxH20,
                  const LocationAndPincode(),
                  AppSizedBoxes.sizedboxH20,
                  CustomTextFormfield(
                    controller:
                        addNewAddressProvider.houseAndBuildingController,
                    keyboardType: TextInputType.streetAddress,
                    action: TextInputAction.next,
                    icon: Icons.house,
                    hint: 'House No., Building Name (Required)',
                    obscure: false,
                    validator: (value) =>
                        addNewAddressProvider.namesHouseandAreaValiator(
                      value,
                      'Please add your house no, building name',
                    ),
                  ),
                  AppSizedBoxes.sizedboxH8,
                  CustomTextFormfield(
                    controller:
                        addNewAddressProvider.roadNameAreaColonyController,
                    keyboardType: TextInputType.streetAddress,
                    action: TextInputAction.done,
                    icon: Icons.bungalow_outlined,
                    hint: 'Road name, Area, Colony(Required)',
                    obscure: false,
                    validator: (value) =>
                        addNewAddressProvider.namesHouseandAreaValiator(
                      value,
                      'Please add your road name,area',
                    ),
                  ),
                  AppSizedBoxes.sizedboxH20,
                  const Text('Type of address'),
                  AppSizedBoxes.sizedboxH8,
                  const AddressTypeWidget(),
                  AppSizedBoxes.sizedboxH20,
                  GestureDetector(
                    onTap: () => addNewAddressProvider.saveAddress(
                        formKey.currentState!, context),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(child: Text('Save Address')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
