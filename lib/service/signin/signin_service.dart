import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/api_endpoints.dart';
import 'package:e_commerce_app/constants/api_queryparameters.dart';
import 'package:e_commerce_app/constants/api_url.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/login_model/login_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/utils/app_exceptions.dart';
import 'package:e_commerce_app/utils/app_toast.dart';
import 'package:flutter/cupertino.dart';

import '../../model/signup_model/signup_model.dart';
import '../../view/signup/widgets/signup_arguement_model.dart';

class SignInService {
  final dio = Dio();
  Future<void> login(context, LoginModel model) async {
    try {
      Response<Map<String, dynamic>> response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.login,
        queryParameters: ApiQueryParameter.queryParameter,
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode! == 200) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false)
            .then((value) =>
                AppToast.showToast('Login successfull', AppColors.greenColor));
      }
      if (response.statusCode == 201) {
        final args = SignUpOtpArguementModel(
            model: SignUpModel.fromJson(response.data!));
        Navigator.of(context).pushNamed(RouteNames.otpScreen, arguments: args);
        AppToast.showToast('Verify your account to login', AppColors.redColor);
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
  }
}
