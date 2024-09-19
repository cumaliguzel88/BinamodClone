import 'package:binamod_v/data/entity/ready.dart';
import 'package:binamod_v/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class ReadyPage extends StatefulWidget {
  const ReadyPage({super.key});

  @override
  State<ReadyPage> createState() => _ReadyPageState();
}

class _ReadyPageState extends State<ReadyPage> {
  // List of items with different leading icons
  final List<Ready> _readyListItems = [
    Ready(
        id: 1,
        title: "Are the buildings earthquake resistant?",
        subTitle: "Buy/Verify",
        leadingIcon: Icons.home),
    Ready(
        id: 2,
        title: "Is home insurance done?",
        subTitle: "Buy/Verify",
        leadingIcon: Icons.verified_user_outlined),
    Ready(
        id: 3,
        title: "Places with earthquake kits?",
        subTitle: "Buy/Verify",
        leadingIcon: Icons.medical_services_outlined),
    Ready(
        id: 4,
        title: "My family-friends?",
        subTitle: "Add",
        leadingIcon: Icons.people),
    Ready(
        id: 5,
        title: "Earthquake scenario meeting point?",
        subTitle: "Add",
        leadingIcon: Icons.map),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: AppBar(
        title: const Text("Hello Cumali"),
      ),
      body: Column(
        children: [
          // Title text
          Card(
            margin: const EdgeInsets.all(20),
            elevation: 5,
            child: Center(
              child: Text(
                "Earthquake Preparation",
                style: TextStyle(
                    fontSize: 25,
                    color: colorIndigo,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Expanded ListView
          Expanded(
            child: ListView.builder(
              itemCount: _readyListItems.length,
              itemBuilder: _listFx,
            ),
          ),
        ],
      ),
    );
  }

  // List view builder function
  Widget _listFx(BuildContext context, int index) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            _readyListItems[index].title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            _readyListItems[index].subTitle,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: const Icon(Icons.info_outline, size: 25),
          leading: Icon(_readyListItems[index].leadingIcon, size: 32),
        ),
      ),
    );
  }
}
