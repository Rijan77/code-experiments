import 'package:dio/dio.dart';

import 'package:try_project/jokes_app/model/jokes_model.dart';

class JokesApi {
  final dio = Dio();

  Future<JokesModel?> getJoke() async {
    var headers = {
      'x-apihub-key': '5NdPK8GZ5pJDm-OEuveKPKaFsSkKE6Ia2MlCwkk4sL3FeMjKDv',
      'x-apihub-host': 'Jokes-API.allthingsdev.co',
      'x-apihub-endpoint': 'fba849ca-2257-445d-b5e2-ba6ce527a281',
    };

    try {
      final response = await dio.get(
        "https://Jokes-API.proxy-production.allthingsdev.co/random_joke",
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        return JokesModel.fromJson(response.data);
      } else {
        print("Error: ${response.statusCode} ${response.statusMessage}");
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }
}
