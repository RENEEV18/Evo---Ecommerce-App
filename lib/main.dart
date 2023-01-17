import 'package:evo_mart/controller/providers/address/address_controller.dart';
import 'package:evo_mart/controller/providers/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:evo_mart/controller/providers/cart/cart_provider.dart';
import 'package:evo_mart/controller/providers/home_provider/home_controllers.dart';
import 'package:evo_mart/controller/providers/onboard_provider/intro_provider.dart';
import 'package:evo_mart/controller/providers/authentication_provider/sign_in_provider.dart';
import 'package:evo_mart/controller/providers/authentication_provider/sign_up_provider.dart';
import 'package:evo_mart/controller/providers/authentication_provider/verify_otp_provider.dart';
import 'package:evo_mart/controller/providers/onboard_provider/splash_provider.dart';
import 'package:evo_mart/controller/providers/orders/order_controller.dart';
import 'package:evo_mart/controller/providers/payment/payment_provider.dart';
import 'package:evo_mart/controller/providers/product_screen_provider/product_screen_provider.dart';
import 'package:evo_mart/controller/providers/profile_provider/profile_provider.dart';
import 'package:evo_mart/controller/providers/wishlist/wishlist_provider.dart';
import 'package:evo_mart/view/home/widgets/view_category.dart';
import 'package:evo_mart/view/orders/orders_page.dart';
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
    precacheImage(
        const AssetImage('assets/images/EVO_Final-removebg-preview 1.png'),
        context);
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
          create: (context) => ProfileProvider(context),
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
        ChangeNotifierProvider(
          create: (context) => AddressProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => OrdersProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ProductView.routeName: (context) {
            return const ProductView();
          },
          ViewCategoryScreen.routeName: (context) {
            return const ViewCategoryScreen();
          },
          OrderPageScreen.routeName: (context) => const OrderPageScreen(),
        },
        theme: ThemeData(useMaterial3: true, primarySwatch: Colors.amber),
        home: const SplashScreen(),
      ),
    );
  }
}
