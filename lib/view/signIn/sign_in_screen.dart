import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/signIn/sign_in_controller.dart';
import '../../helper/colors/app_colors.dart';
import '../../helper/sizedboxes/app_sizedboxes.dart';
import '../../helper/textstyles/app_textstyles.dart';
import '../../widgets/custom_button1.dart';
import '../../widgets/custom_textformfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context, listen: false);
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
                    'Login to your\nAccount',
                    style: AppTextStyles.textStyle1,
                  ),
                  AppSizedBoxes.sizedboxH35,
                  CustomTextFormfield(
                    controller: signInProvider.emailController,
                    keyboardType: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    icon: Icons.mail,
                    hint: 'Email',
                    obscure: false,
                    validator: (value) => signInProvider.emailValidation(value),
                  ),
                  AppSizedBoxes.sizedboxH8,
                  Consumer<SignInProvider>(builder: (context, values, _) {
                    return CustomTextFormfield(
                      controller: signInProvider.passwordController,
                      keyboardType: TextInputType.text,
                      action: TextInputAction.next,
                      icon: Icons.lock,
                      hint: 'Password',
                      obscure: values.isNotVisible,
                      validator: (value) =>
                          signInProvider.passwordValidation(value),
                      suffixIcon: values.isNotVisible == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      suffixOntap: () => signInProvider.passwordHide(),
                    );
                  }),
                  AppSizedBoxes.sizedboxH35,
                  Consumer<SignInProvider>(builder: (context, values, _) {
                    return values.loading == true
                        ? const LoadingWidget()
                        : CustomButtonOne(
                            text: 'Sign In',
                            onTap: () => values.login(context));
                  }),
                  AppSizedBoxes.sizedboxH20,
                  Center(
                    child: TextButton(
                      onPressed: () =>
                          signInProvider.toForgotPasswordScreen(context),
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  AppSizedBoxes.sizedboxH35,
                  AppSizedBoxes.sizedboxH35,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                      TextButton(
                        onPressed: () => signInProvider.toSignUpScreen(context),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
