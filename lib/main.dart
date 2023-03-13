import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/services/service_locator.dart';
import 'features/view/screens/splash_screen.dart';
import 'features/view_model/weather_view_model.dart';

import 'core/global/theme/theme_data/dark.dart';

void main() {
  ServiceLocator.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: false,
      builder: (_, __) {
        return ChangeNotifierProvider<WeatherViewModel>(
          create: (context) =>
              sl<WeatherViewModel>()..getCurrentLocation(context),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: getThemeData,
              home: const SplashScreen(),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1,
                  ),
                  child: child!,
                );
              },
            );
          },
        );
      },
    );
  }
}
