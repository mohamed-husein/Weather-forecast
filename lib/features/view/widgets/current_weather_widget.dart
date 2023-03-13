import 'package:flutter/material.dart';
import '../../../core/global/theme/theme_color/theme_color_dark.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_fonsts.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/custom_text.dart';
import '../../model/weather_data_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key, required this.data});

  final WeatherDataModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pH16),
      child: Column(
        children: [
          SizedBox(
            height: AppSizes.pH15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText('${data.current.temp.toInt().toString()}°',
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                      context: context),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.pW2),
                    child: CustomText.labelMedium(
                        data.current.weather[0].description,
                        context: context),
                  ),
                ],
              ),
              Image.asset('$pngPath/${data.current.weather[0].icon}.png'),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: AppSizes.pH12),
            padding: EdgeInsets.symmetric(
                vertical: AppSizes.pH12, horizontal: AppSizes.pW32),
            width: AppSizes.widthFullScreen,
            decoration: BoxDecoration(
              color: ThemeColor.containerColor,
              borderRadius: BorderRadius.circular(AppSizes.br15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildWeather(
                    image: AppAssets.windspeed,
                    text: '${data.current.windSpeed} m/s',
                    context: context,
                    des: 'Wind'),
                buildWeather(
                    image: AppAssets.humidity,
                    text: '${data.current.humidity} %',
                    context: context,
                    des: 'Humidity'),
                buildWeather(
                    image: AppAssets.windspeed,
                    text: '${data.current.clouds} %',
                    context: context,
                    des: 'Clouds'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWeather(
      {required String image,
      required String text,
      required BuildContext context,
      required String des}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: AppSizes.pW22,
        ),
        SizedBox(
          height: AppSizes.pH6,
        ),
        CustomText.titleSmall(text,
            context: context,
            textStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontFamily: AppFonts.fontFamilyChakra)),
        SizedBox(
          height: AppSizes.pH6,
        ),
        CustomText.labelSmall(des, context: context),
      ],
    );
  }
}
