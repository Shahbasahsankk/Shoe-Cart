import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/api_endpoints.dart';
import 'package:e_commerce_app/constants/api_queryparameters.dart';
import 'package:e_commerce_app/constants/api_url.dart';
import 'package:e_commerce_app/model/login_model/login_model.dart';
import 'package:e_commerce_app/utils/app_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../model/signup_model/signup_model.dart';

class SignInService {
  final dio = Dio();
  Future<SignUpModel?> login(LoginModel model) async {
    try {
      Response<Map<String, dynamic>> response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.login,
        queryParameters: ApiQueryParameter.queryParameter,
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final SignUpModel model = SignUpModel.fromJson(response.data!);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<GoogleSignInAccount?> googleSignIn(GoogleSignIn googleSignIn) async {
    try {
      final result = await googleSignIn.signIn();
      return result;
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
