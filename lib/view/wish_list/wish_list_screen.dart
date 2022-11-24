import 'package:e_commerce_app/controller/wishlist/wishlist_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/sizedboxes/app_sizedboxes.dart';
import '../home/widgets/product_textdescription_style.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishListProvider =
        Provider.of<WishListProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => wishListProvider.toCartScreen(context),
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.3 / 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black26,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 8),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Image(
                                      height: 130,
                                      width: 180,
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/home_page_assets/menshoes_sales.jpeg',
                                      ),
                                    ),
                                    AppSizedBoxes.sizedboxH15,
                                    const Text(
                                      'RED TAPE Sneakers For Men',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    AppSizedBoxes.sizedboxH3,
                                    const ProductTextdesciptionStyle(
                                      text1: '4999',
                                      text2: '₹1499',
                                      text3: '70% off',
                                    ),
                                    AppSizedBoxes.sizedboxH5,
                                    const Spacer(),
                                    AppSizedBoxes.sizedboxH5,
                                    GestureDetector(
                                      onTap: () => wishListProvider
                                          .toCartScreen(context),
                                      child: Container(
                                        height: 30,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: AppColors.transparentColor,
                                            border: Border.all(
                                              color: AppColors.dullWhitecolor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Center(
                                          child: Text('Add to Cart'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 9.0, top: 5),
                            child: Align(
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
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
