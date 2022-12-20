import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/api_queryparameters.dart';
import 'package:e_commerce_app/model/signup_model/signup_model.dart';

import '../../constants/api_endpoints.dart';
import '../../constants/api_url.dart';
import '../../utils/app_exceptions.dart';

class ForgotPasswordService {
  final dio = Dio();
  Future<SignUpModel?> getUser(email) async {
    try {
      Response response = await dio.get(
        ApiUrl.apiUrl + ApiEndPoints.usercheck,
        queryParameters: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        final SignUpModel model = SignUpModel.fromJson(response.data!);
        return model;
      } else if (response.statusCode == 201) {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> changePassword(email, newPassword) async {
    try {
      Response response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.forgetPassword,
        data: {
          'email': email,
          'password': newPassword,
        },
        queryParameters: ApiQueryParameter.queryParameter,
      );
      if (response.statusCode == 202) {
        return response.data['message'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
