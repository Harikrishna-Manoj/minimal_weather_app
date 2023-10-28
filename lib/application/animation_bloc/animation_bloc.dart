import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'animation_event.dart';
part 'animation_state.dart';

class AnimationBloc extends Bloc<AnimationEvent, AnimationState> {
  AnimationBloc()
      : super(const AnimationInitial(assetAnimation: 'Loading...')) {
    on<GetAnimation>((event, emit) {
      switch (event.currentWeather) {
        case "clouds":
        case "mist":
        case "smoke":
        case "haze":
        case "dust":
        case "fog":
          emit(const AnimationInitial(assetAnimation: "asset/cloud.json"));
        case "rain":
        case "drizzle":
        case "shower rain":
          emit(const AnimationInitial(
              assetAnimation: "asset/sun_and-rain.json.json"));
        case "thunderstrom":
          emit(const AnimationInitial(
              assetAnimation: "asset/lightning and rain.json"));
        case "clear":
          emit(const AnimationInitial(assetAnimation: "asset/sun.json"));
        default:
          emit(const AnimationInitial(assetAnimation: "asset/sun.json"));
      }
    });
  }
}
