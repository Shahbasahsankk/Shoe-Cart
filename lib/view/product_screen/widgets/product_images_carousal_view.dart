import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/constants/api_url.dart';
import 'package:flutter/material.dart';

class ImageCarousalsWidget extends StatelessWidget {
  const ImageCarousalsWidget({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        return Image(
          image: NetworkImage(
              "http://${ApiUrl.url}:5008/products/${images[index]}"),
          fit: BoxFit.cover,
        );
      },
      options: CarouselOptions(
        aspectRatio: 0.85,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
      ),
    );
  }
}
