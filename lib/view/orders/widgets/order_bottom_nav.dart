import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/payment/payment_provider.dart';
import 'package:evo_mart/model/home/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderBottomNav extends StatelessWidget {
  const OrderBottomNav({
    Key? key,
    required this.provider,
    required this.payableAmount,
  }) : super(key: key);

  final ProductModel provider;
  final int payableAmount;

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(builder: (context, value, child) {
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
                child: Text(
                  "₹${(provider.price - provider.discountPrice).round()}",
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                onPressed: () {
                  value.openCheckout(payableAmount);
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
            ),
          ],
        ),
      );
    });
  }
}
