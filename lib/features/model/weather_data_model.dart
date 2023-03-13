import 'current_weather_model.dart';
import 'daily_weather_model.dart';
import 'hourly_weather_model.dart';

class WeatherDataModel {
  final double lat, long;
  final String timezone;
  final CurrentWeatherModel current;
  final List<HourlyWeatherModel> hourly;
  final List<DailyWeatherModel> daily;

  const WeatherDataModel({
    required this.current,
    required this.daily,
    required this.hourly,
    required this.lat,
    required this.long,
    required this.timezone,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
        current: CurrentWeatherModel.fromJson(json['current']),
        daily: List<DailyWeatherModel>.from(
            json['daily'].map((e) => DailyWeatherModel.fromJson(e))),
        hourly: List<HourlyWeatherModel>.from(
            json['hourly'].map((e) => HourlyWeatherModel.fromJson(e))),
        lat: json['lat'].toDouble(),
        long: json['lon'].toDouble(),
        timezone: json['timezone'],);
  }
}
