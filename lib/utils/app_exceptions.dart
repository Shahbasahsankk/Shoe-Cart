import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/utils/app_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../widgets/navigator_key_class.dart';

class AppExceptions {
  static void errorHandler(Object e) {
    if (e is PlatformException) {
      AppToast.showToast('Platform Error Occured', AppColors.redColor);
    }
    if (e is SocketException) {
      AppToast.showToast('No Internet Connection', AppColors.redColor);
    } else if (e is TimeoutException) {
      AppToast.showToast('Connection Timedout', AppColors.redColor);
    } else if (e is MissingPluginException) {
      AppToast.showToast('Plugin error occured', AppColors.redColor);
    } else if (e is DioError) {
      if (e.response?.statusCode == 403 &&
          e.response?.data['message'] == 'forbidden') {
        Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
      }
      if (e.response?.data['message'] != null) {
        AppToast.showToast(
            e.response!.data['message'].toString(), AppColors.redColor);
      } else if (e.type == DioErrorType.connectTimeout) {
        AppToast.showToast('Connection timedout', AppColors.redColor);
      } else if (e.type == DioErrorType.receiveTimeout) {
        AppToast.showToast('Response timedout', AppColors.redColor);
      } else if (e.type == DioErrorType.cancel) {
        AppToast.showToast('Request cancelled', AppColors.redColor);
      } else if (e.type == DioErrorType.sendTimeout) {
        AppToast.showToast('Request timedout', AppColors.redColor);
      } else if (e.error is SocketException) {
        AppToast.showToast('No Internet Connection', AppColors.redColor);
      } else if (e.type == DioErrorType.other) {
        AppToast.showToast('Something went wrong', AppColors.redColor);
      }
    }
  }
}
