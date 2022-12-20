import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/api_endpoints.dart';
import 'package:e_commerce_app/constants/api_queryparameters.dart';
import 'package:e_commerce_app/constants/api_url.dart';
import 'package:e_commerce_app/utils/app_exceptions.dart';

class OtpService {
  final dio = Dio();
  Future<String?> verifyOtp(email, otpNumber) async {
    try {
      Response response =
          await dio.post(ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
              data: {
                'otp': otpNumber,
                'email': email,
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

  Future<String?> sendOtp(email) async {
    try {
      Response response = await dio.get(
        ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
        queryParameters: {
          'email': email,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['message'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
