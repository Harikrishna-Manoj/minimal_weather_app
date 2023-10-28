// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/api_key.dart';
import 'package:weather_app/services/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc()
      : super(const WeatherInitial(
            city: '', temperature: 0, condition: '', description: '')) {
    on<GetWeather>((event, emit) async {
      emit(const WeatherInitial(
          description: "Loading...",
          city: "City...",
          temperature: 0,
          condition: "Loading..."));
      final WeatherService weatherService = WeatherService(apikey: apiKey);
      // get the current location
      final String cityName = await weatherService.getCurrentLocation();
      // get the weather
      final WeatherModel weatherModel =
          await weatherService.getWeather(cityName);
      emit(WeatherInitial(
          description: weatherModel.description,
          city: weatherModel.city,
          temperature: weatherModel.temperature,
          condition: weatherModel.mainCondition));
    });
  }
}
