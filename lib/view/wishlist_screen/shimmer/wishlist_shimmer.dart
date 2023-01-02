import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/wishlist/wishlist_provider.dart';
import 'package:evo_mart/view/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListShimmer extends StatelessWidget {
  const WishListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WishlistProvider>(context, listen: false);
    return ListView.separated(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          ShimmerWidget.rectangle(height: 10, width: 20),
                          kWidth,
                          ShimmerWidget.rectangle(height: 10, width: 30),
                          kWidth,
                          ShimmerWidget.rectangle(height: 10, width: 30),
                        ],
                      ),
                    ],
                  ),
                ),
                kwishWidth,
                const ShimmerWidget.circle(height: 30, width: 30),
              ],
            ),
            kSize,
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: provider.wishList.length,
    );
  }
}
