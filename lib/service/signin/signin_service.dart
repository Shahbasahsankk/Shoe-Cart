import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/api_endpoints.dart';
import 'package:e_commerce_app/constants/api_queryparameters.dart';
import 'package:e_commerce_app/constants/api_url.dart';
import 'package:e_commerce_app/model/login_model/login_model.dart';
import 'package:e_commerce_app/model/signin_model/signin_model.dart';
import 'package:e_commerce_app/utils/app_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInService {
  final dio = Dio();
  Future<SignInModel?> login(LoginModel model) async {
    try {
      Response response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.login,
        queryParameters: ApiQueryParameter.queryParameter,
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final SignInModel model = SignInModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> googleSignIn(GoogleSignIn googleSignIn) async {
    try {
      final result = await googleSignIn.signIn();
      Response response =
          await dio.post(ApiUrl.apiUrl + ApiEndPoints.googleSignIn, data: {
        'email': result?.email,
        'name': result?.displayName,
      });
      if (response.statusCode == 201) {
        return response.data['message'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
