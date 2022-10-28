import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/utils/app_toast.dart';

class AppExceptions {
  static void errorHandler(Object e) {
    if (e is DioError) {
      if (e.response?.data['message'] != null) {
        AppToast.showToast(
            e.response!.data['message'].toString(), AppColors.redColor);
      } else if (e.type == DioErrorType.connectTimeout) {
        AppToast.showToast('Connection timedout', AppColors.redColor);
      } else if (e.type == DioErrorType.receiveTimeout) {
        AppToast.showToast('Recieve timedout', AppColors.redColor);
      } else if (e.type == DioErrorType.cancel) {
        AppToast.showToast('Request cancelled', AppColors.redColor);
      } else if (e.type == DioErrorType.sendTimeout) {
        AppToast.showToast('Sending timedout', AppColors.redColor);
      } else if (e.type == DioErrorType.other) {
        AppToast.showToast('No internet connection', AppColors.redColor);
      }
    }
  }
}
