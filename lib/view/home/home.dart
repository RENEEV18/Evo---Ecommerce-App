import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/view/home/widgets/category_widget.dart';
import 'package:evo_mart/view/home/widgets/carousel_widget.dart';
import 'package:evo_mart/view/home/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, home, child) {
        return Scaffold(
          appBar: AppBar(
            title: CupertinoSearchTextField(
              controller: searchController,
              onChanged: (value) {
                home.search(value.trimRight());
              },
            ),
            // title: Image(
            //   height: MediaQuery.of(context).size.height * 0.05,
            //   image: const AssetImage(
            //       "assets/images/EVO_Final-removebg-preview 1.png"),
            //   // color: kBlack,
            // ),
            // actions: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: const Icon(
            //       Icons.search,
            //       size: 26,
            //     ),
            //   ),
            // ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CarouselSliderWidget(),
                  kHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Free Shipping',
                        style: TextStyle(
                          fontFamily: "Manrope",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Secure Payment',
                        style: TextStyle(
                          fontFamily: "Manrope",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Cash On Delivery',
                        style: TextStyle(
                          fontFamily: "Manrope",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  kHeight,
                  Row(
                    children: const [
                      kHeadLineWidth,
                      Text(
                        'Top Brands',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  kSize,
                  const CategoryWidget(),
                  kHeight,
                  Row(
                    children: const [
                      kWidth,
                      Text(
                        'Newly Launched Phones !',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  kSize,
                  const ProductWidget()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
