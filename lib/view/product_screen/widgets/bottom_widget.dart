import 'dart:developer';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/bottom_nav_provider/bottom_nav_provider.dart';
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
    return Consumer2<CartProvider, BottomNavProvider>(
        builder: (context, value, value2, child) {
      return Row(
        children: [
          value.cartItemsId.contains(id)
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      value.gotToCartFromProduct(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: kBlack,
                    ),
                    label: const Text(
                      "Go to cart",
                      style: TextStyle(
                        color: kBlack,
                        fontFamily: "Manrope",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      value.addToCart(id, context, size.toString());
                      log('add cart clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: kBlack,
                    ),
                    label: const Text(
                      "Add to Cart",
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
              onPressed: () {
                value2.toOrdersPage(context);
              },
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
