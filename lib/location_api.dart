import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> printLocationInfo() async {
  final Location location = await getLocationInfo();
  final LocationInfo locationInfo = location.locations.first;

  print('Name: ${locationInfo.name}');
  print('Latitude: ${locationInfo.latitude}');
  print('Longitude: ${locationInfo.longitude}');
  print('Country: ${locationInfo.country}');
}

Future<Location> getLocationInfo() async {
  String locationUrl =
      'https://api.openweathermap.org/geo/1.0/direct?q=Kathmandu&limit=3&appid=e060e0b38d18d8565acae769a8efcad6';
  final locationApiUrl = Uri.parse(locationUrl);
  final locationInfo = await http.get(locationApiUrl);
  final locationJsonInfo = json.decode(locationInfo.body);

  return Location.fromJson(locationJsonInfo as List);
}

class Location {
  final List<LocationInfo> locations;

  Location({
    required this.locations,
  });

  factory Location.fromJson(List<dynamic> json) {
    List<LocationInfo> locations =
        json.map((e) => LocationInfo.fromJson(e)).toList();

    return Location(locations: locations);
  }
}

class LocationInfo {
  final String name;
  final Map<String, String>? localNames;
  final double latitude;
  final double longitude;
  final String country;

  LocationInfo({
    required this.name,
    required this.localNames,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory LocationInfo.fromJson(Map<String, dynamic>? json) {
    return LocationInfo(
        name: json?['name'] as String,
        localNames: json?['local_names'] != null
            ? Map<String, String>.from(
                json?['local_names'] as Map<String, dynamic>)
            : null,
        latitude: json?['lat'] as double,
        longitude: json?['lon'] as double,
        country: json?['country'] as String);
  }
}
