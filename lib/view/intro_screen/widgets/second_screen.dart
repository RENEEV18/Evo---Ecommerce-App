import 'package:evo_mart/common/const/const.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Image.asset(
              'assets/images/Advertisement_for_mobile_application__Excited_african_guy_dancing___-removebg-preview.png',
            ),
          ),
        ),
        Positioned(
          top: 155,
          left: 121,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.21,
            width: MediaQuery.of(context).size.width * 0.20,
            decoration: BoxDecoration(
              color: kBlack,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'EVO',
                style: TextStyle(color: kWhite),
              ),
            ),
          ),
        ),
        // Container(
        //   height: double.infinity,
        //   width: MediaQuery.of(context).size.width * 0.50,
        //   // color: Colors.black.withOpacity(0.2),
        //   padding: const EdgeInsets.only(left: 30, top: 380),
        // ),
      ],
    );
  }
}
