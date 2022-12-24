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
                childAspectRatio: 6 / 8,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 130,
                      image: NetworkImage(
                          'http://172.16.5.206:5005/uploads/products/${value.productList[index].image[0]}'),
                      //fit: BoxFit.cover,
                    ),
                    kSize,
                    Text(
                      value.productList[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    kSize,
                    Text(
                      "₹${value.productList[index].price}",
                      style: const TextStyle(
                          fontSize: 20,
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
