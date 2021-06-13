import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> Gelecekodevgetir() async {
  String url2 = '';
  var data2 = {
    "uid": "",
    "odevcheck": "0"
  };

  final response2 = await http.post(Uri.parse(url2),
      body: data2, headers: {"Accept": "application/json"});

  var respons2Body = json.decode(response2.body);
  print(respons2Body);
  return respons2Body;
}

Future<List<dynamic>> Gecmisodevgetir() async {
  String url2 = '';
  var data2 = {
    "uid": "",
    "odevcheck": "1"
  };

  final response2 = await http.post(Uri.parse(url2),
      body: data2, headers: {"Accept": "application/json"});

  var respons2Body = json.decode(response2.body);
  print(respons2Body);
  return respons2Body;
}

Future<List<dynamic>> bildirimgetir() async {
  String url3 = '';
  var data3 = {
    "uid": "",
  };

  final response3 = await http.post(Uri.parse(url3),
      body: data3, headers: {"Accept": "application/json"});

  var respons3Body = json.decode(response3.body);
  print(respons3Body);
  return respons3Body;
}

Future<List<Etkinlik>> takvimgetir() async {
  String url4 = '';
  var data4 = {
    "uid": "",
  };

  final response4 = await http.post(Uri.parse(url4),
      body: data4, headers: {"Accept": "application/json"});

  List<dynamic> respons4Body = json.decode(response4.body);
  List<Etkinlik> etkinlikler = respons4Body.map((dynamic item) => Etkinlik.fromJson(item)).toList();


  print(respons4Body);
  return etkinlikler;
}


class Etkinlik {
  final String baslik;
  final String baslatarih;
  final String bitistarih;

  Etkinlik({
    required this.baslik,
    required this.baslatarih,
    required this.bitistarih,
  });

  factory Etkinlik.fromJson(Map<String, dynamic> json) {

    return Etkinlik(
      baslik: json['baslik'] as String,
      baslatarih: json['baslatarih'] as String,
      bitistarih: json['bitistarih'] as String,
    );
  }

}

