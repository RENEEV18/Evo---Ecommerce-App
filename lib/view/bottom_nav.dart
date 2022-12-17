import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:evo_mart/common/const/const.dart';
import 'package:evo_mart/controller/providers/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, data, child) {
      return Scaffold(
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: kWhite,
          elevation: 0,
          icons: data.icons,
          gapLocation: GapLocation.none,
          activeIndex: data.currentIndex,
          onTap: (value) {
            data.bottomNav(value);
          },
        ),
        body: data.screens[data.currentIndex],
      );
    });
  }
}
