import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/model/home_models/carousal_model.dart';
import 'package:e_commerce_app/model/home_models/category_model.dart';
import 'package:e_commerce_app/model/home_models/product_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/home/home_service.dart';
import 'package:e_commerce_app/utils/app_toast.dart';
import 'package:e_commerce_app/utils/debouncer.dart';
import 'package:e_commerce_app/view/home/model/product_collection_model.dart';
import 'package:e_commerce_app/view/product_screen/widgets/utils/prouductid_model.dart';
import 'package:flutter/widgets.dart';

class HomeScreenProvider with ChangeNotifier {
  HomeScreenProvider() {
    callHomeFunctions();
  }
  final TextEditingController controller = TextEditingController();
  List<CarousalModel> carousalList = [];
  List<CategoryModel> categoryList = [];
  List<Product> productList = [];
  final debouncer = Debouncer(milliseconds: 200);
  bool loading = false;

  Future<void> callHomeFunctions() async {
    getCarousals().then((value) {
      getCategories().then((value) {
        searchProducts('');
      });
    });
  }

  void toSearchScreen(BuildContext context) {
    if (categoryList.isEmpty || productList.isEmpty || carousalList.isEmpty) {
      AppToast.showToast("No internet connection", AppColors.redColor);
    } else {
      Navigator.of(context).pushNamed(RouteNames.searchScreen);
    }
  }

  void toProductScreen(context, productId) {
    final args = ProductIdModel(productId: productId);
    Navigator.of(context).pushNamed(
      RouteNames.productScreen,
      arguments: args,
    );
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
      searchProducts('');
    });
  }

  Future<void> getCarousals() async {
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

  Future<void> getCategories() async {
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

  Future<void> searchProducts(String text) async {
    loading = true;
    notifyListeners();
    await HomeService().searchProducts(text).then((value) {
      if (value != null) {
        productList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
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
