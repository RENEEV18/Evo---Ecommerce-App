import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/controller/providers/product_screen_provider/product_screen_provider.dart';
import 'package:evo_mart/controller/providers/wishlist/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopItemWidget extends StatelessWidget {
  const TopItemWidget({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return Consumer3<ProductProvider, WishlistProvider, HomeProvider>(
        builder: (context, value, value2, home, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  value.goBackHome(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(left: 5),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white.withOpacity(0.3),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: kWhite,
                ),
              ),
              const CircleAvatar(
                radius: 23,
                backgroundColor: Colors.transparent,
              )
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(right: 5),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white.withOpacity(0.3),
                ),
                child: const Icon(
                  Icons.share,
                  color: kWhite,
                ),
              ),
              const CircleAvatar(
                radius: 23,
                backgroundColor: Colors.transparent,
              )
            ],
          ),
        ],
      );
    });
  }
}
