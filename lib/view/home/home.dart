import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/view/home/widgets/category_widget.dart';
import 'package:evo_mart/view/home/widgets/carousel_widget.dart';
import 'package:evo_mart/view/home/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          height: 35,
          image: AssetImage("assets/images/lOGO.png"),
          color: kBlack,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.1),
              ),
              child: const Icon(Icons.search),
            ),
          ),
          kWidth,
        ],
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
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: Container(
              //     height: 250,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       image: const DecorationImage(
              //         image: AssetImage(
              //             'assets/images/ezgif.com-gif-maker (4).png'),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ),
              // Row(
              //   children: [
              //     kHeadLineWidth,
              //     Flexible(
              //       child: SizedBox(
              //         height: MediaQuery.of(context).size.height * 0.35,
              //         width: MediaQuery.of(context).size.width * 0.45,
              //         child: const Image(
              //           image: AssetImage('assets/images/EU-IN_Green.png'),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ),
              //     kWidth,
              //     Flexible(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: const [
              //           Text(
              //             'Offer Zone !',
              //             style: TextStyle(
              //                 fontSize: 28,
              //                 fontFamily: 'Manrope',
              //                 fontWeight: FontWeight.bold),
              //           ),
              //           Text(
              //               'One Plus 10 Pro 5G series - GOES OFFICIAL \n From ₹49,999'),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   children: const [
              //     kWidth,
              //     Text(
              //       'All Products',
              //       style: TextStyle(
              //         fontFamily: 'Manrope',
              //         fontWeight: FontWeight.bold,
              //         letterSpacing: 1.2,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ],
              // ),
              kSize,
              const ProductWidget()
            ],
          ),
        ),
      ),
    );
  }
}
