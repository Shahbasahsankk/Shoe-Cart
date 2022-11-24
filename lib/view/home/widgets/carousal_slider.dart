import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/constants/api_url.dart';
import 'package:e_commerce_app/model/home_models/carousal_model.dart';
import 'package:flutter/material.dart';

class CarousalSliderWidget extends StatelessWidget {
  const CarousalSliderWidget({
    super.key,
    required this.carousals,
  });
  final List<CarousalModel> carousals;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carousals.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: NetworkImage(
                "http://${ApiUrl.url}:5005/carousals/${carousals[index].imagePath}"),
            fit: BoxFit.cover,
          ),
        );
      },
      options: CarouselOptions(
        pauseAutoPlayOnTouch: true,
        autoPlay: true,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
      ),
    );
  }
}
