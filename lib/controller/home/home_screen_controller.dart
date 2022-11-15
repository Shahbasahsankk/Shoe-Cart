import 'package:e_commerce_app/model/home_models/carousal_model.dart';
import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/home/home_service.dart';
import 'package:e_commerce_app/view/home/model/product_collection_model.dart';
import 'package:flutter/widgets.dart';

class HomeScreenProvider with ChangeNotifier {
  HomeScreenProvider() {
    getCarousals();
  }
  final TextEditingController controller = TextEditingController();
  List<CarousalModel> carousalList = [];
  bool loading = false;

  void toCollectionScreen(context, category) {
    final args = ProductCollectionScreenModel(category: category);
    Navigator.of(context).pushNamed(
      RouteNames.productCollections,
      arguments: args,
    );
  }

  void toProductScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.productScreen);
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
}
