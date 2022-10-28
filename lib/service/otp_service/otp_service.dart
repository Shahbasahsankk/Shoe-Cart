import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/api_endpoints.dart';
import 'package:e_commerce_app/constants/api_queryparameters.dart';
import 'package:e_commerce_app/constants/api_url.dart';
import 'package:e_commerce_app/utils/app_exceptions.dart';

class OtpService {
  final dio = Dio();
  Future<String?> verifyOtp(number, context, otpNumber) async {
    try {
      Response response =
          await dio.post(ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
              data: {
                'otp': otpNumber,
                'email': number,
              },
              queryParameters: ApiQueryParameter.queryParameter);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['status'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> sendOtp(phone) async {
    try {
      log('entered to send otp');
      Response response = await dio.get(
        ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
        queryParameters: {
          'phone': phone,
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('entered create');
        return response.data['status'];
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
