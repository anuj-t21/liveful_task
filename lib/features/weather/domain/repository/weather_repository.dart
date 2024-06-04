import 'package:liveful_task/features/weather/domain/entities/weather.dart';

// Definition of the WeatherRepository interface.
abstract class WeatherRepository {
  // Method to fetch weather data for a given city.
  // It requires a city name as a parameter and returns a Future of Weather.
  Future<Weather> fetchWeatherData({
    required String city,
  });
}
