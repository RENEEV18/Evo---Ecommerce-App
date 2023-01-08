import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/view/home/shimmer/product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return value.isLoading == true
            ? const ProductShimmer()
            : Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 8,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0),
                  itemBuilder: (context, index) {
                    return Consumer<HomeProvider>(
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            value.toProductScreen(context, index);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: const BoxDecoration(
                                        color: kTextfieldColor,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(30),
                                        ),
                                      ),
                                      child: Text(
                                        "${value.productList[index].offer}%Off",
                                        style: const TextStyle(
                                          color: kWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "Manrope",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                kSize,
                                Image(
                                  height: 130,
                                  image: NetworkImage(
                                      'http://172.16.5.206:5005/products/${value.productList[index].image[0]}'),
                                  //fit: BoxFit.cover,
                                ),
                                kSize,
                                Text(
                                  value.productList[index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Manrope"),
                                ),
                                kSize,
                                Text(
                                  "₹${value.productList[index].price}",
                                  style: const TextStyle(
                                      color: kgery,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                      fontFamily: 'Manrope'),
                                ),
                                kSize,
                                Text(
                                  "₹${(value.productList[index].price - value.productList[index].discountPrice).round()}",
                                  style: const TextStyle(
                                    color: kRed,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Manrope",
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: value.productList.length,
                ),
              );
      },
    );
  }
}
