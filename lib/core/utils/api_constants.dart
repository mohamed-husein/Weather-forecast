

class ApiConstants {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  static const String apiKey = 'af96533c05542fd23e4d1ea98da5c2b0';
  static String weatherApiPath(double lat, double long) =>
      '${ApiConstants.baseUrl}onecall?lat=$lat&lon=$long&exclude=minutely&units=metric&appid=${ApiConstants.apiKey}';

  static String urlIcon(icon) =>
      'http://openweathermap.org/img/wn/$icon@2x.png';

  
}
