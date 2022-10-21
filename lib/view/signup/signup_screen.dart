import 'package:e_commerce_app/controller/signUp/signup_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/helper/textstyles/app_textstyles.dart';
import 'package:e_commerce_app/widgets/custom_button1.dart';
import 'package:e_commerce_app/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create your\nAccount',
                    style: AppTextStyles.textStyle1,
                  ),
                  AppSizedBoxes.sizedboxH35,
                  CustomTextFormfield(
                    controller: signUpProvider.nameController,
                    keyboardType: TextInputType.name,
                    action: TextInputAction.next,
                    icon: Icons.person,
                    hint: 'Full name',
                    obscure: false,
                    validator: (value) => signUpProvider.nameValidation(value),
                  ),
                  AppSizedBoxes.sizedboxH8,
                  CustomTextFormfield(
                    controller: signUpProvider.emailController,
                    keyboardType: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    icon: Icons.mail,
                    hint: 'Email',
                    obscure: false,
                    validator: (value) => signUpProvider.emailValidation(value),
                  ),
                  AppSizedBoxes.sizedboxH8,
                  Consumer<SignUpProvider>(builder: (context, values, _) {
                    return CustomTextFormfield(
                      controller: signUpProvider.passwordController,
                      keyboardType: TextInputType.text,
                      action: TextInputAction.next,
                      icon: Icons.lock,
                      hint: 'Password',
                      obscure: values.isNotVisible,
                      validator: (value) =>
                          signUpProvider.passwordValidation(value),
                      suffixIcon: values.isNotVisible == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      suffixOntap: () => signUpProvider.passwordHide(),
                    );
                  }),
                  AppSizedBoxes.sizedboxH8,
                  Consumer<SignUpProvider>(builder: (context, values, _) {
                    return CustomTextFormfield(
                      controller: signUpProvider.confirmPasswordController,
                      keyboardType: TextInputType.text,
                      action: TextInputAction.done,
                      icon: Icons.lock,
                      hint: 'Confirm password',
                      obscure: false,
                      validator: (value) =>
                          signUpProvider.confirmPasswordValidation(value),
                    );
                  }),
                  AppSizedBoxes.sizedboxH35,
                  CustomButtonOne(
                    text: 'Sign Up',
                    onTap: () => signUpProvider.toBottonNav(context),
                  ),
                  AppSizedBoxes.sizedboxH35,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
