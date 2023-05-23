import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_json.dart';

Future<WeatherInfo> getWeatherJson() async {
  String weatherUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=27.7172&lon=85.3240&appid=e060e0b38d18d8565acae769a8efcad6';
  final weatherApiUrl = Uri.parse(weatherUrl);
  final weatherInfo = await http.get(weatherApiUrl);
  final weatherJsonInfo = json.decode(weatherInfo.body) as Map<String, dynamic>;

  return WeatherInfo.fromJson(weatherJsonInfo);
}
