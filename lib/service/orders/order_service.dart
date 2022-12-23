import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/orders/get_all_order_model.dart';
import 'package:e_commerce_app/model/orders/place_order_model.dart';

import '../../constants/api_endpoints.dart';
import '../../constants/api_url.dart';
import '../../utils/app_exceptions.dart';
import '../../utils/dio_interceptor.dart';

class OrderServices {
  Future<List<GetOrderModel>?> getAllOrders() async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.order);
      if (response.statusCode == 200) {
        final List<GetOrderModel> ordersList = (response.data as List)
            .map((e) => GetOrderModel.fromJson(e))
            .toList();
        return ordersList;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> placeOrder(PlaceOrderModel model) async {
    log('prouduct id in place order servide function is');
    log(model.products[0].id.toString());
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
        ApiUrl.apiUrl + ApiEndPoints.order,
        data: model.toJson(),
      );
      if (response.statusCode == 201) {
        final GetOrderModel model =
            GetOrderModel.fromJson(response.data['order']);
        return model.id;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<GetOrderModel?> getSingleOrder(String orderId) async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
        "${ApiUrl.apiUrl + ApiEndPoints.order}/$orderId",
      );
      if (response.statusCode == 200) {
        log('single order got is');
        log(response.data.toString());
        final GetOrderModel model = GetOrderModel.fromJson(response.data);
        log('single model product lenght is');
        log(model.products.length.toString());
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> cancelOrder(orderId) async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.patch("${ApiUrl.apiUrl + ApiEndPoints.order}/$orderId");
      if (response.statusCode == 200) {
        return response.data['message'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
