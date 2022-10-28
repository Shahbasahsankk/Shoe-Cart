import 'package:e_commerce_app/controller/new_password/new_password_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/helper/textstyles/app_textstyles.dart';
import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessDialouge extends StatelessWidget {
  const SuccessDialouge({super.key});
  @override
  Widget build(BuildContext context) {
    final newPasswordProvider =
        Provider.of<NewPasswordProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      newPasswordProvider.toSignInScreen(context);
    });
    return Dialog(
      backgroundColor: AppColors.transparentColor,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.welcomeScreenBgColor,
          ),
          width: 300,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage(
                    'assets/create_new_password_screen_assets/password_reset_success.png'),
              ),
              Text('Success!', style: AppTextStyles.textStyle2),
              AppSizedBoxes.sizedboxH12,
              Text('You will be redirected to the\nHome page in a\nfew seconds',
                  textAlign: TextAlign.center, style: AppTextStyles.textStyle3),
              AppSizedBoxes.sizedboxH20,
              LoadingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
