class WeatherModel {
  final String city;
  final double temperature;
  final String mainCondition;

  WeatherModel(
      {required this.city,
      required this.temperature,
      required this.mainCondition});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        city: json['name'],
        temperature: json['main']['temp'].toDouble(),
        mainCondition: json['weather'][0]['main']);
  }
}
