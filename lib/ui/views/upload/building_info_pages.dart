import 'package:binamod_v/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class BuildingInfoPages extends StatefulWidget {
  const BuildingInfoPages({super.key});

  @override
  State<BuildingInfoPages> createState() => _BuildingInfoPagesState();
}

class _BuildingInfoPagesState extends State<BuildingInfoPages> {
  //text controller base
  TextEditingController _controllerBase = TextEditingController();
  //text controller floor
  TextEditingController _controllerFloor = TextEditingController();

  int floor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //title
              Padding(
                padding: const EdgeInsets.all(36),
                child: Text(
                  "Number of Floors Info",
                  style: TextStyle(
                      color: colorIndigo,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //circle avatar
              CircleAvatar(
                radius: 70,
                backgroundColor: colorWhite,
                child: Icon(
                  Icons.upload,
                  color: colorIndigo,
                  size: 50,
                ),
              ),
              //text field basement
              Padding(
                padding: const EdgeInsets.all(40),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerBase,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Basement Floor Count : ",
                  ),
                ),
              ),
              //normal floor
              Padding(
                padding: const EdgeInsets.all(40),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerFloor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Normal Floor Count:",
                  ),
                ),
              ),
              //calculate button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4, backgroundColor: colorIndigo),
                  onPressed: () {
                    calculateFloor();
                  },
                  child: Text(
                    "Calculate the Floor",
                    style: TextStyle(color: colorWhite, fontSize: 17),
                  )),
              //result
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Total Floor Count: ${floor.toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //calculate floor method
  void calculateFloor() {
    int basement = int.parse(_controllerBase.text);
    int normal = int.parse(_controllerFloor.text);
    setState(() {
      floor = basement + normal;
    });
  }
}
