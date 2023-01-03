import 'dart:developer';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomItemWidgets extends StatelessWidget {
  const BottomItemWidgets({
    Key? key,
    required this.id,
    required this.size,
  }) : super(key: key);
  final String id;
  final List<String> size;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, value, child) {
      return Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton.icon(
              onPressed: () {
                value.addToCart(id, context, size.toString());
                log('add cart clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kWhite,
                elevation: 0,
                shape: const RoundedRectangleBorder(),
              ),
              icon: const Icon(
                Icons.shopping_cart,
                color: kBlack,
              ),
              label: const Text(
                "Add to cart",
                style: TextStyle(
                  color: kBlack,
                  fontFamily: "Manrope",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: kTextfieldColor,
                  elevation: 0,
                  shape: const RoundedRectangleBorder()),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  color: kWhite,
                  fontFamily: "Manrope",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
