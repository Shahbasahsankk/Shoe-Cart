import 'package:e_commerce_app/controller/home/home_screen_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/home/widgets/product_textdescription_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCollectionScreen extends StatelessWidget {
  const ProductCollectionScreen({
    super.key,
    required this.category,
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.3 / 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => homeProvider.toProductScreen(context),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black26,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Image(
                                      height: 130,
                                      width: 150,
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/home_page_assets/men_boots1.jpeg',
                                      ),
                                    ),
                                    AppSizedBoxes.sizedboxH5,
                                    const Text('RED TAPE'),
                                    AppSizedBoxes.sizedboxH3,
                                    const Text('Sneakers For Men'),
                                    AppSizedBoxes.sizedboxH3,
                                    const ProductTextdesciptionStyle(
                                      text1: '4999',
                                      text2: '₹1499',
                                      text3: '70% off',
                                    ),
                                    AppSizedBoxes.sizedboxH5,
                                    Container(
                                      width: 40,
                                      color: AppColors.greenColor,
                                      child: Row(
                                        children: const [
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                                color: AppColors.whiteColor),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                            color: AppColors.whiteColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 27,
                              width: 27,
                              decoration: BoxDecoration(
                                  color: AppColors.blackcolor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Icon(Icons.favorite),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
