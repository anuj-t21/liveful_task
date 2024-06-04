import 'package:liveful_task/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.temp,
    required super.city,
    required super.weatherCondition,
    required super.weatherConditionIcon,
    required super.weatherDescription,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> map) {
    return WeatherModel(
      temp: map['main']['temp']?.toString() ?? '',
      city: map['name'] ?? '',
      weatherDescription: map['weather'][0]['description'] ?? '',
      weatherCondition: map['weather'][0]['main'] ?? '',
      weatherConditionIcon: map['weather'][0]['icon'] ?? '',
    );
  }
}
