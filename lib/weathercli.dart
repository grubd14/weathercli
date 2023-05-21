import 'dart:convert';
import 'package:ansi_styles/ansi_styles.dart';
import 'package:http/http.dart' as http;

Future<void> printWeatherInfo() async {
  final WeatherInfo weatherInfo;
  weatherInfo = await getWeatherJson();

  print(AnsiStyles.bold('Weather Information'));
  print(AnsiStyles.green(
      'Coordinates: Latitude: ${weatherInfo.coordinates?.lat}    Longitude: ${weatherInfo.coordinates?.lon}'));
  print(AnsiStyles.yellow(
      'Weather :\n    ID: ${weatherInfo.weather?[0].id}\n    Main: ${weatherInfo.weather?[0].main}\n    Description: ${weatherInfo.weather?[0].description}\n    Icon: ${weatherInfo.weather?[0].icon}'));
  print(AnsiStyles.cyan('Base: ${weatherInfo.base} '));
  print(AnsiStyles.greenBright('Visibility: ${weatherInfo.visibility}'));
  print(AnsiStyles.magentaBright('Wind Speed:\n    ${weatherInfo.wind.speed}\n    ${weatherInfo.wind.deg}'));
  print(AnsiStyles.green('Main Data:\n   Feels Like: ${weatherInfo.maindata.feelsLike}\n   Temperature: ${weatherInfo.maindata.temp}\n   Max Temp: ${weatherInfo.maindata.tempMax}\n   Min Temp: ${weatherInfo.maindata.tempMin}\n   Humidity: ${weatherInfo.maindata.humidity}\n   Pressure: ${weatherInfo.maindata.pressure}'));
  print(AnsiStyles.redBright('Rain: ${weatherInfo.rain?.oneHour}'));
  print(AnsiStyles.whiteBright('Clouds: ${weatherInfo.clouds.all}'));
  print(AnsiStyles.yellowBright(
      'Time Data Calculation: ${weatherInfo.timeDataCalculation}'));
  print(AnsiStyles.blue('System Data:\n    ID: ${weatherInfo.system.id}\n    Country: ${weatherInfo.system.country}\n    Sunrise: ${weatherInfo.system.sunrise}\n    Sunset: ${weatherInfo.system.sunset}\n    Type: ${weatherInfo.system.type}'));
  print(AnsiStyles.green('Time Zone: ${weatherInfo.timezone}'));
  print(AnsiStyles.white('ID : ${weatherInfo.id}'));
  print(AnsiStyles.gray('Name: ${weatherInfo.name}'));
  print(AnsiStyles.cyanBright('COD: ${weatherInfo.cod}'));
}

Future<WeatherInfo> getWeatherJson() async {
  String weatherUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=27.7172&lon=85.3240&appid=e060e0b38d18d8565acae769a8efcad6';
  final weatherApiUrl = Uri.parse(weatherUrl);
  final weatherInfo = await http.get(weatherApiUrl);
  final weatherJsonInfo = json.decode(weatherInfo.body) as Map<String, dynamic>;

  return WeatherInfo.fromJson(weatherJsonInfo);
}

class WeatherInfo {
  final Coordinates? coordinates;
  final List<Weather>? weather;
  final String base;
  final int visibility;
  final Wind wind;
  final Maindata maindata;
  final Rain? rain;
  final Clouds clouds;
  final int timeDataCalculation;
  final SysData system;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherInfo({
    required this.coordinates,
    required this.weather,
    required this.base,
    required this.visibility,
    required this.wind,
    required this.maindata,
    required this.rain,
    required this.clouds,
    required this.timeDataCalculation,
    required this.system,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic>? json) {
    return WeatherInfo(
      coordinates: Coordinates.fromJson(json?['coord']),
      weather: (json?['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json?['base'] as String,
      visibility: json?['visibility'] as int,
      wind: Wind.fromJson(json?['wind']),
      maindata: Maindata.fromJson(json?['main']),
      rain: json?['rain'] != null
          ? Rain.fromJson(json?['rain'] as Map<String, dynamic>)
          : null,
      clouds: Clouds.fromJson(json?['clouds']),
      timeDataCalculation: json?['dt'] as int,
      system: SysData.fromJson(json?['sys']),
      timezone: json?['timezone'] as int,
      id: json?['id'] as int,
      name: json?['name'] as String,
      cod: json?['cod'] as int,
    );
  }
}

class Coordinates {
  final double lon;
  final double lat;

  Coordinates({
    required this.lon,
    required this.lat,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lon: json['lon'] as double,
      lat: json['lat'] as double,
    );
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }
}

class Maindata {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Maindata({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Maindata.fromJson(Map<String, dynamic> json) {
    return Maindata(
      temp: json['temp'] as double,
      feelsLike: json['feels_like'] as double,
      tempMin: json['temp_min'] as double,
      tempMax: json['temp_max'] as double,
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
    );
  }
}

class Wind {
  final double speed;
  final int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'] as double,
      deg: json['deg'] as int,
    );
  }
}

class Rain {
  final double oneHour;

  Rain({required this.oneHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      oneHour: json['1h'] as double,
    );
  }
}

class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'] as int,
    );
  }
}

class SysData {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  SysData({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysData.fromJson(Map<String, dynamic> json) {
    return SysData(
      type: json['type'] as int,
      id: json['id'] as int,
      country: json['country'] as String,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
    );
  }
}
