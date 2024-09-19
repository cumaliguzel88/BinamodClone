import 'package:binamod_v/ui/theme/colors.dart';
import 'package:binamod_v/ui/views/buildings.dart';
import 'package:binamod_v/ui/views/maps_page.dart';
import 'package:binamod_v/ui/views/menu.dart';
import 'package:binamod_v/ui/views/notification_page.dart';
import 'package:binamod_v/ui/views/ready_page.dart';
import 'package:flutter/material.dart';

class BottomnavPage extends StatefulWidget {
  const BottomnavPage({super.key});

  @override
  State<BottomnavPage> createState() => _BottomnavPageState();
}

class _BottomnavPageState extends State<BottomnavPage> {
  //default index definition
  int selectedIndex = 2;
  //add pages
  var pages = [
    const Menu(),
    const NotificationPage(),
    const MapsPage(),
    const Buildings(),
    const ReadyPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedItemColor: colorBlack,
          unselectedItemColor: colorGrey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                  color: colorBlack,
                ),
                label: "Menu"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notification_important_rounded,
                  color: colorBlack,
                ),
                label: "Notifications"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.map_outlined,
                  color: colorBlack,
                  size: 27,
                ),
                label: "Map"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_work_sharp,
                  color: colorBlack,
                ),
                label: "Buildings"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shield_rounded,
                  color: colorBlack,
                ),
                label: "Ready"),
          ]),
      body: pages[selectedIndex],
    );
  }
}
