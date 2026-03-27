import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather-cubit.dart';


class SearchPage extends StatelessWidget{
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(

    appBar: AppBar(
      title: Text('Search by City'),
      
    ),
    body: Container(
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(onSubmitted: (value) async{
          //weatherModel= await WeatherService(Dio()).getCurrentWeather(cityName: value);
          var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
          getWeatherCubit.getWeaher(cityName: value);
          Navigator.pop(context);
           //log(weather!.cityName);
          },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16
              ),
              suffixIcon: Icon(Icons.search),
              hint: Text('Enter City Name'),
              label: Text('Search'),
              border: OutlineInputBorder(
                
               
                
              ),
              enabledBorder: OutlineInputBorder(),
            ),
            
          ),
        ),
      ),
    ),
   );
  }
  
}
 //WeatherModel? weatherModel;