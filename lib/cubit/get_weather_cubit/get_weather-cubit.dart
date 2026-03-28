import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  void getWeaher({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityName: cityName);

      if (weatherModel != null) {
        emit(WeatherSuccessState(weatherModel!));
      } else {
        emit(NoWeatherState());
      }
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
