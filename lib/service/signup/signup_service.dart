import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/api_endpoints.dart';
import 'package:e_commerce_app/constants/api_url.dart';
import 'package:e_commerce_app/model/signup_model/signup_model.dart';
import 'package:e_commerce_app/utils/app_exceptions.dart';

class SignUpService {
  final dio = Dio();
  Future<String?> signUp(SignUpModel model, context) async {
    try {
      Response response = await dio.post(ApiUrl.apiUrl + ApiEndPoints.signUp,
          data: jsonEncode(model.toJson()),
          queryParameters: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final String token = response.data;
        return token;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
