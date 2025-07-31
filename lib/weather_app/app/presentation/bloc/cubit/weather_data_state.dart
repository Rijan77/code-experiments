part of 'weather_data_cubit.dart';

class WeatherDataState extends Equatable {
  final ApiStatus weatherStatus;
  final WeatherApiModel? weatherApiModel;

  final String? error;

  const WeatherDataState({
    this.weatherStatus = ApiStatus.initial,
    this.weatherApiModel,
    this.error,
  });

  WeatherDataState copyWith({
    ApiStatus? weatherStatus,
    WeatherApiModel? weatherApiModel,
    String? error,
  }) {
    return WeatherDataState(
      weatherStatus: weatherStatus ?? this.weatherStatus,
      weatherApiModel: weatherApiModel ?? this.weatherApiModel,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [weatherStatus, weatherApiModel, error];
}
