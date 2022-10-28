import 'dart:developer';

import 'package:e_commerce_app/controller/otp/otp_screen_controller.dart';
import 'package:e_commerce_app/controller/signUp/signup_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/helper/textstyles/app_textstyles.dart';
import 'package:e_commerce_app/model/otpscreen_enum_model.dart/otpscreen_enum.dart';
import 'package:e_commerce_app/model/signup_model/signup_model.dart';
import 'package:e_commerce_app/utils/loading_widget.dart';
import 'package:e_commerce_app/widgets/custom_button1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.model,
    required this.screenCheck,
  });

  final SignUpModel model;
  final OtpScreenEnum screenCheck;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late SignUpProvider signUpprovider;
  late OtpScreenProvider otpProvider;
  @override
  void initState() {
    log(widget.screenCheck.toString());
    if (widget.screenCheck == OtpScreenEnum.signUpOtpScreen) {
      log('singupOtp');
      signUpprovider = Provider.of<SignUpProvider>(context, listen: false);
      signUpprovider.changeTimer();
      signUpprovider.timeRemaining = 30;
    } else {
      log('forgotOtp');
      otpProvider = Provider.of<OtpScreenProvider>(context, listen: false);
      otpProvider.changeTimer();
      otpProvider.timeRemaining = 30;
    }
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
                    Text(
                      'Code has been sent to +91 ${widget.model.number?.substring(0, 2)}••••••${widget.model.number?.substring(8, 10)}',
                      style: AppTextStyles.textStyle3,
                    ),
                    AppSizedBoxes.sizedboxH50,
                    widget.screenCheck == OtpScreenEnum.signUpOtpScreen
                        ? Consumer<SignUpProvider>(
                            builder: (context, values, _) {
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
                              enabledBorderColor:
                                  AppColors.darkShadeBackgroundColor,
                              cursorColor: AppColors.dullWhitecolor,
                              focusedBorderColor: AppColors.dullWhitecolor,
                              borderWidth: 1.5,
                              clearText: values.clear == true ? true : false,
                              onSubmit: (String code) => values.setCode(code),
                            );
                          })
                        : Consumer<OtpScreenProvider>(
                            builder: (context, values, _) {
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
                              enabledBorderColor:
                                  AppColors.darkShadeBackgroundColor,
                              cursorColor: AppColors.dullWhitecolor,
                              focusedBorderColor: AppColors.dullWhitecolor,
                              borderWidth: 1.5,
                              clearText: values.clear == true ? true : false,
                              onSubmit: (String code) => values.setCode(code),
                            );
                          }),
                    AppSizedBoxes.sizedboxH35,
                    widget.screenCheck == OtpScreenEnum.signUpOtpScreen
                        ? Consumer<SignUpProvider>(
                            builder: (context, values, _) {
                            return values.timeRemaining != 0
                                ? Text(
                                    'Resend code in ${values.timeRemaining}s')
                                : TextButton(
                                    onPressed: () => values.setResendVisibility(
                                        true, context, widget.model.number),
                                    child: const Text(
                                      'Resend OTP',
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
                                    ),
                                  );
                          })
                        : Consumer<OtpScreenProvider>(
                            builder: (context, values, _) {
                            return values.timeRemaining != 0
                                ? Text(
                                    'Resend code in ${values.timeRemaining}s')
                                : TextButton(
                                    onPressed: () => values.setResendVisibility(
                                        true, context, widget.model.number),
                                    child: const Text(
                                      'Resend OTP',
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
                                    ),
                                  );
                          }),
                    AppSizedBoxes.sizedboxH50,
                    widget.screenCheck == OtpScreenEnum.signUpOtpScreen
                        ? Consumer<SignUpProvider>(
                            builder: (context, values, _) {
                            return values.loading == true
                                ? const LoadingWidget()
                                : CustomButtonOne(
                                    text: 'Verify',
                                    onTap: () => values.verifyCode(
                                        context, widget.model),
                                  );
                          })
                        : Consumer<OtpScreenProvider>(
                            builder: (context, values, _) {
                            return values.loading == true
                                ? const LoadingWidget()
                                : CustomButtonOne(
                                    text: 'Verify',
                                    onTap: () => values.verifyCode(
                                        context, widget.model),
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

  @override
  void dispose() {
    if (widget.screenCheck == OtpScreenEnum.signUpOtpScreen) {
      signUpprovider.timer!.cancel();
    } else {
      otpProvider.timer!.cancel();
    }
    super.dispose();
  }
}
