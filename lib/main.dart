import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather-cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => WeatherCubit(), child: WeatherApp()),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Builder(
            builder: (context) => MaterialApp(
              theme: ThemeData(
                primarySwatch: BlocProvider.of<WeatherCubit>(context)
                    .weatherModel
                    ?.getThemeColor(
                      BlocProvider.of<WeatherCubit>(
                            context,
                          ).weatherModel?.weatherCondition ??
                          '',
                    ),
              ),

              home: HomePage(),
            ),
          );
        },
      ),
    );
  }
}
