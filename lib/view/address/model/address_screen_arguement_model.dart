import 'package:e_commerce_app/model/order_summary/order_summary_screen_enum.dart';

class AddressScreenArguementModel {
  final OrderSummaryScreenEnum screenCheck;
  final String? cartId;
  final String? productId;
  AddressScreenArguementModel({
    required this.screenCheck,
    this.cartId,
    this.productId,
  });
}
