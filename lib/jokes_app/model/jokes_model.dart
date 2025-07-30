class JokesModel {
  String? type;
  String? setup;
  String? punchline;
  int id;

  JokesModel({this.type, this.setup, this.punchline, required this.id});

  factory JokesModel.fromJson(Map<String, dynamic> json) {
    return JokesModel(
      id: json["id"],
      type: json["type"],
      setup: json["setup"],
      punchline: json["punchline"],
    );
  }
}
