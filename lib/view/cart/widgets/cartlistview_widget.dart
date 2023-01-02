import 'dart:developer';

import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class CartListviewWidget extends StatelessWidget {
  const CartListviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, CartProvider>(
        builder: (context, home, cart, child) {
      return ListView.separated(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cart.isLoading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.height / 2,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : cart.cartList == null || cart.cartList!.products.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Center(
                        child: Text('Cart is Empty'),
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            kWidth,
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                  '${ApiBaseUrl().baseUrl}/products/${cart.cartList!.products[index].product.image[0]}',
                                ),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cart.cartList!.products[index].product.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  RatingBar.builder(
                                    initialRating: double.parse(cart.cartList!
                                        .products[index].product.rating),
                                    itemSize: 15,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (startRating) {
                                      log(startRating.toString());
                                    },
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${cart.cartList!.products[index].product.offer}%Off",
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "Manrope",
                                        ),
                                      ),
                                      kWidth,
                                      Text(
                                        "₹${cart.cartList!.products[index].product.price}",
                                        style: const TextStyle(
                                          color: kgery,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontFamily: "Manrope",
                                        ),
                                      ),
                                      kWidth,
                                      Text(
                                        "₹${cart.cartList!.products[index].product.price - cart.cartList!.products[index].product.discountPrice}",
                                        style: const TextStyle(
                                          color: kRed,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Manrope",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        kSize,
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  cart.removeCart(
                                      context,
                                      cart.cartList!.products[index].product
                                          .id);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kWhite,
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(),
                                ),
                                icon: const Icon(
                                  Icons.delete,
                                  color: kBlack,
                                ),
                                label: const Text(
                                  'Remove',
                                  style: TextStyle(
                                      color: kBlack,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
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
                                      fontFamily: 'Manrope',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      ],
                    );
        },
        itemCount: cart.cartList?.products.length ?? 0,
        separatorBuilder: (context, index) => const Divider(),
      );
    });
  }
}
