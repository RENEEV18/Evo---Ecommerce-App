import 'dart:developer';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/orders/order_controller.dart';
import 'package:evo_mart/controller/providers/payment/payment_provider.dart';
import 'package:evo_mart/view/orders/model/order_screen_enum.dart';
import 'package:evo_mart/view/orders/widgets/order_address_widget.dart';
import 'package:evo_mart/view/orders/widgets/order_bottom_nav.dart';
import 'package:evo_mart/view/orders/widgets/row_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class OrderPageScreen extends StatefulWidget {
  // static const routeName = "/orders_page";
  const OrderPageScreen(
      {super.key,
      required this.cartId,
      required this.productId,
      required this.screenCheck});

  final String cartId;
  final String productId;
  final OrderSummaryScreenEnum screenCheck;

  @override
  State<OrderPageScreen> createState() => _OrderPageScreenState();
}

class _OrderPageScreenState extends State<OrderPageScreen> {
  PaymentProvider paymentProvider = PaymentProvider();

  @override
  void initState() {
    final paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);
    final razorpay = paymentProvider.razorpay;
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, paymentProvider.handlePaymentSuccess);
    razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR, paymentProvider.handlePaymentError);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET, paymentProvider.handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    paymentProvider.razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OrdersProvider>(context, listen: false)
          .getSingleCart(context, widget.productId, widget.cartId);
    });
    // final args = ModalRoute.of(context)?.settings.arguments as String;
    // final provider =
    //     Provider.of<HomeProvider>(context, listen: false).findById(args);
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
        child: Consumer3<AddressProvider, OrdersProvider, CartProvider>(
          builder: (context, value, order, cart, child) {
            return order.isLoading == true
                ? Center(child: CircularProgressIndicator())
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
                                        widget.screenCheck ==
                                                OrderSummaryScreenEnum
                                                    .normalOrderSummaryScreen
                                            ? 'http://172.16.5.206:5005/products/${cart.cartList!.products[index].product.image[0]}'
                                            : 'http://172.16.5.206:5005/products/${order.cartModel[0].product.image[0]}',
                                        // order.cartModel[0].product.image[0],
                                      ),
                                    ),
                                    kWidth,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.screenCheck ==
                                                  OrderSummaryScreenEnum
                                                      .normalOrderSummaryScreen
                                              ? cart.cartList!.products[index]
                                                  .product.name
                                              : order.cartModel[0].product.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        RatingBar.builder(
                                          initialRating: double.parse(
                                            widget.screenCheck ==
                                                    OrderSummaryScreenEnum
                                                        .normalOrderSummaryScreen
                                                ? cart.cartList!.products[index]
                                                    .product.rating
                                                : order.cartModel[0].product
                                                    .rating,
                                          ),
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
                                              widget.screenCheck ==
                                                      OrderSummaryScreenEnum
                                                          .normalOrderSummaryScreen
                                                  ? "${cart.cartList!.products[index].product.offer}%Off"
                                                  : "${order.cartModel[0].product.offer}%Off",
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                fontFamily: "Manrope",
                                              ),
                                            ),
                                            kWidth,
                                            Text(
                                              widget.screenCheck ==
                                                      OrderSummaryScreenEnum
                                                          .normalOrderSummaryScreen
                                                  ? "₹${cart.cartList!.products[index].product.price}"
                                                  : "₹${order.cartModel[0].product.price}",
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
                                              widget.screenCheck ==
                                                      OrderSummaryScreenEnum
                                                          .normalOrderSummaryScreen
                                                  ? "₹${(cart.cartList!.products[index].product.price - cart.cartList!.products[index].product.discountPrice).round()}"
                                                  : "₹${(order.cartModel[0].product.price - order.cartModel[0].product.discountPrice).round()}",
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
                        itemCount: widget.screenCheck ==
                                OrderSummaryScreenEnum.normalOrderSummaryScreen
                            ? cart.cartList!.products.length
                            : 1,
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
                              text2: widget.screenCheck ==
                                      OrderSummaryScreenEnum
                                          .normalOrderSummaryScreen
                                  ? "₹${(cart.cartList!.totalPrice - cart.cartList!.totalDiscount).round()}"
                                  : "₹${(order.cartModel[0].product.price - order.cartModel[0].product.discountPrice).round()}",
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
                              text2: widget.screenCheck ==
                                      OrderSummaryScreenEnum
                                          .normalOrderSummaryScreen
                                  ? "₹${(cart.cartList!.totalPrice - cart.cartList!.totalDiscount).round()}"
                                  : "₹${(order.cartModel[0].product.price - order.cartModel[0].product.discountPrice).round()}",
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
                            image:
                                AssetImage('assets/images/shield_5f9216.png'),
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
                  ));
          },
        ),
      ),
      bottomNavigationBar: OrderBottomNav(
        screenCheck: widget.screenCheck,
      ),
    );
  }
}
