import 'dart:developer';

import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, value, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              value.addToCart(id, context);
              log('add cart clicked');
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: kBlack,
            ),
            label: const Text(
              "Add to cart",
              style: TextStyle(color: kBlack),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: kWhite,
              shape: RoundedRectangleBorder(
                side: const BorderSide(),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kTextfieldColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: kWhite,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

//  onPressed: () {
//                   value2.addOrRemoveFromWishlist(context, id);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.only(top: 3),
//                   shape: const CircleBorder(),
//                   backgroundColor: Colors.white.withOpacity(0.3),
//                 ),
//                 child: Icon(
//                   value2.wishList.contains(id)
//                       ? Icons.favorite
//                       : Icons.favorite,
//                   color: value2.wishList.contains(id) ? kRed : kWhite,
//                 ),