import 'package:flutter/widgets.dart';

class CurrentWeatherModel {
  double? tempC;
  double? feelslikeC;
  double? humidity;
  Condition? condition;

  CurrentWeatherModel({
    this.tempC,
    this.feelslikeC,
    this.humidity,
    this.condition,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      tempC: json["tempC"],
      feelslikeC: json["feelslikeC"],
      condition: json["condition"],
      humidity: json["humidity"],
    );
  }
}

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}
