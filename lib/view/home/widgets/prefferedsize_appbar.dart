import 'package:e_commerce_app/controller/home/home_screen_controller.dart';
import 'package:e_commerce_app/view/home/widgets/shoe_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/sizedboxes/app_sizedboxes.dart';
import '../../../widgets/custom_textformfield.dart';

class PrefferedSizeAppBarWidget extends StatelessWidget {
  const PrefferedSizeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 8),
      child: Column(
        children: [
          const ShoeCart(),
          AppSizedBoxes.sizedboxH8,
          CustomTextFormfield(
            controller: homeProvider.controller,
            keyboardType: TextInputType.emailAddress,
            action: TextInputAction.done,
            icon: Icons.search,
            hint: 'Search for products',
            obscure: false,
            validator: (value) {
              return 'yaa';
            },
          ),
        ],
      ),
    );
  }
}
