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
  }) : super(key: key);

  final String name;
  final int price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Manrope',
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
          Text(
            '₹${price.toString()}',
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
          OfferTextWidget().offerText(' Bank offer starts at 5% cashback'),
          OfferTextWidget()
              .offerText(' Cash On Delivery Free up to all products on Evo'),
          OfferTextWidget().offerText(' No cost EMI/coupons up to 10% Off'),
        ],
      ),
    );
  }
}
