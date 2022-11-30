import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/wish_list_model/wish_list_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/wishList/wish_list_services.dart';
import 'package:e_commerce_app/utils/app_toast.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  WishListProvider() {
    getWishListItems();
  }
  bool loading = false;
  WishListModel? wishList;
  List favouriteProducts = [];

  void toCartScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.cartScreen);
  }

  void getWishListItems() async {
    loading = true;
    notifyListeners();
    await WishListService().getWishListItems().then(
      (value) {
        if (value != null) {
          wishList = value;
          notifyListeners();
          favouriteProducts =
              wishList!.products.map((e) => e.product.id).toList();
          notifyListeners();
          loading = false;
          notifyListeners();
        } else {
          loading = false;
          notifyListeners();
        }
      },
    );
  }

  void addOrRemoveFromWishList(String productId) async {
    loading = true;
    notifyListeners();
    await WishListService().addOrRemoveFromWishList(productId).then(
      (value) {
        if (value != null) {
          WishListService().getWishListItems().then(
            (value) {
              if (value != null) {
                wishList = value;
                notifyListeners();
                getWishListItems();
                loading = false;
                notifyListeners();
              } else {
                loading = false;
                notifyListeners();
              }
            },
          );
          if (value == 201) {
            AppToast.showToast('Item added to Wishlist', AppColors.greenColor);
          } else if (value == 204) {
            AppToast.showToast(
                'Item removed from Wishlist', AppColors.greenColor);
          }
        } else {
          loading = false;
          notifyListeners();
        }
      },
    );
  }
}
