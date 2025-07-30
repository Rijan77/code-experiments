import 'package:try_project/weather_app/app/data/models/weather_api_model.dart';

abstract class WeatherApiAbstract {
  Future<WeatherApiModel> fetchWeatherData();
}
