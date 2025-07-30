import 'package:try_project/weather_app/app/data/models/current_weather_model.dart';
import 'package:try_project/weather_app/app/data/models/location_model.dart';

class WeatherApiModel {
  final LocationModel locationModel;
  final CurrentWeatherModel currentWeatherModel;

  WeatherApiModel({
    required this.locationModel,
    required this.currentWeatherModel,
  });

  factory WeatherApiModel.fromJson(Map<String, dynamic> json) {
    return WeatherApiModel(
      locationModel: json["locationModel"],
      currentWeatherModel: json["currentWeatherModel"],
    );
  }
}
