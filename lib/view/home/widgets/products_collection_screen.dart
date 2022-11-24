import 'package:e_commerce_app/controller/home/home_screen_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/view/home/widgets/grid_view_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/loading_widget.dart';

class ProductCollectionScreen extends StatelessWidget {
  const ProductCollectionScreen({
    super.key,
    required this.category,
    required this.categoryId,
  });
  final String category;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeProvider.getProductsByCategory(categoryId);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
          title: Text(category),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: Consumer<HomeScreenProvider>(builder: (context, values, _) {
          return values.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Expanded(
                        child: GridViewProducts(),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
