
import 'package:ansi_styles/ansi_styles.dart';

import 'weather_api.dart';
import 'weather_json.dart';

Future<void> printWeatherInfo() async {
  final WeatherInfo weatherInfo;
  weatherInfo = await getWeatherJson();


  print(AnsiStyles.bold('Weather Information'));
  print('\n');
  print(AnsiStyles.green(
      'Coordinates: Latitude: ${weatherInfo.coordinates?.lat}    Longitude: ${weatherInfo.coordinates?.lon}'));
  print(AnsiStyles.yellow(
      'Weather :\n    ID: ${weatherInfo.weather?[0].id}\n    Main: ${weatherInfo.weather?[0].main}\n    Description: ${weatherInfo.weather?[0].description}\n    Icon: ${weatherInfo.weather?[0].icon}'));
  print(AnsiStyles.cyan('Base: ${weatherInfo.base} '));
  print(AnsiStyles.greenBright('Visibility: ${weatherInfo.visibility}'));
  print(AnsiStyles.magentaBright(
      'Wind Speed:\n    ${weatherInfo.wind.speed}\n    ${weatherInfo.wind.deg}'));
  print(AnsiStyles.green(
      'Main Data:\n   Feels Like: ${weatherInfo.maindata.feelsLike}\n   Temperature: ${weatherInfo.maindata.temp}\n   Max Temp: ${weatherInfo.maindata.tempMax}\n   Min Temp: ${weatherInfo.maindata.tempMin}\n   Humidity: ${weatherInfo.maindata.humidity}\n   Pressure: ${weatherInfo.maindata.pressure}'));
  print(AnsiStyles.redBright('Rain: ${weatherInfo.rain?.oneHour}'));
  print(AnsiStyles.whiteBright('Clouds: ${weatherInfo.clouds.all}'));
  print(AnsiStyles.yellowBright(
      'Time Data Calculation: ${weatherInfo.timeDataCalculation}'));
  print(AnsiStyles.blue(
      'System Data:\n    ID: ${weatherInfo.system.id}\n    Country: ${weatherInfo.system.country}\n    Sunrise: ${weatherInfo.system.sunrise}\n    Sunset: ${weatherInfo.system.sunset}\n    Type: ${weatherInfo.system.type}'));
  print(AnsiStyles.green('Time Zone: ${weatherInfo.timezone}'));
  print(AnsiStyles.white('ID : ${weatherInfo.id}'));
  print(AnsiStyles.gray('Name: ${weatherInfo.name}'));
  print(AnsiStyles.cyanBright('COD: ${weatherInfo.cod}'));
}
