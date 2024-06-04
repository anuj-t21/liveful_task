import 'package:flutter/material.dart';

class WeatherIconHelper {
  // We can also use a weather helper like this
  static IconData getIconFromCode(String iconCode) {
    switch (iconCode) {
      case '01d':
      case '01n':
        return Icons.sunny;
      case '02d':
      case '02n':
        return Icons.wb_cloudy_outlined; // Few clouds (day or night)
      case '03d':
      case '03n':
        return Icons.wb_cloudy; // Scattered clouds (day or night)
      case '04d':
      case '04n':
        return Icons.wb_cloudy_sharp; //
      case '94d':
      case '09n':
      case '10d':
      case '10n':
        return Icons.wb_cloudy_sharp;
      default:
        return Icons.error; // Placeholder for rain/snow (not ideal)
    }
  }
}
