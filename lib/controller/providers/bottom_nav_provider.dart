import 'package:evo_mart/view/home/home.dart';
import 'package:evo_mart/view/profile_screen/profle_screen.dart';
import 'package:evo_mart/view/search_screen/search_screen.dart';
import 'package:evo_mart/view/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  List<IconData> icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.bagShopping,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.solidUser,
  ];
  void bottomNav(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
