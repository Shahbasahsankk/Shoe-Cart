import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/signup_model/signup_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../view/signup/widgets/signup_arguement_model.dart';

class SignUpService {
  Future<void> signUp(SignUpModel model, context) async {
    final dio = Dio();
    // const url = ApiUrl.apiUrl + ApiEndPoints.signUp;

    try {
      Response<Map<String,dynamic>> response = await dio.post(
          'http://192.168.0.201:5000/api/v1/auth/signup',
          data: jsonEncode(model.toJson()),
          queryParameters: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.toString());
        final args = SignUpOtpArguementModel(
            model: SignUpModel.fromJson(response.data!));
        Navigator.of(context).pushNamed(RouteNames.signUpOtp, arguments: args);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.redColor,
      );
    }
  }
}
