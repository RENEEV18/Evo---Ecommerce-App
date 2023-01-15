import 'dart:developer';

import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/controller/providers/orders/order_controller.dart';
import 'package:evo_mart/controller/providers/payment/payment_provider.dart';
import 'package:evo_mart/view/orders/model/order_argument.dart';
import 'package:evo_mart/view/orders/widgets/order_address_widget.dart';
import 'package:evo_mart/view/orders/widgets/order_bottom_nav.dart';
import 'package:evo_mart/view/orders/widgets/row_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class OrderPageScreen extends StatelessWidget {
  static const routeName = "/orders_page";
  const OrderPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  final args = ModalRoute.of(context)?.settings.arguments as OrderArgumnetsModel;
    //    final provider =
    //       Provider.of<PaymentProvider>(context, listen: false).findByProduct(context,args);
    final args = ModalRoute.of(context)?.settings.arguments as String;
    final provider =
        Provider.of<HomeProvider>(context, listen: false).findById(args);
    final data = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Summary",
          style: TextStyle(
            fontFamily: "Manrope",
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer2<AddressProvider, OrdersProvider>(
            builder: (context, value, order, child) {
              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OrderAddressWidget(
                        index: index,
                        value: value,
                      );
                    },
                    itemCount: value.addressList.length,
                  ),
                  kheight,
                  ListView.builder(
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
                                    order.cartModel[index].product.image[0],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RatingBar.builder(
                                      initialRating:
                                          double.parse(provider.rating),
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
                                          "${provider.offer}%Off",
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: "Manrope",
                                          ),
                                        ),
                                        kWidth,
                                        Text(
                                          "₹${provider.price}",
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
                                          "₹${(provider.price - provider.discountPrice).round()}",
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
                                  ],
                                ),
                              ],
                            ),
                            kSize,
                            Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  height: 25,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "${data.cartList!.products[index].qty}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            kSize
                          ],
                        ),
                      );
                    },
                    itemCount: order.cartModel.length,
                  ),
                  kSize,
                  Container(
                    color: kWhite,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Price Details',
                              style: TextStyle(
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        kSize,
                        RowOrderWidget(
                          text: 'Price',
                          text2:
                              "₹${(provider.price - provider.discountPrice).round()}",
                          color: kRed,
                        ),
                        kSize,
                        const RowOrderWidget(
                          text: 'Delivery Charges',
                          text2: "Free Delivery",
                          color: Colors.green,
                        ),
                        const Text(
                          '-------------------------------------------------------------------------------------',
                        ),
                        RowOrderWidget(
                          text: 'Total Amout',
                          text2:
                              "₹${(provider.price - provider.discountPrice).round()}",
                        ),
                      ],
                    ),
                  ),
                  kGapSize,
                  Row(
                    children: const [
                      kHeadLineWidth,
                      Image(
                        height: 40,
                        width: 40,
                        image: AssetImage('assets/images/shield_5f9216.png'),
                      ),
                      Text(
                        'Safe and Secure Payments.Easy returns.100% \nAuthentic products',
                        style: TextStyle(
                          color: kgery,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: OrderBottomNav(provider: provider),
    );
  }
}
