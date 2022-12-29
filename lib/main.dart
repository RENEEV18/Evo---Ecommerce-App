import 'package:evo_mart/controller/providers/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/controller/providers/onboard_provider/intro_provider.dart';
import 'package:evo_mart/controller/providers/authentication_provider/sign_in_provider.dart';
import 'package:evo_mart/controller/providers/authentication_provider/sign_up_provider.dart';
import 'package:evo_mart/controller/providers/authentication_provider/verify_otp_provider.dart';
import 'package:evo_mart/controller/providers/onboard_provider/splash_provider.dart';
import 'package:evo_mart/controller/providers/product_screen_provider/product_screen_provider.dart';
import 'package:evo_mart/controller/providers/profile_provider/profile_provider.dart';
import 'package:evo_mart/controller/providers/wishlist/wishlist_provider.dart';
import 'package:evo_mart/view/product_screen/product_view.dart';
import 'package:evo_mart/view/splash_screen/splash_screen.dart';
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
        ChangeNotifierProvider(
          create: (context) => IntroProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(context),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ProductView.routeName: (context) {
            return const ProductView();
          }
        },
        theme: ThemeData(useMaterial3: true, primarySwatch: Colors.amber),
        home: const SplashScreen(),
      ),
    );
  }
}
