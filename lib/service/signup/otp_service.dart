import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../model/signup_model/signup_model.dart';
import '../../routes/rout_names.dart';

class OtpService {
  Future<void> verifyOtp(SignUpModel model, context, otpNumber) async {
    final dio = Dio();
    // const url = ApiUrl.apiUrl + ApiEndPoints.verifyOtp;

    try {
      Response<dynamic> response = await dio
          .post('http://192.168.0.201:5000/api/v1/auth/verifyOtp', data: {
        "newUser": json.encode(model.toJson()),
        "otp": otpNumber,
      }, queryParameters: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.bottomNav, ((route) => false));
        Fluttertoast.showToast(
            msg: 'SignUp successfull', backgroundColor: AppColors.greenColor);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.redColor,
      );
    }
  }
}
