import 'dart:developer';

import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/view/cart/widgets/cart_alert.dart';
import 'package:evo_mart/view/cart/widgets/shimmer/cart_shimmer.dart';
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
        return cart.cartList == null || cart.cartList!.products.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: const Center(
                  child: Text('Cart is Empty'),
                ),
              )
            : cart.isLoading == true
                ? const CartShimmer()
                : ListView.separated(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
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
                                      cart.cartList!.products[index].product
                                          .name,
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
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Manrope",
                                          ),
                                        ),
                                      ],
                                    ),
                                    kSize,
                                    FittedBox(
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              // cart.incrementDecrementQty(
                                              //   -1,
                                              //   cart.cartList!.products[index]
                                              //       .product.id,
                                              //   cart.cartList!.products[index]
                                              //       .qty,
                                              //   context,
                                              //   cart.cartList!.products[index]
                                              //       .product.size
                                              //       .toString(),
                                              // );
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          kWidth,
                                          Container(
                                            height: 25,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              "${cart.cartList!.products[index].qty}",
                                              textAlign: TextAlign.center,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          kWidth,
                                          InkWell(
                                            onTap: () {
                                              cart.incrementDecrementQty(
                                                1,
                                                cart.cartList!.products[index]
                                                    .product.id,
                                                cart.cartList!.products[index]
                                                    .qty,
                                                context,
                                                cart.cartList!.products[index]
                                                    .product.size
                                                    .toString(),
                                              );
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CartAlertWidget(
                                          cart: cart,
                                          index: index,
                                        );
                                      },
                                    );
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
                                    shape: const RoundedRectangleBorder(),
                                  ),
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
                          kSize,
                        ],
                      );
                    },
                    itemCount: cart.cartList?.products.length ?? 0,
                    separatorBuilder: (context, index) => const Divider(),
                  );
      },
    );
  }
}
