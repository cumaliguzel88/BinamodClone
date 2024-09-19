import 'dart:async';

import 'package:binamod_v/ui/theme/colors.dart';
import 'package:binamod_v/ui/views/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HouseNamedPage extends StatefulWidget {
  final LatLng? position;

  const HouseNamedPage({super.key, this.position});

  @override
  State<HouseNamedPage> createState() => _HouseNamedPageState();
}

class _HouseNamedPageState extends State<HouseNamedPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(40.9810569, 29.1999809), // Default position
    zoom: 18,
  );

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setMarkerAndZoom();
    });
  }

  Future<void> _setMarkerAndZoom() async {
    final GoogleMapController controller = await _controller.future;

    if (widget.position != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: widget.position!,
            zoom: 18, // Zoom level
          ),
        ),
      );

      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('selected_location'),
            position: widget.position!,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: const InfoWindow(
              title: "Selected Location",
            ),
          ),
        );
      });
    }
  }

  //text controller
  final TextEditingController _controllerText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: GoogleMap(
                  initialCameraPosition: initialCameraPosition,
                  onMapCreated: (controller) {
                    _controller.complete(controller);
                  },
                  markers: _markers,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(50),
                child: Text(
                  "What would you like to name my code you chose?",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              //house name text
              Padding(
                padding: const EdgeInsets.all(35),
                child: TextField(
                  controller: _controllerText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Enter Buildings Name",
                      prefixIcon: Icon(
                        Icons.home,
                        color: colorIndigo,
                      )),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4, backgroundColor: colorIndigo),
                  onPressed: () {
                    if (_controllerText.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: colorIndigo,
                          content: const Text(
                            "Please Enter Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingPage(
                                  houseName: _controllerText.text)));
                    }
                  },
                  child: Text(
                    "Add the Building",
                    style: TextStyle(color: colorWhite, fontSize: 17),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
