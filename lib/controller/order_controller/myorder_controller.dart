import 'package:e_commerce_app/model/orders/get_all_order_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/orders/order_service.dart';
import 'package:e_commerce_app/view/order_detials_screen/model/order_detail_argument_model.dart';
import 'package:flutter/cupertino.dart';

class MyOrdersProvider with ChangeNotifier {
  MyOrdersProvider() {
    startLoading();
  }
  List<GetOrderModel>? ordersList;
  bool loading = false;
  GetOrderModel? singleModel;

  void getAllOrders() async {
    await OrderServices().getAllOrders().then((value) {
      if (value != null) {
        ordersList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  String formatDate(String date) {
    final a = date.split(' ');
    return a[0];
  }

  void getSingleOrder(String orderId) async {
    await OrderServices().getSingleOrder(orderId).then((value) {
      if (value != null) {
        singleModel = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void closeOrderPlacedScreen(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
  }

  void goToOrderDetialsScreen(context) {
    Navigator.of(context).pushReplacementNamed(RouteNames.orderDetailsScreen);
  }

  void gotoOrderDetailsFromOrderScreen(
      BuildContext context, String orderId, int index) {
    final OrderDetailsArguementModel args =
        OrderDetailsArguementModel(orderIndex: index, orderId: orderId);
    Navigator.of(context)
        .pushNamed(RouteNames.orderDetailsScreen, arguments: args);
  }

  void goToHomePage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.bottomNav, (route) => false);
  }

  void sendOrderDetials() {}
}
