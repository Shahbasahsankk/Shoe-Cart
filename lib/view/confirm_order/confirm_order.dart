import 'package:e_commerce_app/controller/confirm_order/confirm_order_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmOrderScreen extends StatelessWidget {
  ConfirmOrderScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final confirmOrderProvider =
        Provider.of<ConfirmOrderProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('Verification'),
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppSizedBoxes.sizedboxH50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<ConfirmOrderProvider>(
                        builder: (context, values, _) {
                      return Text(
                        values.captcha.toString(),
                        style: const TextStyle(
                            fontSize: 40,
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.bold),
                      );
                    }),
                    IconButton(
                      onPressed: () => confirmOrderProvider.generateCaptcha(),
                      icon: const Icon(
                        Icons.refresh,
                        color: AppColors.blueColor,
                      ),
                    ),
                  ],
                ),
                AppSizedBoxes.sizedboxH12,
                SizedBox(
                  width: 170,
                  child: TextFormField(
                    validator: (value) =>
                        confirmOrderProvider.captchaValidation(value),
                    controller: confirmOrderProvider.captchaController,
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter the characters',
                    ),
                  ),
                ),
                AppSizedBoxes.sizedboxH35,
                GestureDetector(
                  onTap: () => confirmOrderProvider.toOrderScreen(
                      context, formKey.currentState!),
                  child: Container(
                    height: 50,
                    width: 270,
                    color: AppColors.redColor,
                    child: const Center(
                      child: Text(
                        'Confirm Order',
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
