import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormfield extends StatelessWidget {
  const CustomTextFormfield({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.action,
    required this.icon,
    required this.hint,
    required this.obscure,
    required this.validator,
    this.suffixOntap,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction action;
  final IconData icon;
  final String hint;
  final bool obscure;
  final String? Function(String?)? validator;
  final void Function()? suffixOntap;
  final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: action,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: AppColors.lightDarkBackgroundColor,
        filled: true,
        prefixIcon: Icon(icon,color: AppColors.whiteColor,),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.whiteColor),
        suffixIcon: IconButton(
          onPressed: suffixOntap,
          icon: Icon(suffixIcon,color: AppColors.whiteColor,),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: obscure,
    );
  }
}
