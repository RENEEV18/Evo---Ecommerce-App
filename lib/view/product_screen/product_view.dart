import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/controller/providers/product_screen_provider/product_screen_provider.dart';
import 'package:evo_mart/view/product_screen/widgets/bottom_widget.dart';
import 'package:evo_mart/view/product_screen/widgets/preview_product_widget.dart';
import 'package:evo_mart/view/product_screen/widgets/product_details_widget.dart';
import 'package:evo_mart/view/product_screen/widgets/top_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    this.discountPrice,
    required this.offer,
    required this.size,
    required this.image,
    required this.category,
    required this.rating,
  });

  final String id;
  final String name;
  final int price;
  final dynamic discountPrice;
  final int offer;
  final List<String> size;
  final List<String> image;
  final String category;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer2<HomeProvider, ProductProvider>(
            builder: (context, value, value2, child) {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: [
                    kSize,
                    Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: image.length,
                          itemBuilder: (context, index, realIndex) {
                            return value.isLoading == true
                                ? const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  )
                                : Center(
                                    child: Image(
                                      image: NetworkImage(
                                        'http://172.16.5.206:5005/uploads/products/${image[index]}',
                                      ),
                                    ),
                                  );
                          },
                          options: CarouselOptions(
                            height: 250,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              value2.getProductCarousel(index);
                            },
                          ),
                        ),
                        const TopItemWidget(),
                      ],
                    ),
                    kHeight,
                    AnimatedSmoothIndicator(
                      activeIndex: value2.activeIndex,
                      count: image.length,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: kBlack,
                        activeDotColor: kTextfieldColor,
                      ),
                    ),
                    kHeight,
                    PreviewProductWidget(image: image),
                    kGapSize,
                    ProductDetailsWidget(name: name, price: price),
                    kSize,
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Rating',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                rating,
                                style: const TextStyle(fontSize: 22),
                              ),
                              RatingBar.builder(
                                initialRating: double.parse(rating),
                                itemSize: 30,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (startRating) {
                                  log(startRating.toString());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    kSize,
                    const BottomWidget()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
