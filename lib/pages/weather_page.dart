import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/application/weather_bloc/weather_bloc.dart';

class ScreenWeatherDetails extends StatelessWidget {
  const ScreenWeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<WeatherBloc>(context).add(GetWeather());
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child:
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
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
                Lottie.asset("asset/cloud.json"),
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
