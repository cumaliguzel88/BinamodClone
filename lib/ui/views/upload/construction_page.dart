import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class ConstructionPage extends StatefulWidget {
  const ConstructionPage({super.key});

  @override
  State<ConstructionPage> createState() => _ConstructionPageState();
}

class _ConstructionPageState extends State<ConstructionPage> {
  int? selectedYear;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.all(36),
                child: Text(
                  "Construction Year",
                  style: TextStyle(
                      color: colorIndigo,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Circle avatar
              CircleAvatar(
                radius: 70,
                backgroundColor: colorWhite,
                child: Icon(
                  Icons.home_work_sharp,
                  color: colorIndigo,
                  size: 50,
                ),
              ),
              // Dropdown for years
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: DropdownButton<int>(
                  value: selectedYear,
                  hint: Text(
                    "Select Year",
                    style: TextStyle(
                      color: colorIndigo,
                      fontSize: 25,
                    ),
                  ),
                  items: List.generate(
                    2024 - 1990 + 1,
                    (index) => DropdownMenuItem<int>(
                      value: 1990 + index,
                      child: Text(
                        (1990 + index).toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedYear = newValue;
                    });
                  },
                  dropdownColor: colorWhite,
                  icon: Icon(Icons.arrow_drop_down, color: colorIndigo),
                  style: TextStyle(color: colorIndigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
