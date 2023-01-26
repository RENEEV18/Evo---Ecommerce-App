import 'dart:developer';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/wishlist/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomItemWidgets extends StatelessWidget {
  const BottomItemWidgets({
    Key? key,
    required this.id,
    required this.size,
    required this.productId,
  }) : super(key: key);
  final String id;
  final String productId;
  final List<String> size;
  @override
  Widget build(BuildContext context) {
    return Consumer3<CartProvider, BottomNavProvider, WishlistProvider>(
        builder: (context, value, value2, value3, child) {
      return Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton.icon(
              onPressed: () {
                value3.addOrRemoveFromWishlist(context, productId);
                // value.addToCart(id, context, size.toString());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: kBlack,
                  elevation: 0,
                  shape: const RoundedRectangleBorder()),
              icon: Icon(
                value3.wishList.contains(id) ? Icons.favorite : Icons.favorite,
                color: value3.wishList.contains(id) ? kRed : kWhite,
              ),
              label: const Text(
                'WishList',
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
          value.cartItemsId.contains(id)
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      value.gotToCartFromProduct(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kTextfieldColor,
                      shape: const RoundedRectangleBorder(),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: kWhite,
                    ),
                    label: const Text(
                      "Go to cart",
                      style: TextStyle(
                        color: kWhite,
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
                      elevation: 0,
                      backgroundColor: kTextfieldColor,
                      shape: const RoundedRectangleBorder(),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: kWhite,
                    ),
                    label: const Text(
                      "Add to Cart",
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
