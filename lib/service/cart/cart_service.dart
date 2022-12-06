import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/cart/add_to_cart_model.dart';
import 'package:e_commerce_app/model/cart/get_from_cart_model.dart';

import '../../constants/api_endpoints.dart';
import '../../constants/api_url.dart';
import '../../utils/app_exceptions.dart';
import '../../utils/dio_interceptor.dart';

class CartService {
  Future<GetFromCartModel?> getCartItems() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.cart);
      if (response.statusCode == 200) {
        final GetFromCartModel model = GetFromCartModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> addToCart(AddToCartModel model) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
          ApiUrl.apiUrl + ApiEndPoints.cart,
          data: jsonEncode(model.toJson()));
      if (response.statusCode == 201) {
        final String resp = response.data['message'];
        return resp;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> removeFromCart(String productId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.patch(
        ApiUrl.apiUrl + ApiEndPoints.cart,
        data: {'product': productId},
      );
      if (response.statusCode == 201) {
        final String resp = response.data['message'];
        return resp;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
