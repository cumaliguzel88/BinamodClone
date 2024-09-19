import 'package:binamod_v/ui/drawer/my_info_pages.dart';
import 'package:binamod_v/ui/drawer/settings_page.dart';
import 'package:binamod_v/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "My Info",
          baseStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          colorLineSelected: colorBlack,
          selectedStyle: TextStyle(
            color: colorWhite,
          ),
        ),
        MyInfoPages(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Settings",
          baseStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          colorLineSelected: colorBlack,
          selectedStyle: TextStyle(
            color: colorWhite,
          ),
        ),
        SettingsPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: colorIndigo,
      initPositionSelected: 0,
      slidePercent: 40,
    );
  }
}
