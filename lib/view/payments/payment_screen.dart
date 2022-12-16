import 'package:e_commerce_app/controller/payments/payments_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/view/payments/widgets/payment_options.dart';
import 'package:e_commerce_app/view/payments/widgets/payment_pricedetails.dart';
import 'package:e_commerce_app/widgets/custom_bottom_placeorderwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../helper/sizedboxes/app_sizedboxes.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.totalAmount,
    required this.itemCount,
  });

  final String totalAmount;
  final String itemCount;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late PaymentProvider paymentProvider;
  @override
  void initState() {
    paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    final razorpay = paymentProvider.razorPay;
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, paymentProvider.handlePaymentSuccess);
    razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR, paymentProvider.handlePaymentError);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET, paymentProvider.handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      paymentProvider.setTotalAmount(widget.totalAmount);
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('Payments'),
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Divider(thickness: 1),
              AppSizedBoxes.sizedboxH15,
              const Text(
                'Payment options',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              AppSizedBoxes.sizedboxH12,
              Consumer<PaymentProvider>(
                builder: (context, values, _) {
                  return PaymentOptions(paymentProvider: values);
                },
              ),
              AppSizedBoxes.sizedboxH12,
              const Divider(thickness: 4),
              PaymentPriceDetails(
                itemCount: widget.itemCount.toString(),
                amountPayable: widget.totalAmount,
                deliveryCharge: 'Free',
              ),
              const Spacer(),
              Consumer<PaymentProvider>(builder: (context, values, _) {
                return values.isVisible == true
                    ? Container(
                        height: 15,
                        width: double.infinity,
                        color: AppColors.whiteColor,
                        child: const Center(
                          child: Text(
                            '100% Safe and Secure Payments',
                            style: TextStyle(color: AppColors.blackcolor),
                          ),
                        ),
                      )
                    : const SizedBox();
              }),
              CustomBottomPlaceOrderWidget(
                ontap: () => paymentProvider.order(context),
                totalAmount: widget.totalAmount,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    paymentProvider.razorPay.clear();
    super.dispose();
  }
}
