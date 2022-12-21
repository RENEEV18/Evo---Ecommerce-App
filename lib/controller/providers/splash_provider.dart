import 'dart:async';
import 'dart:developer';
import 'package:evo_mart/view/bottom_nav.dart';
import 'package:evo_mart/view/intro_screen/welcome_screen.dart';
import 'package:evo_mart/view/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashProvider extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? onboardValue;
  String? signinCheck;

  void splashTimer(context) {
    Timer(
      const Duration(seconds: 3),
      () async {
        onboardValue = await storage.read(key: 'onboard');
        signinCheck = await storage.read(key: 'token');
        log(signinCheck.toString());
        if (signinCheck != null) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return const BottomNav();
            },
          ), (route) => false);
        } else {
          if (onboardValue != null) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) {
                return SigninScreen();
              },
            ), (route) => false);
          } else {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) {
                return const WelcomeScreen();
              },
            ), (route) => false);
          }
        }
      },
    );
  }
}
