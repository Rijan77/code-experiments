import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:try_project/weather_app/app/core/utils/api_status.dart';
import 'package:try_project/weather_app/app/data/models/weather_api_model.dart';
import 'package:try_project/weather_app/app/data/repositories/weather_api_implement.dart';

part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  WeatherDataCubit() : super(WeatherDataState());

  Future<void> fetchWeatherData() async {
    emit(state.copyWith(weatherStatus: ApiStatus.loading));

    WeatherApiImplement weatherApiImplement = WeatherApiImplement();

    try {
      final WeatherApiModel recentWeather = await weatherApiImplement
          .fetchWeatherData();
      emit(
        state.copyWith(
          weatherStatus: ApiStatus.success,
          weatherApiModel: recentWeather,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          weatherStatus: ApiStatus.failure,
          error: "Failed to Load Data: $e",
        ),
      );
    }
  }
}
