import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/application/weather_bloc/weather_bloc.dart';
import 'package:weather_app/pages/weather_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenWeatherDetails(),
      ),
    );
  }
}
