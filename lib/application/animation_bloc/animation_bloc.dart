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
        case "Clouds":
          return emit(
              const AnimationInitial(assetAnimation: "asset/cloud.json"));
        case "Mist":
          return emit(
              const AnimationInitial(assetAnimation: "asset/cloud.json"));
        case "Smoke":
          return emit(
              const AnimationInitial(assetAnimation: "asset/cloud.json"));
        case "Haze":
          return emit(
              const AnimationInitial(assetAnimation: "asset/cloud.json"));
        case "Dust":
          return emit(
              const AnimationInitial(assetAnimation: "asset/cloud.json"));
        case "Fog":
          emit(const AnimationInitial(assetAnimation: "asset/cloud.json"));
        case "Rain":
        case "Drizzle":
        case "Shower rain":
          emit(const AnimationInitial(
              assetAnimation: "asset/sun_and-rain.json"));
        case "Thunderstrom":
          emit(const AnimationInitial(
              assetAnimation: "asset/lightning and rain.json"));
        case "Clear":
          emit(const AnimationInitial(assetAnimation: "asset/sun.json"));
        case "Loading...":
          emit(const AnimationInitial(assetAnimation: "asset/loading.json"));
        default:
          emit(const AnimationInitial(assetAnimation: "asset/sun.json"));
      }
    });
  }
}
