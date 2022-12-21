import 'package:carousel_slider/carousel_slider.dart';
import 'package:evo_mart/controller/providers/carousel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CarouselProvider>(builder: (context, value, child) {
      return SizedBox(
        width: double.infinity,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            //onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Image(
              image: NetworkImage(
                  "http://172.16.5.206:5005/uploads/carousals/${value.carousalList[index].image}"),
              fit: BoxFit.cover,
            );
          },
          itemCount: value.carousalList.length,
        ),
      );
    });
  }
}
