import 'package:evo_mart/common/const/const.dart';
import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart,
            color: kBlack,
          ),
          label: const Text(
            "Add to cart",
            style: TextStyle(color: kBlack),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: kWhite,
            shape: RoundedRectangleBorder(
              side: const BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kTextfieldColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Buy Now',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: kWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
