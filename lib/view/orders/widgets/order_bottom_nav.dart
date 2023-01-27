import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/orders/order_controller.dart';
import 'package:evo_mart/controller/providers/payment/payment_provider.dart';
import 'package:evo_mart/view/address/show_address_page.dart';
import 'package:evo_mart/view/order_placed_screen/order_placed_screen.dart';
import 'package:evo_mart/view/orders/model/order_screen_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderBottomNav extends StatelessWidget {
  const OrderBottomNav({
    Key? key,
    // required this.provider,
    required this.screenCheck,
  }) : super(key: key);

  // final ProductModel provider;
  final OrderSummaryScreenEnum screenCheck;
  // final int payableAmount;

  @override
  Widget build(BuildContext context) {
    return Consumer4<PaymentProvider, AddressProvider, CartProvider,
        OrdersProvider>(
      builder: (context, value, value2, cart, order, child) {
        return Material(
          elevation: 10,
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    // value.gotToCartFromProduct(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: order.isLoading == true
                      ? const CircularProgressIndicator()
                      : Text(
                          screenCheck ==
                                  OrderSummaryScreenEnum
                                      .normalOrderSummaryScreen
                              ? "₹${(cart.cartList!.totalPrice - cart.cartList!.totalDiscount).round()}"
                              : "₹${(order.cartModel[0].product.price - order.cartModel[0].product.discountPrice).round()}",
                          style: const TextStyle(
                            color: kBlack,
                            fontFamily: "Manrope",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
              value2.addressList.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        onPressed: () {
                          value.openCheckout(
                            screenCheck ==
                                    OrderSummaryScreenEnum
                                        .normalOrderSummaryScreen
                                ? int.parse((cart.cartList!.totalPrice -
                                        cart.cartList!.totalDiscount)
                                    .round()
                                    .toString())
                                : int.parse((order.cartModel[0].price -
                                        order.cartModel[0].discountPrice)
                                    .round()
                                    .toString()),
                            context,
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const OrderPlacedScreen();
                            },
                          ));
                          // cart.removeCart(
                          //     context, cart.cartList!.products[0].product.id);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kTextfieldColor,
                            elevation: 0,
                            shape: const RoundedRectangleBorder()),
                        child: const Text(
                          'Continue',
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
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const ShowAddressScreen();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kTextfieldColor,
                            elevation: 0,
                            shape: const RoundedRectangleBorder()),
                        child: const Text(
                          'Add Adrress',
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
          ),
        );
      },
    );
  }
}
