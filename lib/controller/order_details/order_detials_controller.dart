import 'package:e_commerce_app/model/orders/get_all_order_model.dart';
import 'package:e_commerce_app/service/orders/order_service.dart';
import 'package:flutter/material.dart';

class OrderDetailsProvider with ChangeNotifier {
  OrderDetailsProvider() {
    startLoading();
  }
  bool loading = false;
  GetOrderModel? orderModel;
  String? orderedDate;
  String? deliveredDate;

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void setDates() {
    final a = orderModel!.orderDate.toString().split(' ');
    final b = orderModel!.deliveryDate.toString().split(' ');
    orderedDate = a[0];
    deliveredDate = b[0];
    notifyListeners();
  }

  void getSingleOrder(String orderId) async {
    loading = true;
    notifyListeners();
    await OrderServices().getSingleOrder(orderId).then((value) {
      if (value != null) {
        orderModel = value;
        notifyListeners();
        setDates();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
