//this page contains houses
import 'package:binamod_v/data/entity/houses.dart';
import 'package:binamod_v/ui/theme/colors.dart';
import 'package:binamod_v/ui/views/house_detail.dart';
import 'package:flutter/material.dart';

class Buildings extends StatefulWidget {
  const Buildings({super.key});

  @override
  State<Buildings> createState() => _BuildingsState();
}

class _BuildingsState extends State<Buildings> {
  //houses list
  final List<Houses> _housesList = [
    Houses(
        id: 1,
        houseTitle: "Cumali Guzel's House",
        houseSubTitle: "My family house in Maltepe, Istanbul"),
    Houses(
        id: 2,
        houseTitle: "Cumali Guzel's House",
        houseSubTitle: "Dad house in Bostancı,Istanbul"),
    Houses(
        id: 3,
        houseTitle: "Cumali Guzel's House",
        houseSubTitle: "Village house in Kumlu,Hatay"),
    Houses(
        id: 4,
        houseTitle: "Uncle House",
        houseSubTitle: "Uncle house in Kartal/Istanbul"),
    Houses(
        id: 5,
        houseTitle: "Brother House",
        houseSubTitle: "Brother house in Bebek/Istanbul"),
    Houses(
        id: 6,
        houseTitle: "Cumali Guzel's second House",
        houseSubTitle: "My family second home Maltepe, Istanbul"),
  ];
  //search text field controller variable
  final TextEditingController _controllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: colorRed, borderRadius: BorderRadius.circular(20)),
            height: 190,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //user name and last name
                CircleAvatar(
                  child: const Text(
                    "CG",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  radius: 35,
                  backgroundColor: colorWhite,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Cumali Guzel",
                  style: TextStyle(color: colorWhite, fontSize: 25),
                ),
              ],
            ),
          ),
          //search text field
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: TextField(
              controller: _controllerSearch,
              decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: const Icon(Icons.search_rounded)),
            ),
          ),
          //card title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Buildings",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorIndigo),
            ),
          ),
          //user houses list
          Expanded(
              child: ListView.builder(
            itemBuilder: _listViewItem,
            itemCount: _housesList.length,
          )),
        ],
      ),
    );
  }

// List view builder function
  Widget _listViewItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HouseDetail(houses: _housesList[index])));
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(_housesList[index].houseTitle),
            subtitle: Text(_housesList[index].houseSubTitle),
            leading: const Icon(Icons.house),
            trailing: const Icon(Icons.navigate_next_sharp),
          ),
        ),
      ),
    );
  }
}
