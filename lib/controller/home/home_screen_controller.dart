import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/view/home/model/product_collection_model.dart';
import 'package:flutter/widgets.dart';

class HomeScreenProvider with ChangeNotifier {
  final TextEditingController controller = TextEditingController();

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
}
