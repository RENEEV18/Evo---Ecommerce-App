import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/onboard_provider/intro_provider.dart';
import 'package:evo_mart/view/intro_screen/widgets/first_screen.dart';
import 'package:evo_mart/view/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<IntroProvider>(
        builder: (context, value, child) {
          return Stack(
            children: [
              PageView(
                controller: value.controller,
                children: const [
                  FirstScreen(),
                  FirstScreen(),
                  FirstScreen(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmoothPageIndicator(
                    controller: value.controller,
                    count: 3,
                    effect: const WormEffect(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return SigninScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(color: kBlack),
                        ))),
              ),
            ],
          );
        },
      )),
    );
  }
}
