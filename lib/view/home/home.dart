import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/view/home/widgets/category_widget.dart';
import 'package:evo_mart/view/home/widgets/carousel_widget.dart';
import 'package:evo_mart/view/home/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          height: MediaQuery.of(context).size.height * 0.05,
          image: const AssetImage(
              "assets/images/EVO_Final-removebg-preview 1.png"),
          // color: kBlack,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
          ),
        ],
        bottom: AppBar(),
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
  }
}
