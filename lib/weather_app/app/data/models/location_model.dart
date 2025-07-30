class LocationModel {
  String? name;
  String? country;
  String? localtime;

  LocationModel({this.name, this.country, this.localtime});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json["name"],
      country: json["country"],
      localtime: json["localtime"],
    );
  }
}
