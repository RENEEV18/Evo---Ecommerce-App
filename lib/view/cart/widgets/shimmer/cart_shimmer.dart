import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/wishlist/wishlist_provider.dart';
import 'package:evo_mart/view/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);

    return ListView.separated(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                kWidth,
                const ShimmerWidget.rectangle(height: 100, width: 100),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ShimmerWidget.rectangle(height: 10, width: 30),
                      const ShimmerWidget.rectangle(height: 10, width: 30),
                      Row(
                        children: const [
                          ShimmerWidget.rectangle(height: 10, width: 30),
                          kWidth,
                          ShimmerWidget.rectangle(height: 10, width: 30),
                          kWidth,
                          ShimmerWidget.rectangle(height: 10, width: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            kSize,
          ],
        );
      },
      itemCount: provider.cartList?.products.length ?? 0,
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
