import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../data/api_response.dart';
import '../model/weather_data_model.dart';
import '../repository/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository weatherRepository;

  WeatherViewModel(this.weatherRepository);

  ApiResponse<WeatherDataModel> weather = ApiResponse.load();
  setWeather(ApiResponse<WeatherDataModel> response) {
    weather = response;
    notifyListeners();
  }

  String _position = '';
  String get currentCountry => _position;

  Future getCurrentLocation(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Future.error('Services is not Enabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    List<Placemark> currentLocationPosition =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    _position = currentLocationPosition[0].country!;
    fetchWeatherData(position.latitude, position.longitude);
  }

  Future<void> fetchWeatherData(double lat, long) async {
    setWeather(ApiResponse.load());
    weatherRepository.getWeatherData(lat, long).then(
      (value) {
        setWeather(
          ApiResponse.success(value),
        );
      },
    ).onError(
      (error, stackTrace) {
        setWeather(
          ApiResponse.error(
            error.toString(),
          ),
        );
      },
    );
  }
}
