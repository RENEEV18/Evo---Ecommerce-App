import 'dart:developer';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/view/product_screen/widgets/offer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.rating,
    this.discountPrice,
  }) : super(key: key);

  final String name;
  final int price;
  final String rating;
  final dynamic discountPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: kWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 6,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kgery,
              ),
            ),
          ),
          kSize,
          Text(
            name.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              // fontFamily: 'Manrope',
              letterSpacing: 1.2,
            ),
          ),
          RichText(
            text: TextSpan(
              text: rating,
              style: const TextStyle(color: kBlack),
              children: [
                WidgetSpan(
                  child: RatingBar.builder(
                    initialRating: double.parse(rating),
                    itemSize: 15,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (startRating) {
                      log(startRating.toString());
                    },
                  ),
                )
              ],
            ),
          ),
          kSize,
          Text(
            '₹${price.toString()}',
            style: const TextStyle(
              // fontSize: 25,
              color: kgery,
              decoration: TextDecoration.lineThrough,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '₹${(price - discountPrice).round()}',
            style: const TextStyle(
              fontSize: 25,
              color: kRed,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Available Offers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          OfferTextWidget().offerText(
            ' Bank offer starts at 5% cashback',
          ),
          OfferTextWidget()
              .offerText(' Cash On Delivery Free up to all products on Evo'),
          OfferTextWidget().offerText(' No cost EMI/coupons up to 10% Off'),
          kHeight,
          const Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          kSize,
          const Text(
              ''' You can enjoy a large screen size with a significantly compact frame thanks to the 17.06 cm (6.72) screen and 93.76% screen-to-body ratio, and the 120 Hz refresh rate provides you with a fantastic user experience. Additionally, this smartphone enables exceptional photography and filmmaking abilities that let you record precious moments thanks to its 108 MP ProLight Camera. Furthermore, the Realme 10 Pro 5G's Snapdragon 695 5G Chipset is produced utilising a flawless 6 nm production process, which results in a power-efficient phone. Moreover, the Realme 10 Pro 5G's massive 8 GB + 8 GB Dynamic RAM design makes it simple to switch between programmes, play games, and access numerous files.
'''),
        ],
      ),
    );
  }
}
