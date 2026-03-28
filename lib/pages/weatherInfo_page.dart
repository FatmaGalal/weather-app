import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather-cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherinfoPage extends StatelessWidget {
  const WeatherinfoPage({super.key});

  //final  WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel = BlocProvider.of<WeatherCubit>(
      context,
    ).weatherModel;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            BlocProvider.of<WeatherCubit>(context).weatherModel?.getThemeColor(
                  BlocProvider.of<WeatherCubit>(
                        context,
                      ).weatherModel?.weatherCondition ??
                      '',
                ) ??
                Colors.amber,
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${weatherModel?.cityName}, ${weatherModel?.country}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text('Weather is ${weatherModel?.temp.round()}'),
          Image.network('https:${weatherModel?.image!}'),
          Text('${weatherModel?.date?.hour}:${weatherModel?.date?.minute}'),
          Text('${weatherModel?.weatherCondition}'),
        ],
      ),
    );
  }
}
