import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/utils/app_exceptions.dart';
import 'package:e_commerce_app/utils/dio_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants/api_endpoints.dart';
import '../../constants/api_url.dart';

class ProfileService {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<String?> logOutUser() async {
    final dios = await Interceptorapi().getApiUser();
    try {
      log('logout function calling');
      final token = storage.read(key: 'token');
      final refreshToken = storage.read(key: 'refreshToken');
      dios.options.headers["authorization"] = "Bearer $token";
      dios.options.headers["refresh"] = "$refreshToken";
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.logout);
      log('logout function called');

      if (response.statusCode == 200) {
        log('log out successful');
        return response.data['message'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
