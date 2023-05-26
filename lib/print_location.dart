import 'location_api.dart';
import 'location_json.dart';

Future<void> printLocationInfo() async {
  final Location location = await getLocationInfo();
  final LocationInfo locationInfo = location.locations.first;

  print('Name: ${locationInfo.name}');
  print('Latitude: ${locationInfo.latitude}');
  print('Longitude: ${locationInfo.longitude}');
  print('Country: ${locationInfo.country}');
}