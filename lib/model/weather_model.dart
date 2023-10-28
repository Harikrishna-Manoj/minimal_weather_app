class WeatherModel {
  final String city;
  final double temperature;
  final String mainCondition;
  final String description;

  WeatherModel(
      {required this.city,
      required this.temperature,
      required this.mainCondition,
      required this.description});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        description: json['weather'][0]['description'],
        city: json['name'],
        temperature: json['main']['temp'],
        mainCondition: json['weather'][0]['main']);
  }
}
