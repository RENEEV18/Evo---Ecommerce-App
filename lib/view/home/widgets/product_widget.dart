import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
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
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 6),
            itemBuilder: (context, index) {
              return Container(
                color: kWhite,
                child: Column(
                  children: [
                    Image(
                      height: 130,
                      image: NetworkImage(
                          'http://172.16.5.206:5005/uploads/products/${value.productList[index].image[0]}'),
                      //fit: BoxFit.cover,
                    ),
                    Text(value.productList[index].name),
                    Text(
                      "₹${value.productList[index].price}",
                      style: const TextStyle(
                          fontSize: 18,
                          color: kRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
            itemCount: value.productList.length,
          ),
        );
      },
    );
  }
}
