import 'package:binamod_v/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AdreesPage extends StatefulWidget {
  const AdreesPage({
    super.key,
  });

  @override
  State<AdreesPage> createState() => _AdreesPageState();
}

class _AdreesPageState extends State<AdreesPage> {
  //text controller
  TextEditingController controller = TextEditingController();
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
                padding: const EdgeInsets.all(50),
                child: Text(
                  "Adrres Info",
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
                  Icons.map,
                  color: colorIndigo,
                  size: 50,
                ),
              ),
              //log text
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Address of the Selected Buildings"),
                ),
              ),

              //add button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4, backgroundColor: colorIndigo),
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(color: colorWhite, fontSize: 17),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
