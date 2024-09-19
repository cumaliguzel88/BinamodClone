import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../theme/colors.dart';

class MyInfoPages extends StatelessWidget {
  const MyInfoPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Identify oe tax number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  prefixIcon: const Icon(Icons.person_pin_outlined),
                ),
              ),
              const SizedBox(height: 24),
              IntlPhoneField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              const SizedBox(height: 24),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Surname",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 24),
              //textField  country      //textField city  => in row
              CSCPicker(
                onCountryChanged: (country) {},
                onCityChanged: (city) {},
                onStateChanged: (state) {},
              ),

              const SizedBox(height: 24),
              //adress text field
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Adress",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  prefixIcon: const Icon(Icons.map),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Zip code",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  prefixIcon: const Icon(Icons.code),
                ),
              ),
              //save button
              const SizedBox(height: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4, backgroundColor: colorIndigo),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: colorIndigo,
                        content: Text(
                          "Information Saved",
                          style: TextStyle(
                              color: colorWhite, fontWeight: FontWeight.bold),
                        )));
                  },
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
