import 'package:binamod_v/ui/theme/colors.dart';
import 'package:binamod_v/ui/views/bottomnav_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: colorIndigo),
      debugShowCheckedModeBanner: false,
      home: BottomnavPage(),
    );
  }
}
