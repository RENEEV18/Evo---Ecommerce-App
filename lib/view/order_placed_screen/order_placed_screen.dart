import 'dart:developer';

import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/orders/order_controller.dart';
import 'package:evo_mart/view/orders/model/order_argument.dart';
import 'package:evo_mart/view/orders/widgets/order_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../controller/providers/address/address_controller.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key, this.args});

  final OrderArgumnetsModel? args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: SafeArea(
        child: Consumer3<AddressProvider, OrdersProvider, CartProvider>(
          builder: (context, value, order, cart, child) {
            return order.isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                    children: [
                      OrderAddressWidget(
                        index: value.selectIndex,
                        value: value,
                      ),
                      kheight,
                      ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              color: kWhite,
                              child: Column(
                                children: [
                                  kSize,
                                  Row(
                                    children: [
                                      kWidth,
                                      Image(
                                        height: 100,
                                        width: 100,
                                        image: NetworkImage(
                                          'http://172.16.5.206:5005/products/${order.cartModel[0].product.image[0]}',
                                          // order.cartModel[0].product.image[0],
                                        ),
                                      ),
                                      kWidth,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cart.cartList!.products[index]
                                                .product.name,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          RatingBar.builder(
                                            initialRating: double.parse(cart
                                                .cartList!
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
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontFamily: "Manrope",
                                                ),
                                              ),
                                              kWidth,
                                              Text(
                                                "₹${(cart.cartList!.products[index].product.price - cart.cartList!.products[index].product.discountPrice).round()}",
                                                style: const TextStyle(
                                                  color: kRed,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Manrope",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  kSize,
                                  Text(
                                    'Order Placed Successfully',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 16),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: 1),
                      kSize,
                    ],
                  ));
          },
        ),
      ),
    );
  }
}
