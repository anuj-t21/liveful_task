import 'dart:convert';
import 'dart:developer';

import 'package:liveful_task/core/secrets/app_secrets.dart';
import 'package:liveful_task/features/weather/data/models/weather_model.dart';
import 'package:liveful_task/features/weather/domain/entities/weather.dart';
import 'package:liveful_task/features/weather/domain/repository/weather_repository.dart';
import 'package:http/http.dart' as http;

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Weather> fetchWeatherData({required String city}) async {
    try {
      var url = Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': city,
          "units": "metric",
          "appid": AppSecrets.weatherApiKey,
        },
      );
      final http.Response response = await http.get(url);
      log(response.body.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        return WeatherModel.fromJson(decodedJson);
      } else if (response.statusCode == 404) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        throw decodedJson['message'];
      } else {
        log(response.statusCode.toString());
        throw 'Failed to load weather data';
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
