import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location_json.dart';

Future<Location> getLocationInfo() async {
  stdout.writeln('Type the city name:');
  final input = stdin.readLineSync();
  String locationUrl =
      'https://api.openweathermap.org/geo/1.0/direct?q=$input&limit=3&appid=e060e0b38d18d8565acae769a8efcad6';
  final locationApiUrl = Uri.parse(locationUrl);
  final locationInfo = await http.get(locationApiUrl);
  final locationJsonInfo = json.decode(locationInfo.body);

  return Location.fromJson(locationJsonInfo as List);
}

