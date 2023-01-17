import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCategoryScreen extends StatelessWidget {
  const ViewCategoryScreen({super.key});

  static const routeName = "/view_category.dart";
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final provider = Provider.of<HomeProvider>(context, listen: false)
        .findByCategoryId(productId);
    final data =
        Provider.of<HomeProvider>(context, listen: false).findByName(productId);
    final value = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.name,
          style: const TextStyle(
            fontFamily: "Manrope",
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSize,
              Padding(
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
                    return GestureDetector(
                      onTap: () {
                        // value.fromCategoryToProductView(context, index);
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
                                  'http://172.16.5.206:5005/products/${provider[index].image[0]}'),
                              //fit: BoxFit.cover,
                            ),
                            kSize,
                            Text(
                              provider[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Manrope"),
                            ),
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
                              "₹${(provider[index].price - provider[index].discountPrice).round()}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: kRed,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Manrope'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: provider.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
