import 'dart:developer';

import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/controller/providers/wishlist/wishlist_provider.dart';
import 'package:evo_mart/view/wishlist_screen/shimmer/wishlist_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My Wishlist',
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Manrope",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer2<HomeProvider, WishlistProvider>(
            builder: (context, home, wish, child) {
              return Column(
                children: [
                  kGapSize,
                  wish.model == null || wish.model!.products.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: const Center(
                            child: Text('Wishlist is Empty'),
                          ),
                        )
                      : wish.isLoading == true
                          ? const WishListShimmer()
                          : ListView.separated(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        kWidth,
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: NetworkImage(
                                              '${ApiBaseUrl().baseUrl}/products/${wish.model!.products[index].product.image[0]}',
                                            ),
                                          )),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                wish.model!.products[index]
                                                    .product.name,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Manrope',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              RatingBar.builder(
                                                initialRating: double.parse(wish
                                                    .model!
                                                    .products[index]
                                                    .product
                                                    .rating),
                                                itemSize: 15,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                ignoreGestures: true,
                                                itemBuilder: (context, _) =>
                                                    const Icon(
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
                                                    "${wish.model!.products[index].product.offer}%Off",
                                                    style: const TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      fontFamily: "Manrope",
                                                    ),
                                                  ),
                                                  kWidth,
                                                  Text(
                                                    "₹${wish.model!.products[index].product.price}",
                                                    style: const TextStyle(
                                                      color: kgery,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontFamily: "Manrope",
                                                    ),
                                                  ),
                                                  kWidth,
                                                  Text(
                                                    "₹${wish.model!.products[index].product.price - wish.model!.products[index].product.discountPrice}",
                                                    style: const TextStyle(
                                                      color: kRed,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Manrope",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        kwishWidth,
                                        IconButton(
                                          onPressed: () {
                                            wish.addOrRemoveFromWishlist(
                                                context,
                                                wish.model!.products[index]
                                                    .product.id);
                                          },
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: kRed,
                                          ),
                                        ),
                                      ],
                                    ),
                                    kSize,
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: wish.model?.products.length ?? 0,
                            ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
