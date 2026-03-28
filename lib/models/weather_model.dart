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

      case 'cloudy':
      case 'Overcast':
      case 'Mist':
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
      case 'Rain':
        return MaterialColor(0xFF42A5F5, {
          50: Color(0xFFE1F5FE),
          100: Color(0xFFB3E5FC),
          200: Color(0xFF81D4FA),
          300: Color(0xFF4FC3F7),
          400: Color(0xFF29B6F6),
          500: Color(0xFF03A9F4),
          600: Color(0xFF039BE5),
          700: Color(0xFF0288D1),
          800: Color(0xFF0277BD),
          900: Color(0xFF01579B),
        });

      case 'Thunderstorm':
        return MaterialColor(0xFF5C6BC0, {
          50: Color(0xFFE8EAF6),
          100: Color(0xFFC5CAE9),
          200: Color(0xFF9FA8DA),
          300: Color(0xFF7986CB),
          400: Color(0xFF5C6BC0),
          500: Color(0xFF3F51B5),
          600: Color(0xFF3949AB),
          700: Color(0xFF303F9F),
          800: Color(0xFF283593),
          900: Color(0xFF1A237E),
        });

      case 'Fog':
      case 'Haze':
        return MaterialColor(0xFFBDBDBD, {
          50: Color(0xFFFAFAFA),
          100: Color(0xFFF5F5F5),
          200: Color(0xFFEEEEEE),
          300: Color(0xFFE0E0E0),
          400: Color(0xFFBDBDBD),
          500: Color(0xFF9E9E9E),
          600: Color(0xFF757575),
          700: Color(0xFF616161),
          800: Color(0xFF424242),
          900: Color(0xFF212121),
        });

      case 'Clear':
      case 'Night':
        return MaterialColor(0xFF1A237E, {
          50: Color(0xFFE8EAF6),
          100: Color(0xFFC5CAE9),
          200: Color(0xFF9FA8DA),
          300: Color(0xFF7986CB),
          400: Color(0xFF5C6BC0),
          500: Color(0xFF3F51B5),
          600: Color(0xFF3949AB),
          700: Color(0xFF303F9F),
          800: Color(0xFF283593),
          900: Color(0xFF1A237E),
        });
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
