import 'package:weathercli/print_location.dart';
import 'package:weathercli/print_weather.dart';

void main() async {
  await printLocationInfo();
  await printWeatherInfo();
}
