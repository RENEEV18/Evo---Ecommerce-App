import 'package:evo_mart/common/const/const.dart';
import 'package:flutter/material.dart';

class OfferTextWidget {
  Widget offerText(String text) {
    return RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(
            child: Icon(
              Icons.local_offer_rounded,
              color: Colors.green,
            ),
          ),
          TextSpan(
            text: text,
            style: const TextStyle(color: kBlack),
          ),
        ],
      ),
    );
  }
}
