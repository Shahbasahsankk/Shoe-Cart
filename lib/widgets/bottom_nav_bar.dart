import 'package:e_commerce_app/controller/bottom_nav/bottom_nav_bar_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider =
        Provider.of<BottomNavBarProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: (context)
            .watch<BottomNavBarProvider>()
            .bottomScreen[bottomNavBarProvider.currentIndex],
        bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomNavigationBar(
            iconSize: 20,
            backgroundColor: AppColors.backgroundColor,
            currentIndex: bottomNavBarProvider.currentIndex,
            elevation: 0,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.dullWhitecolor,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'WishList'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Orders'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Cart'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile'
              ),
            ],
            onTap: (newIndex) => bottomNavBarProvider.newIndex(newIndex),
          ),
        ),
      ),
    );
  }
}
