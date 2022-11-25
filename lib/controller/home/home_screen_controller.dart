import 'dart:developer';

import 'package:e_commerce_app/model/home_models/carousal_model.dart';
import 'package:e_commerce_app/model/home_models/category_model.dart';
import 'package:e_commerce_app/model/home_models/product_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/home/home_service.dart';
import 'package:e_commerce_app/view/home/model/product_collection_model.dart';
import 'package:flutter/widgets.dart';

class HomeScreenProvider with ChangeNotifier {
  HomeScreenProvider() {
    callHomeFunctions();
  }
  final TextEditingController controller = TextEditingController();
  List<CarousalModel> carousalList = [];
  List<CategoryModel> categoryList = [];
  List<Product> productList = [];
  bool loading = false;
  bool favourite = false;

  void callHomeFunctions() {
    getCarousals();
    getCategories();
    getProducts();
  }

  void toCollectionScreen(
      BuildContext context, String category, String categoryId) {
    productList.clear();
    final args = ProductCollectionScreenModel(
        category: category, categoryId: categoryId);
    Navigator.of(context)
        .pushNamed(
      RouteNames.productCollections,
      arguments: args,
    )
        .then((value) {
      getProducts();
    });
  }

  void favouriteAction() {
    favourite = !favourite;
    notifyListeners();
  }

  void getCarousals() async {
    loading = true;
    notifyListeners();
    await HomeService().getCarousals().then((value) {
      if (value != null) {
        carousalList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  void getCategories() async {
    loading = true;
    notifyListeners();
    await HomeService().getCategories().then((value) {
      if (value != null) {
        categoryList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  void getProducts() async {
    loading = true;
    notifyListeners();
    await HomeService().getAllProducts().then((value) {
      if (value != null) {
        productList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  void getProductsByCategory(String idCategory) async {
    loading = true;
    notifyListeners();
    await HomeService().getProductsByCategory(idCategory).then((value) {
      if (value != null) {
        productList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }
}
