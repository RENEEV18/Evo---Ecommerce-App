import 'package:evo_mart/common/const/const.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: kTextfieldColor,
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: Image.asset(
                  'assets/images/Group Videos & Shared Albums _ Memento.png',
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.50,
              color: Colors.black.withOpacity(0.2),
              padding: const EdgeInsets.only(left: 30, top: 380),
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Please your eyes on the ',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        color: kBlack,
                        fontSize: 30,
                      ),
                    ),
                    TextSpan(
                      text: 'trending\n items',
                      style: TextStyle(
                          color: kWhite,
                          fontFamily: 'Manrope',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\non',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 30,
                          color: kWhite,
                          fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: ' Evo',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 30,
                        color: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
