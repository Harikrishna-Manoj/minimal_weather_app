part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {
  final String? city;
  final double? temperature;
  final String? condition;
  final String? description;

  const WeatherState(
      {required this.description,
      required this.city,
      required this.temperature,
      required this.condition});
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial(
      {required super.description,
      required super.city,
      required super.temperature,
      required super.condition});
}
