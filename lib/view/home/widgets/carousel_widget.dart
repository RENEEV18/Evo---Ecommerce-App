import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: value.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 150,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        value.smoothIndicator(index);
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      log('lenght of carousalList');
                      log(value.carousalList.length.toString());
                      return Image(
                        image: NetworkImage(
                            "http://172.16.5.206:5005/uploads/carousal/${value.carousalList[index].image}"),
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: value.carousalList.length,
                  ),
          ),
          kHeight,
          Positioned(
            top: 128,
            left: 150,
            child: AnimatedSmoothIndicator(
              activeIndex: value.activeIndex,
              count: value.carousalList.length,
              effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: kWhite,
                  activeDotColor: kTextfieldColor),
            ),
          ),
        ],
      );
    });
  }
}
