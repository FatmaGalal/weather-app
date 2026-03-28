import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather-cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/noweather_page.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/weatherInfo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BlocProvider.of<WeatherCubit>(context).weatherModel
            ?.getThemeColor(
              BlocProvider.of<WeatherCubit>(
                    context,
                  ).weatherModel?.weatherCondition ??
                  'Clear',
            ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],

        title: Text('Weather'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NoWeatherState) {
            return NoweatherPage();
          } else if (state is WeatherSuccessState) {
            return WeatherinfoPage();
          } else if (state is WeatherFailureState) {
            return Text(state.errorMessage);
          } else {
            return Text('oOops!');
          }
        },
      ),
    );
  }
}
