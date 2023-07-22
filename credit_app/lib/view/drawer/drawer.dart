import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/about/about.dart';
import 'package:credit_app/view/home/home.dart';
import 'package:credit_app/view/profile/profile.dart';
import 'package:credit_app/view/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<ScreenHiddenDrawer> screens = [
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          selectedStyle: const TextStyle(),
          name: 'Home',
          baseStyle: const TextStyle(fontSize: 20, color: Colors.white),
          colorLineSelected: Colors.white,
        ),
        const HomeScreen()),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          selectedStyle: const TextStyle(),
          name: 'Settings',
          baseStyle: const TextStyle(fontSize: 20, color: Colors.white),
          colorLineSelected: Colors.white,
        ),
        const SettingsScreen()),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          selectedStyle: const TextStyle(),
          name: 'Profile',
          baseStyle: const TextStyle(fontSize: 20, color: Colors.white),
          colorLineSelected: Colors.white,
        ),
        const ProfileScreen()),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          selectedStyle: const TextStyle(),
          name: 'About',
          baseStyle: const TextStyle(fontSize: 20, color: Colors.white),
          colorLineSelected: Colors.white,
        ),
        const AboutScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        initPositionSelected: 0,
        screens: screens,
        slidePercent: 60,
        // backgroundColorAppBar: kDefaultColor,
        backgroundColorContent: Colors.white,
        curveAnimation: Curves.bounceInOut,
        backgroundColorMenu: kDefaultColor);
  }
}
