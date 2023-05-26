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
