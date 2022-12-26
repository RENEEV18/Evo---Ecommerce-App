import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/view/product_screen/widgets/offer_text.dart';
import 'package:flutter/material.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String name;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      //margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
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
              fontFamily: 'Comfortaa',
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
