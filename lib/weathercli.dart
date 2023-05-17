import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printWeatherInfo() async {
  final WeatherInfo weatherInfo;
  weatherInfo = await getWeatherJson();

  print('Coordinates: ${weatherInfo.coordinates}');
  print('Weather : ${weatherInfo.weather}');
}

Future<WeatherInfo> getWeatherJson() async {
  String weatherUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=27.7172&lon=85.3240&appid=e060e0b38d18d8565acae769a8efcad6';
  final weatherApiUrl = Uri.parse(weatherUrl);
  final weatherInfo = await http.get(weatherApiUrl);
  final weatherJsonInfo = json.decode(weatherInfo.body) as Map<String, dynamic>;

  return WeatherInfo.fromjson(weatherJsonInfo);
}

class WeatherInfo {
  final Coordinates coordinates;
  final List<Weather> weather;
  final String base;
  final int visibility;
  final Wind wind;
  final Rain rain;
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
    required this.rain,
    required this.clouds,
    required this.timeDataCalculation,
    required this.system,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherInfo.fromjson(Map<String, dynamic> json) {
    return WeatherInfo(
      coordinates: Coordinates.fromjson(json['coord']),
      weather: List<Weather>.from(json['weather']),
      base: json['base'],
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      rain: Rain.fromJson(json['rain']),
      clouds: Clouds.fromJson(json['clouds']),
      timeDataCalculation: json['dt'],
      system: SysData.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
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

  factory Coordinates.fromjson(Map<String, dynamic> json) {
    return Coordinates(
      lon: json['lon'],
      lat: json['lat'],
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
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
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
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class Wind {
  final int speed;
  final int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
    );
  }
}

class Rain {
  final double oneHour;

  Rain({required this.oneHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      oneHour: json['1h'],
    );
  }
}

class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
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
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
