import 'package:binamod_v/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/entity/earthquake.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late Future<List<Earthquake>> futureEarthquakes;
  Set<Circle> _circles = {};
  LatLng? _selectedPosition;
  String? _selectedInfo;

  @override
  void initState() {
    super.initState();
    futureEarthquakes = loadEarthquakeData();
  }

  Future<List<Earthquake>> loadEarthquakeData() async {
    final String response = await rootBundle.loadString('assets/deprem.json');
    return parseEarthquakes(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorIndigo,
          title: Text(
            'Recent Earthquakes',
            style: TextStyle(color: colorWhite),
          )),
      body: FutureBuilder<List<Earthquake>>(
        future: futureEarthquakes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final earthquakes = snapshot.data!;
            _circles = earthquakes.map((e) {
              return Circle(
                circleId: CircleId(e.tarih + e.saat),
                center: LatLng(double.parse(e.enlem), double.parse(e.boylam)),
                radius: 16000,
                fillColor: Colors.red.withOpacity(0.5),
                strokeColor: Colors.red,
                strokeWidth: 1,
                consumeTapEvents: true,
                onTap: () {
                  setState(() {
                    _selectedPosition =
                        LatLng(double.parse(e.enlem), double.parse(e.boylam));
                    _selectedInfo =
                        '${e.buyukluk} Büyüklüğünde Deprem\n${e.yer}, ${e.tarih} ${e.saat}, Derinlik : ${e.derinlik}';
                  });
                },
              );
            }).toSet();

            return Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      double.parse(earthquakes[0].enlem),
                      double.parse(earthquakes[0].boylam),
                    ),
                    zoom: 5,
                  ),
                  circles: _circles,
                ),
                if (_selectedPosition != null && _selectedInfo != null)
                  Positioned(
                    bottom: 50,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white.withOpacity(0.8),
                      child: Text(
                        _selectedInfo!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          } else {
            return const Center(child: Text('Veri bulunamadı.'));
          }
        },
      ),
    );
  }
}
