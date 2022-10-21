import 'package:e_commerce_app/view/cart/cart_screen.dart';
import 'package:e_commerce_app/view/home/home_screen.dart';
import 'package:e_commerce_app/view/orders/orders_screen.dart';
import 'package:e_commerce_app/view/profile/profile_screen.dart';
import 'package:e_commerce_app/view/wish_list/wish_list_screen.dart';
import 'package:flutter/widgets.dart';

class BottomNavBarProvider with ChangeNotifier{

  int currentIndex=0;

  final List<Widget> _bottomScreens= [
    const HomeScreen(),
    const WishListScreen(),
    const OrdersScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  List<Widget> get bottomScreen=> _bottomScreens;
  
  void newIndex(int newIndex){
    currentIndex=newIndex;
    notifyListeners();
  }

}