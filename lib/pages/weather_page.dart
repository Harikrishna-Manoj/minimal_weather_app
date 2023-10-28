import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/application/animation_bloc/animation_bloc.dart';
import 'package:weather_app/application/weather_bloc/weather_bloc.dart';

class ScreenWeatherDetails extends StatelessWidget {
  const ScreenWeatherDetails({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<WeatherBloc>(context).add(GetWeather());
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: BlocConsumer<WeatherBloc, WeatherState>(
              listener: (context, state) {
            BlocProvider.of<AnimationBloc>(context)
                .add(GetAnimation(currentWeather: state.condition!));
          }, builder: (context, state) {
            return Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  state.city ?? "City...,",
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 150,
                ),
                BlocBuilder<AnimationBloc, AnimationState>(
                    builder: (context, animationState) {
                  return state.condition == "Loading..."
                      ? SizedBox(
                          width: size.height * 0.33,
                          child: Lottie.asset(
                            "asset/loading.json",
                          ),
                        )
                      : Lottie.asset(animationState.assetAnimation);
                }),
                Text(
                  "${state.temperature?.round().toString() ?? "Loading..."}°C",
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(state.condition ?? "Loading..."),
                Text(state.description ?? "Loading"),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context).add(GetWeather());
                      BlocProvider.of<AnimationBloc>(context)
                          .add(GetAnimation(currentWeather: state.condition!));
                    },
                    icon: const Icon(
                      Icons.replay_rounded,
                      size: 35,
                    ),
                    tooltip: "refreash",
                    color: Colors.blue,
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
