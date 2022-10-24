import 'package:e_commerce_app/controller/forgot_password/forgot_password_controller.dart';
import 'package:e_commerce_app/widgets/custom_button1.dart';
import 'package:e_commerce_app/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetMethod extends StatelessWidget {
  const ResetMethod({super.key});
  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
      actions: [
        CustomButtonOne(
          text: 'Continue',
          onTap: () => forgotPasswordProvider.toOtpScreen(context),
        ),
      ],
      content: CustomTextFormfield(
        controller: forgotPasswordProvider.resetController,
        keyboardType: forgotPasswordProvider.isMailSelected == true
            ? TextInputType.emailAddress
            : TextInputType.number,
        action: TextInputAction.done,
        icon: forgotPasswordProvider.isMailSelected == true
            ? Icons.mail
            : Icons.numbers,
        hint: forgotPasswordProvider.isMailSelected == true
            ? 'Email Address'
            : 'Mobile Number',
        obscure: false,
        validator: forgotPasswordProvider.isMailSelected == true
            ? (value) => forgotPasswordProvider.mailValidation(value)
            : (value) => forgotPasswordProvider.numberValidation(value),
      ),
    );
  }
}
