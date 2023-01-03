import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:flutter/material.dart';

class CartAlertWidget extends StatelessWidget {
  const CartAlertWidget({
    Key? key,
    required this.cart,
    required this.index,
  }) : super(key: key);

  final CartProvider cart;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Remove Item',
        style: TextStyle(
          fontFamily: "Manrope",
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Are you sure want to remove ?',
        style: TextStyle(
          fontFamily: "Manrope",
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kTextfieldColor,
              ),
              child: const Text(
                'No',
                style: TextStyle(
                  color: kWhite,
                  fontFamily: "Manrope",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cart.removeCart(
                  context,
                  cart.cartList!.products[index].product.id,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kTextfieldColor,
              ),
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: kWhite,
                  fontFamily: "Manrope",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
