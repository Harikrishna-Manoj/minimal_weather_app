import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  // ignore: constant_identifier_names
  static const Base_Url = "https://api.openweathermap.org/data/2.5/weather";
  final String apikey;

  WeatherService({required this.apikey});

  Future<WeatherModel> getWeatherApp(String city) async {
    final Response response =
        await http.get(Uri.parse("$Base_Url?q=$city&appid=$apikey"));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load");
    }
  }

  Future<String> getCurrentLocation() async {
    // Get permission from the user
    LocationPermission permissionForLocation =
        await Geolocator.checkPermission();
    if (permissionForLocation == LocationPermission.denied) {
      permissionForLocation = await Geolocator.requestPermission();
    }
    // Fetch current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // Get the city name
    String? city = placemarks[0].locality;
    return city ?? "";
  }
}
