import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/api_queryparameters.dart';
import 'package:e_commerce_app/utils/app_exceptions.dart';
import '../../model/signup_model/signup_model.dart';

class OtpService {
  // const url = ApiUrl.apiUrl + ApiEndPoints.otp;
  final dio = Dio();
  Future<bool> verifyOtp(SignUpModel model, context, otpNumber) async {
    try {
      Response<dynamic> response =
          await dio.post('http://192.168.0.201:5001/api/v1/auth/otp',
              data: {
                'otp': otpNumber,
                'email': model.number,
              },
              queryParameters: ApiQueryParameter.queryParameter);
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('otp verify successfull');
        return true;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return false;
  }

  Future<bool> sendOtp(context, phone) async {
    try {
      Response<dynamic> response = await dio.get(
        'http://192.168.0.201:5001/api/v1/auth/otp',
        queryParameters: {
          'phone': phone,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.statusCode.toString());
        return true;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return false;
  }
}
