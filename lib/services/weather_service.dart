import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
 final Dio dio;
 final String baseUrl='https://api.weatherapi.com/v1';
 final String apiKey='a678d2eca2a5420c9da131913250312';

 WeatherService(this.dio);

 Future<WeatherModel?>  getCurrentWeather({required String cityName}) async
 {
   try {
 
      Response response = await dio.get('$baseUrl/forecast.json?q=$cityName&days=1&key=$apiKey');
    
      WeatherModel weather= WeatherModel.fromJson(response.data);
      return  weather;
   
    
   
} on DioException catch (e) {
  final String errorMessage= e.response?.data['error']['message']?? 'Opps! there is an error, try later';
   throw Exception(errorMessage);
 
}
 }
}
