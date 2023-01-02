import 'package:carousel_slider/carousel_slider.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/view/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 150,
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
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return const ShimmerWidget.rectangle(
                  height: 20, width: double.infinity);
            },
            itemCount: 5,
          ),
        ),
        kHeight,
        // Positioned(
        //   top: 128,
        //   left: 150,
        //   child: AnimatedSmoothIndicator(
        //     activeIndex: value.activeIndex,
        //     count: value.carousalList.length,
        //     effect: const WormEffect(
        //         dotHeight: 10,
        //         dotWidth: 10,
        //         dotColor: kWhite,
        //         activeDotColor: kTextfieldColor),
        //   ),
        // ),
      ],
    );
  }
}
