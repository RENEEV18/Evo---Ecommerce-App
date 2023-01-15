import 'package:evo_mart/view/cart/cart_screen.dart';
import 'package:evo_mart/view/home/home.dart';
import 'package:evo_mart/view/profile_screen/profle_screen.dart';
import 'package:evo_mart/view/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> screens = const [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  List<IconData> icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.solidHeart,
    FontAwesomeIcons.bagShopping,
    FontAwesomeIcons.solidUser,
  ];
  void bottomNav(int value) {
    currentIndex = value;
    notifyListeners();
  }

  void toAddressScreen(context, String cartId, String productId) {}
}
