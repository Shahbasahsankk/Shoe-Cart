import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousalSliderWidget extends StatelessWidget {
  const CarousalSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 2,
      itemBuilder: (context, index, realIndex) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(
            image:
                AssetImage('assets/home_page_assets/vass boots carousel.jpg'),
            fit: BoxFit.cover,
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
      ),
    );
  }
}
