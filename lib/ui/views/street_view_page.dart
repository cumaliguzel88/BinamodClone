import 'package:binamod_v/ui/theme/colors.dart';
import 'package:binamod_v/ui/views/upload/house_named_page.dart'; // Path to your HouseNamedPage
import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart'
    as street_view;
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;

class StreetViewPage extends StatefulWidget {
  final google_maps.LatLng? position;

  const StreetViewPage({super.key, this.position});

  @override
  State<StreetViewPage> createState() => _StreetViewPageState();
}

class _StreetViewPageState extends State<StreetViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: colorWhite,
            )),
        backgroundColor: colorIndigo,
        title: Text(
          "Street View",
          style: TextStyle(
              color: colorWhite, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            widget.position == null
                ? const Center(child: Text('No position selected'))
                : street_view.FlutterGoogleStreetView(
                    zoomControl: true,
                    initPos: street_view.LatLng(
                      widget.position!.latitude,
                      widget.position!.longitude,
                    ),
                    initSource: street_view.StreetViewSource.outdoor,
                  ),
            Positioned(
              bottom: 20,
              left: 50,
              right: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HouseNamedPage(
                        position: widget.position,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorIndigo,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Select the Building",
                  style: TextStyle(fontSize: 17, color: colorWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
