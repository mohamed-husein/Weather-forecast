import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../core/global/theme/theme_color/theme_color_dark.dart';
import '../../../core/utils/app_fonsts.dart';
import '../../../core/utils/app_sizes.dart';
import '../../model/weather_data_model.dart';

class ComfortLevelWidget extends StatelessWidget {
  const ComfortLevelWidget({super.key, required this.dataModel});
  final WeatherDataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizes.pH22,
        ),
        SizedBox(
          height: AppSizes.pH180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: dataModel.current.humidity.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: AppSizes.pW4,
                      trackWidth: AppSizes.pW5,
                    ),
                    infoProperties: InfoProperties(
                      mainLabelStyle: Theme.of(context).textTheme.labelLarge,
                      bottomLabelText: 'Humidity',
                      bottomLabelStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                    animationEnabled: true,
                    size: AppSizes.pW153,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor: ThemeColor.firstGradientColor.withAlpha(50),
                      progressBarColors: [
                        ThemeColor.containerColor,
                        ThemeColor.containerColor,
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Feels Like : ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: AppFonts.semiBlod),
                        ),
                        TextSpan(
                          text: dataModel.current.feelsLike.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  fontWeight: AppFonts.semiBlod,
                                  color: ThemeColor.labelMediumColor),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Uvi :  ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: AppFonts.semiBlod),
                        ),
                        TextSpan(
                          text: dataModel.current.uvi.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  fontWeight: AppFonts.semiBlod,
                                  color: ThemeColor.labelMediumColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
