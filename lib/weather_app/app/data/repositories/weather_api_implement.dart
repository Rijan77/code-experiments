import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:try_project/weather_app/app/data/models/weather_api_model.dart';
import 'package:try_project/weather_app/app/domain/repositories/weather_api_abstract.dart';

class WeatherApiImplement implements WeatherApiAbstract {
  @override
  Future<WeatherApiModel> fetchWeatherData() async {
    await Future.delayed(const Duration(seconds: 1));

    Dio dio = Dio();

    var header = {
      "x-apihub-key": "5NdPK8GZ5pJDm-OEuveKPKaFsSkKE6Ia2MlCwkk4sL3FeMjKDv",
      "x-apihub-host": "All-in-One-Weather-API.allthingsdev.co",
      "x-apihub-endpoint": "2cd1a1f6-4f7f-4cd9-929e-3ce96b929bae",
    };

    try {
      final response = await dio.get(
        "https://All-in-One-Weather-API.proxy-production.allthingsdev.co/v1/current.json?q=Lalitpur",
        options: Options(headers: header),
      );
      if (response.statusCode == 200) {
        return WeatherApiModel.fromJson(response.data);
      } else {
        throw Exception(
          "Error: ${response.statusCode} ${response.statusMessage}",
        );
      }
    } catch (e) {
      throw Exception("Error fetching weather: $e");
    }
  }
}
