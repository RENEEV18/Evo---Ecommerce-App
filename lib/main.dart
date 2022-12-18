import 'package:evo_mart/controller/providers/bottom_nav_provider.dart';
import 'package:evo_mart/controller/providers/sign_in_provider.dart';
import 'package:evo_mart/controller/providers/sign_up_provider.dart';
import 'package:evo_mart/controller/providers/verify_otp_provider.dart';
import 'package:evo_mart/view/bottom_nav.dart';
import 'package:evo_mart/view/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromARGB(255, 255, 255, 255),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VerifyOtpProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, primarySwatch: Colors.amber),
        home: SigninScreen(),
      ),
    );
  }
}
