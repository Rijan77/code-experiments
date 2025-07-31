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
      tempC: (json["temp_c"] as num?)?.toDouble(),
      feelslikeC: (json["feelslike_c"] as num?)?.toDouble(),
      humidity: (json["humidity"] as num?)?.toDouble(),
      condition: json["condition"] != null
          ? Condition.fromJson(json["condition"])
          : null,
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
