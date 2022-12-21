import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      ((timeStamp) {
        Provider.of<SplashProvider>(context, listen: false)
            .splashTimer(context);
      }),
    );
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          'Evo',
          style: TextStyle(fontFamily: 'Comfortaa', color: kWhite),
        ),
      ),
    );
  }
}
