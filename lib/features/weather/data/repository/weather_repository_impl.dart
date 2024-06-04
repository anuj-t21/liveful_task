import 'dart:convert';
import 'dart:developer';

import 'package:liveful_task/core/secrets/app_secrets.dart';
import 'package:liveful_task/features/weather/data/models/weather_model.dart';
import 'package:liveful_task/features/weather/domain/entities/weather.dart';
import 'package:liveful_task/features/weather/domain/repository/weather_repository.dart';
import 'package:http/http.dart' as http;

// Implementation of the WeatherRepository interface.
class WeatherRepositoryImpl implements WeatherRepository {
  // Fetches weather data for a given city using the OpenWeatherMap API.
  @override
  Future<Weather> fetchWeatherData({required String city}) async {
    try {
      // Construct the URL with query parameters.
      var url = Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': city,
          "units": "metric",
          "appid": AppSecrets.weatherApiKey,
        },
      );
      // Perform the HTTP GET request.
      final http.Response response = await http.get(url);
      // Log the response body for debugging purposes.
      log(response.body.toString());
      // Check the response status code and parse the JSON if successful.
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        // Convert the JSON map into a WeatherModel object.
        return WeatherModel.fromJson(decodedJson);
      } else if (response.statusCode == 404) {
        // Handle the case where the city is not found.
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        throw decodedJson['message'];
      } else {
        // Log unexpected status codes.
        log(response.statusCode.toString());
        throw 'Failed to load weather data';
      }
    } catch (e) {
      // Handle exceptions that occur during the fetch operation.
      throw Exception(e);
    }
  }
}
