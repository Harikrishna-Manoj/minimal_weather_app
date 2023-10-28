part of 'animation_bloc.dart';

@immutable
sealed class AnimationEvent {}

class GetAnimation extends AnimationEvent {
  final String currentWeather;

  GetAnimation({required this.currentWeather});
}
