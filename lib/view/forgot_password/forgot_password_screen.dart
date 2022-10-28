import 'package:e_commerce_app/controller/forgot_password/forgot_password_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/helper/textstyles/app_textstyles.dart';
import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:e_commerce_app/widgets/custom_button1.dart';
import 'package:e_commerce_app/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text(
            'Find your Account',
            style: AppTextStyles.appBarTextStyle,
          ),
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      height: 200,
                      width: 200,
                      image: AssetImage(
                          'assets/forgot_ password_screen_assets/start.png'),
                    ),
                    AppSizedBoxes.sizedboxH35,
                    CustomTextFormfield(
                      controller: forgotPasswordProvider.findAccountController,
                      keyboardType: TextInputType.emailAddress,
                      action: TextInputAction.done,
                      icon: Icons.mail,
                      hint: 'Email',
                      obscure: false,
                      validator: (value) => forgotPasswordProvider
                          .findAccountTextfieldValidation(value),
                    ),
                    AppSizedBoxes.sizedboxH50,
                    Consumer<ForgotPasswordProvider>(
                        builder: (context, values, _) {
                      return values.loading == true
                          ? const LoadingWidget()
                          : CustomButtonOne(
                              text: 'Continue',
                              onTap: () => values.toOtpScreen(
                                context,
                                formKey.currentState!,
                              ),
                            );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
