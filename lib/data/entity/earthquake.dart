import 'dart:convert';

class Earthquake {
  final String tarih;
  final String saat;
  final String enlem;
  final String boylam;
  final String derinlik;
  final String buyukluk;
  final String yer;
  final String sehir;

  Earthquake({
    required this.tarih,
    required this.saat,
    required this.enlem,
    required this.boylam,
    required this.derinlik,
    required this.buyukluk,
    required this.yer,
    required this.sehir,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      tarih: json['tarih'],
      saat: json['saat'],
      enlem: json['enlem'],
      boylam: json['boylam'],
      derinlik: json['derinlik'],
      buyukluk: json['buyukluk'],
      yer: json['yer'],
      sehir: json['sehir'],
    );
  }
}

List<Earthquake> parseEarthquakes(String jsonResponse) {
  final parsed = json.decode(jsonResponse).cast<Map<String, dynamic>>();
  return parsed.map<Earthquake>((json) => Earthquake.fromJson(json)).toList();
}
