import 'dart:convert';

import '../data/network/network_api_service.dart';

import '../model/weather_data_model.dart';

class WeatherRepository {
  final NetworkApiServices apiServices;

  WeatherRepository(this.apiServices);

  Future<WeatherDataModel> getWeatherData(double lat,long) async {
    try {
      final response = await apiServices.getWeather(lat,long);
      Map<String, dynamic> data =
          (jsonDecode(response.body) as Map<String, dynamic>);
      return WeatherDataModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
