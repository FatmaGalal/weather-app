import 'package:flutter/material.dart';

class WeatherModel {
  final String? cityName;
  final String? country;
  final DateTime? date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.country,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition:
          json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }

  MaterialColor? getThemeColor(String condition) {
    switch (condition) {
      case 'snow':
        return MaterialColor(0xFFB0E0E6, {
          50: Color(0xFFE0F7FA),
          100: Color(0xFFB2EBF2),
          200: Color(0xFF80DEEA),
          300: Color(0xFF4DD0E1),
          400: Color(0xFF26C6DA),
          500: Color(0xFF00BCD4),
          600: Color(0xFF00ACC1),
          700: Color(0xFF0097A7),
          800: Color(0xFF00838F),
          900: Color(0xFF006064),
        });

      case 'Sunny':
        return MaterialColor(0xFFFFCDD2, {
          50: Color(0xFFFFF3E0),
          100: Color(0xFFFFB74D),
          200: Color(0xFFFF9800),
          300: Color(0xFFFF8F00),
          400: Color(0xFFFF6F00),
          500: Color(0xFFFF5722),
          600: Color(0xFFF4511E),
          700: Color(0xFFE64A19),
          800: Color(0xFFD84315),
          900: Color(0xFFBF360C),
        });

      case 'cloudy' || 'Overcast' || 'Mist':
        return MaterialColor(0xFFCFD8DC, {
          50: Color(0xFFECEFF1),
          100: Color(0xFFB0BEC5),
          200: Color(0xFF90A4AE),
          300: Color(0xFF78909C),
          400: Color(0xFF607D8B),
          500: Color(0xFF546E7A),
          600: Color(0xFF455A64),
          700: Color(0xFF37474F),
          800: Color(0xFF263238),
          900: Color(0xFF212121),
        });
        break;
      case 'Patchy rain possible':
        return MaterialColor(0xFFB3E5FC, {
          50: Color(0xFFE1F5FE),
          100: Color(0xFF81D4FA),
          200: Color(0xFF4FC3F7),
          300: Color(0xFF29B6F6),
          400: Color(0xFF03A9F4),
          500: Color(0xFF039BE5),
          600: Color(0xFF0288D1),
          700: Color(0xFF0277BD),
          800: Color(0xFF01579B),
          900: Color(0xFF013C71),
        });
        break;

      default:
        return MaterialColor(0xFFFFC107, {
          50: Color(0xFFFFF8E1),
          100: Color(0xFFFFECB3),
          200: Color(0xFFFFD54F),
          300: Color(0xFFFFCA28),
          400: Color(0xFFFFC107),
          500: Color(0xFFFFB300),
          600: Color(0xFFFFA000),
          700: Color(0xFFFF8F00),
          800: Color(0xFFFF6F00),
          900: Color(0xFFFF5722),
        });
    }
  }
}
