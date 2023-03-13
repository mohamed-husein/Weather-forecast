import 'package:get_it/get_it.dart';
import '../../features/data/network/network_api_service.dart';
import '../../features/repository/weather_repository.dart';
import '../../features/view_model/weather_view_model.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    // *** Network Api Services
    sl.registerLazySingleton<NetworkApiServices>(() => NetworkApiServices());
    // *** Repository
    sl.registerLazySingleton<WeatherRepository>(() => WeatherRepository(sl()));
    // *** Provider
    sl.registerFactory<WeatherViewModel>(() => WeatherViewModel(sl()));
  }
}
