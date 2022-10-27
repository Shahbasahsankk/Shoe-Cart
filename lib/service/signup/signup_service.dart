import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/api_endpoints.dart';
import 'package:e_commerce_app/constants/api_url.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/signup_model/signup_model.dart';
import 'package:e_commerce_app/utils/app_exceptions.dart';
import 'package:e_commerce_app/utils/app_toast.dart';
import 'package:flutter/material.dart';

import '../../routes/rout_names.dart';

class SignUpService {
  final dio = Dio();
  Future<void> signUp(SignUpModel model, context) async {
    try {
      Response<Map<String, dynamic>> response = await dio.post(
          ApiUrl.apiUrl + ApiEndPoints.signUp,
          data: jsonEncode(model.toJson()),
          queryParameters: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('saved to database');
        await Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.bottomNav, ((route) => false));
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
  }

  Future<bool> checkUser(email) async {
    try {
      Response response = await dio.get(
        ApiUrl.apiUrl + ApiEndPoints.usercheck,
        queryParameters: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        log('user already exists');
        AppToast.showToast('User already exists', AppColors.redColor);
        return false;
      } else if (response.statusCode == 201) {
        log('no user found');
        return true;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return false;
  }
}
