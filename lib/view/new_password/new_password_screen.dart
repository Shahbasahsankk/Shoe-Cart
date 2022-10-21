import 'package:e_commerce_app/controller/new_password/new_password_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/helper/textstyles/app_textstyles.dart';
import 'package:e_commerce_app/widgets/custom_button1.dart';
import 'package:e_commerce_app/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newPasswordProvider =
        Provider.of<NewPasswordProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          title: const Text(
            'Create New Password',
            style: AppTextStyles.appBarTextStyle,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage(
                          'assets/create_new_password_screen_assets/create_new_password.png'),
                    ),
                  ),
                  AppSizedBoxes.sizedboxH35,
                  Consumer<NewPasswordProvider>(builder: (context, values, _) {
                    return CustomTextFormfield(
                      controller: values.newPasswordController,
                      keyboardType: TextInputType.text,
                      action: TextInputAction.next,
                      icon: Icons.lock,
                      hint: 'New Password',
                      obscure: values.isVisible == false ? true : false,
                      validator: (value) => values.passwordValidation(value),
                      suffixIcon: values.isVisible == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      suffixOntap: () => values.visibility(),
                    );
                  }),
                  AppSizedBoxes.sizedboxH15,
                  CustomTextFormfield(
                    controller: newPasswordProvider.confirmPasswordController,
                    keyboardType: TextInputType.text,
                    action: TextInputAction.done,
                    icon: Icons.lock,
                    hint: 'Confirm password',  
                    obscure: false,
                    validator: (value) =>
                        newPasswordProvider.confirmPasswordValidation(value),
                  ),
                  AppSizedBoxes.sizedboxH50,
                  CustomButtonOne(
                    text: 'Continue',
                    onTap: () => newPasswordProvider.success(context),
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
