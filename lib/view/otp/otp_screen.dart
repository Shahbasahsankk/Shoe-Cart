import 'package:e_commerce_app/controller/otp/otp_screen_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/helper/textstyles/app_textstyles.dart';
import 'package:e_commerce_app/widgets/custom_button1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OtpScreenProvider otpProvider;
  @override
  void initState() {
    otpProvider = Provider.of<OtpScreenProvider>(context, listen: false);
    otpProvider.changeTimer();
    otpProvider.timeRemaining=30;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          title: const Text(
            'OTP Verifiction',
            style: AppTextStyles.appBarTextStyle,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Code has been sent to +91 99••••••89',
                      style: AppTextStyles.textStyle3,
                    ),
                    AppSizedBoxes.sizedboxH50,
                    Consumer<OtpScreenProvider>(builder: (context, values, _) {
                      return OtpTextField(
                        numberOfFields: 4,
                        showFieldAsBox: true,
                        fillColor: AppColors.lightDarkBackgroundColor,
                        filled: true,
                        fieldWidth: 70,
                        borderRadius: BorderRadius.circular(15),
                        autoFocus: true,
                        borderColor: AppColors.dullWhitecolor,
                        disabledBorderColor: AppColors.transparentColor,
                        enabledBorderColor: AppColors.darkShadeBackgroundColor,
                        cursorColor: AppColors.dullWhitecolor,
                        focusedBorderColor: AppColors.dullWhitecolor,
                        borderWidth: 1.5,
                        clearText: values.clear == true ? true : false,
                        onSubmit: (String code) => otpProvider.setCode(code),
                      );
                    }),
                    AppSizedBoxes.sizedboxH35,
                    Consumer<OtpScreenProvider>(builder: (context, values, _) {
                      return values.timeRemaining != 0
                          ? Text('Resend code in ${values.timeRemaining}s')
                          : TextButton(
                              onPressed: () => values.setResendVisibility(true),
                              child: const Text(
                                'Resend OTP',
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            );
                    }),
                    AppSizedBoxes.sizedboxH50,
                    CustomButtonOne(
                      text: 'Verify',
                      onTap: () => otpProvider.verifyCode(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpProvider.timer!.cancel();
    super.dispose();
  }
}
