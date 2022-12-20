import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/view/home/widgets/SliderWidget.dart';
import 'package:evo_mart/view/home/widgets/carousel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.shopify),
        title: const CupertinoSearchTextField(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight,
              Row(
                children: const [
                  kHeadLineWidth,
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              kSize,
              const SlidingWidget(),
              const CarouselSliderWidget(),
              Row(
                children: const [
                  Text(
                    'Newly Launched Phones !',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              kSize,
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/ezgif.com-gif-maker (4).png'),
                      fit: BoxFit.cover),
                ),
              ),
              kSize,
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: const Image(
                        image: AssetImage('assets/images/EU-IN_Green.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  kWidth,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Offer Zone !',
                          style:
                              TextStyle(fontSize: 28, fontFamily: 'Comfortaa'),
                        ),
                        Text(
                            'One Plus 10 Pro 5G series - GOES OFFICIAL \n From ₹49,999'),
                      ],
                    ),
                  ),
                ],
              ),
              kSize,
              Row(
                children: const [
                  kWidth,
                  Text(
                    'Best Seller Phones',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              kSize,
              GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4),
                itemBuilder: (context, index) {
                  return Container(
                    // height: 90,
                    color: Colors.black.withOpacity(0.1),
                  );
                },
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
