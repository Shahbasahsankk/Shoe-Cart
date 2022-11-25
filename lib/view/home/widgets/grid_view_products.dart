import 'package:e_commerce_app/controller/product_screen/product_screen_controller.dart';
import 'package:e_commerce_app/view/home/widgets/product_description_style2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/api_url.dart';
import '../../../controller/home/home_screen_controller.dart';
import '../../../helper/colors/app_colors.dart';
import '../../../helper/sizedboxes/app_sizedboxes.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({
    super.key,
    this.physics,
  });
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, values, _) {
      return GridView.builder(
        physics: physics,
        shrinkWrap: true,
        itemCount: values.productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: 1.26 / 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Provider.of<ProductProvider>(context, listen: false)
                .getAProduct(values.productList[index].id, context),
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
                          Image(
                            height: 130,
                            width: 150,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "http://${ApiUrl.url}:5005/products/${values.productList[index].image![0]}",
                            ),
                          ),
                          AppSizedBoxes.sizedboxH5,
                          Text(values.productList[index].name!),
                          AppSizedBoxes.sizedboxH3,
                          const Spacer(),
                          ProductDescriptionStyleTwo(
                            text1:
                                '₹${values.productList[index].discountPrice}',
                            text2: '₹${values.productList[index].price}',
                            text3: '${values.productList[index].offer}% off',
                          ),
                          AppSizedBoxes.sizedboxH5,
                          Container(
                            width: 40,
                            color: AppColors.greenColor,
                            child: Row(
                              children: [
                                Text(
                                  values.productList[index].rating.toString(),
                                  style: const TextStyle(
                                      color: AppColors.whiteColor),
                                ),
                                const Icon(
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
                Padding(
                  padding: const EdgeInsets.only(right: 9, top: 5),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => values.favouriteAction(),
                      child: Container(
                        height: 27,
                        width: 27,
                        decoration: BoxDecoration(
                            color: AppColors.blackcolor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            color: values.favourite == true
                                ? AppColors.redColor
                                : AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
