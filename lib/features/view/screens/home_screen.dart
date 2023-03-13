import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_sizes.dart';

import '../../../core/enums/status.dart';
import '../../../core/global/theme/theme_color/theme_color_dark.dart';
import '../../../core/utils/app_assets.dart';
import '../../view_model/weather_view_model.dart';
import '../widgets/comfort_level_widget.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/daily_weather_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColor.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: DefaultTabController(
            length: 3,
            child: Consumer<WeatherViewModel>(
              builder: (context, value, child) {
                final data = value.weather.data;
                switch (value.weather.status!) {
                  case Status.loading:
                    return  Padding(
                      padding:  EdgeInsets.all(AppSizes.pW18),
                      child: Center(
                        child: Lottie.asset(AppAssets.loading,),
                      ),
                    );

                  case Status.complete:
                    return SizedBox(
                      height: AppSizes.heightFullScreen,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderWidget(
                            country: value.currentCountry,
                          ),
                          CurrentWeatherWidget(
                            data: data!,
                          ),
                          const TabBar(
                            isScrollable: true,
                            tabs: [
                              Tab(
                                text: 'Today',
                              ),
                              Tab(
                                text: 'Next Days',
                              ),
                              Tab(
                                text: 'Comfort Level',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppSizes.pH16,
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                HourlyDataWidget(dataModel: data),
                                DailyDataWidget(dataModel: data),
                                ComfortLevelWidget(dataModel: data),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  case Status.error:
                    return Text(value.weather.message!);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
/*
Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderWidget(
                          country: value.currentCountry,
                        ),
                        CurrentWeatherWidget(
                          data: data!,
                        ),
                        const TabBar(
                          isScrollable: true,
                          tabs: [
                            Tab(
                              text: 'Today',
                            ),
                            Tab(
                              text: 'Next Days',
                            ),
                            Tab(
                              text: 'Comfort Level',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.pH16,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: AppSizes.heightFullScreen,
                            child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                HourlyDataWidget(dataModel: data),
                                Container(),
                                Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
*/