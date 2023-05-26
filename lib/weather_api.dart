import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'weather_json.dart';

Future<WeatherInfo> getWeatherJson() async {
  stdout.writeln('Enter your longitude:');
  final inputLon = stdin.readLineSync();
  stdout.writeln('Enter your latitude now:');
  final inputLat = stdin.readLineSync();

  String weatherUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=$inputLat&lon=$inputLon&appid=e060e0b38d18d8565acae769a8efcad6';
  final weatherApiUrl = Uri.parse(weatherUrl);
  final weatherInfo = await http.get(weatherApiUrl);
  final weatherJsonInfo = json.decode(weatherInfo.body) as Map<String, dynamic>;

  return WeatherInfo.fromJson(weatherJsonInfo);
}
