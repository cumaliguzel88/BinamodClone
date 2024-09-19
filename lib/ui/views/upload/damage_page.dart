import 'package:binamod_v/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class DamagePage extends StatefulWidget {
  final String houseName;

  DamagePage({required this.houseName});

  @override
  State<DamagePage> createState() => _DamagePageState();
}

class _DamagePageState extends State<DamagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.home_work_outlined,
                            color: colorIndigo,
                          ),
                          Text(
                            widget.houseName,
                            style: TextStyle(
                                fontSize: 27,
                                color: colorIndigo,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(36),
                  child: Text(
                    "Is There Any Damage to the Structure",
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
                    Icons.water_damage_rounded,
                    color: colorIndigo,
                    size: 70,
                  ),
                ),
                //yes or no button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 4, backgroundColor: colorIndigo),
                          onPressed: () {},
                          child: Text(
                            "Yes",
                            style: TextStyle(color: colorWhite, fontSize: 15),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 4, backgroundColor: colorIndigo),
                          onPressed: () {},
                          child: Text(
                            "No",
                            style: TextStyle(color: colorWhite, fontSize: 15),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
