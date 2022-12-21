import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/intro_provider.dart';
import 'package:evo_mart/view/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    fontFamily: 'Comfortaa',
                    color: kWhite,
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text: 'trending\n items',
                  style: TextStyle(
                      color: kWhite,
                      fontFamily: 'Comfortaa',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '\non',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 30,
                      color: kWhite,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: ' Evo',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kWhite,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => SigninScreen(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
