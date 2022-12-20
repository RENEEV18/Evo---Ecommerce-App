import 'package:flutter/material.dart';

// size
const kSize = SizedBox(
  height: 10,
);
const kGapSize = SizedBox(
  height: 30,
);
const kOtpSize = SizedBox(
  height: 40,
);
const kHeight = SizedBox(
  height: 20,
);
const kWidth = SizedBox(
  width: 10,
);
const kHeadLineWidth = SizedBox(
  width: 20,
);

//colors
const kWhite = Colors.white;
const kBlue = Colors.blue;
const kBlack = Colors.black;
const kHintBlack = Color.fromARGB(178, 0, 0, 0);
const kTextfieldColor = Colors.orange;
const kGrey = Color.fromARGB(200, 255, 255, 255);

//style
const kUsernameStyle = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 15,
    fontFamily: 'Manrope');

//images
List<Widget> images = [
  Image(
    image: AssetImage('assets/images/782d2b0291f3b0284fc48b17623f3324.png'),
    fit: BoxFit.cover,
  ),
  Image.asset('assets/images/782d2b0291f3b0284fc48b17623f3324.png'),
  Image.asset('assets/images/8613d80ed1b4b6f57679223da9524083.png'),
  Image.asset('assets/images/e26b44f88af3e4c75883a26deb6fd0fb.png'),
  Image.asset('assets/images/ff2ae61ddb8b41f0c1cd05df79db0fb1.png'),
  Image.asset('assets/images/de70e2826968a10f5c5b0442e1c0b246.png'),
];

//text
List<String> text = ['Realme', 'Oppo', 'Apple', 'Samsung', 'Redmi'];
