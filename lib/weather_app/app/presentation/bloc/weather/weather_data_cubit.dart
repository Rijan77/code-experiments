import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  WeatherDataCubit() : super(WeatherDataInitial());
}
