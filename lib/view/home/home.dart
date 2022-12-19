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
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                kHeight,
                Row(
                  children: const [
                    kWidth,
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SlidingWidget(),
                const CarouselSliderWidget(),
                Row(
                  children: const [
                    kWidth,
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
                SizedBox(
                  //width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 20,
                        width: 20,
                        color: kBlack,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
