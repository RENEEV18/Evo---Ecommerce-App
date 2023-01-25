import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/view/cart/widgets/cartlistview_widget.dart';
import 'package:evo_mart/view/orders/model/order_screen_enum.dart';
import 'package:evo_mart/view/orders/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My Cart',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Manrope",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              kGapSize,
              CartListviewWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, value, child) {
          return value.cartList == null || value.cartList!.products.isEmpty
              ? const SizedBox()
              : Row(
                  children: [
                    Material(
                      elevation: 10,
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              const Text(
                                'Total Price',
                                style: TextStyle(
                                  color: kBlack,
                                  fontSize: 15,
                                  fontFamily: "Manrope",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${value.totalSave}',
                                style: const TextStyle(
                                  color: kRed,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const OrderPageScreen(
                                  cartId: "",
                                  productId: "",
                                  screenCheck: OrderSummaryScreenEnum
                                      .normalOrderSummaryScreen,
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kTextfieldColor,
                            elevation: 1,
                            shape: const RoundedRectangleBorder()),
                        child: const Text(
                          'Place Order',
                          style: TextStyle(
                            color: kWhite,
                            fontFamily: 'Manrope',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
