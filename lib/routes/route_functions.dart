import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/view/add_address/model/addaddress_arguement_model.dart';
import 'package:e_commerce_app/view/address/address_screen.dart';
import 'package:e_commerce_app/view/address/model/address_screen_arguement_model.dart';
import 'package:e_commerce_app/view/cart/cart_screen.dart';
import 'package:e_commerce_app/view/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce_app/view/home/home_screen.dart';
import 'package:e_commerce_app/view/home/model/product_collection_model.dart';
import 'package:e_commerce_app/view/home/widgets/products_collection_screen.dart';
import 'package:e_commerce_app/view/new_password/new_password_screen.dart';
import 'package:e_commerce_app/view/new_password/model/newpassword_screen_model.dart';
import 'package:e_commerce_app/view/onBoard/on_board_screen.dart';
import 'package:e_commerce_app/view/order_detials_screen/model/order_detail_argument_model.dart';
import 'package:e_commerce_app/view/order_detials_screen/order_details.dart';
import 'package:e_commerce_app/view/order_summery/model/order_summery_argument_model.dart';
import 'package:e_commerce_app/view/order_summery/order_summery.dart';
import 'package:e_commerce_app/view/orders/model/order_placed_screen_arguement_model.dart';
import 'package:e_commerce_app/view/orders/myorders_screen.dart';
import 'package:e_commerce_app/view/orders/widgets/order_placed_screen.dart';
import 'package:e_commerce_app/view/otp/otp_screen.dart';
import 'package:e_commerce_app/view/payments/model/payment_screen_arguement_model.dart';
import 'package:e_commerce_app/view/payments/payment_screen.dart';
import 'package:e_commerce_app/view/product_screen/product_screen.dart';
import 'package:e_commerce_app/view/product_screen/widgets/utils/prouductid_model.dart';
import 'package:e_commerce_app/view/search/search_screen.dart';
import 'package:e_commerce_app/view/signIn/sign_in_screen.dart';
import 'package:e_commerce_app/view/signup/signup_screen.dart';
import 'package:e_commerce_app/view/welcome/welcome_screen.dart';
import 'package:e_commerce_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../view/add_address/add_new_address_screen.dart';
import '../view/otp/model/otp_screen_arguement_model.dart';
import '../view/splash/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case RouteNames.onBoardScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardScreen(),
        );
      case RouteNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case RouteNames.signInScreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
        );
      case RouteNames.bottomNav:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case RouteNames.findMyAccount:
        return MaterialPageRoute(
          builder: (context) => ForgotPassword(),
        );
      case RouteNames.otpScreen:
        final args = settings.arguments as OtpArguementModel;
        return MaterialPageRoute(
            builder: (context) => OtpScreen(
                  model: args.model,
                  screenCheck: args.checkScreen,
                ));
      case RouteNames.newPasswordScreen:
        final args = settings.arguments as NewPasswordScreenArguementsModel;
        return MaterialPageRoute(
          builder: (context) => NewPasswordScreen(
            model: args.model,
          ),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.cartScreen:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      case RouteNames.productCollections:
        final args = settings.arguments as ProductCollectionScreenModel;
        return MaterialPageRoute(
          builder: (context) => ProductCollectionScreen(
            category: args.category,
            categoryId: args.categoryId,
          ),
        );
      case RouteNames.productScreen:
        final args = settings.arguments as ProductIdModel;
        return MaterialPageRoute(
          builder: (context) => ProductViewScreen(
            productId: args.productId,
          ),
        );
      case RouteNames.paymentScreen:
        final args = settings.arguments as PaymentScreenArguementModel;
        return MaterialPageRoute(
          builder: (context) => PaymentScreen(
            itemCount: args.itemCount,
            totalAmount: args.totalAmount,
            productIds: args.productIds,
            addressId: args.addressId,
          ),
        );
      case RouteNames.addressScreen:
        final args = settings.arguments as AddressScreenArguementModel;
        return MaterialPageRoute(
          builder: (context) => AddressScreen(
            screenCheck: args.screenCheck,
            cartId: args.cartId,
            productId: args.productId,
            visibility: args.visibility,
          ),
        );
      case RouteNames.addNewAddressScreen:
        final args = settings.arguments as AddNewAddressArguemnetModel;
        return MaterialPageRoute(
          builder: (context) => AddNewAddressScreen(
            addressScreenCheck: args.addressScreenCheck,
            addressId: args.addressId,
          ),
        );
      case RouteNames.searchScreen:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case RouteNames.orderScreen:
        return MaterialPageRoute(
          builder: (context) => const MyOrdersScreen(),
        );
      case RouteNames.orderPlacedScreen:
        final args = settings.arguments as OrderPlacedScreenArguementModel;
        return MaterialPageRoute(
          builder: (context) => OrderPlacedScreen(
            orderId: args.orderId,
          ),
        );
      case RouteNames.orderDetailsScreen:
        final args = settings.arguments as OrderDetailsArguementModel;
        return MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(
            orderIndex: args.orderIndex,
            orderId: args.orderId,
          ),
        );

      case RouteNames.orderSummaryScreen:
        final args = settings.arguments as OrderSummaryArguementModel;
        return MaterialPageRoute(
          builder: (context) => OrderSummeryScreen(
            addressId: args.addressId,
            screenCheck: args.screenCheck,
            cartId: args.cartId,
            productId: args.productId,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
