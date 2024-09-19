import 'package:binamod_v/data/entity/houses.dart';
import 'package:flutter/material.dart';

class HouseDetail extends StatefulWidget {
  Houses houses;

  HouseDetail({required this.houses});

  @override
  State<HouseDetail> createState() => _HouseDetailState();
}

class _HouseDetailState extends State<HouseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.houses.houseTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
