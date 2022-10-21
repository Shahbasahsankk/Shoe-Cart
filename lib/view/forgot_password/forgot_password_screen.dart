import 'package:e_commerce_app/controller/forgot_password/forgot_password_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/helper/textstyles/app_textstyles.dart';
import 'package:e_commerce_app/view/forgot_password/widgets/custum_container.dart';
import 'package:e_commerce_app/widgets/custom_button1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider= Provider.of<ForgotPasswordProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          title: const Text(
            'Forgot Password',
            style: AppTextStyles.appBarTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                height: 200,
                width: 200,
                image: AssetImage(
                    'assets/forgot_ password_screen_assets/start.png'),
              ),
              const Text(
                'A code will be sent to the number below',
                style: TextStyle(fontSize: 16),
              ),
              AppSizedBoxes.sizedboxH20,
              const CustomContainer(),
              AppSizedBoxes.sizedboxH50,
              CustomButtonOne(text: 'Continue', onTap: ()=>forgotPasswordProvider.toOtpScreen(context))
            ],
          ),
        ),
      ),
    );
  }
}
