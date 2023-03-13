import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/global/theme/theme_color/theme_color_dark.dart';
import '../../../core/images/custom_png_image.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/custom_text.dart';
import '../../model/weather_data_model.dart';

class DailyDataWidget extends StatelessWidget {
  const DailyDataWidget({super.key, required this.dataModel});

  final WeatherDataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.br20),
      ),
      child: DailyList(dataModel: dataModel),
    );
  }
}

class DailyList extends StatelessWidget {
  const DailyList({
    super.key,
    required this.dataModel,
  });
  final WeatherDataModel dataModel;

  String getTime(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('E').format(date);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: AppSizes.pW16),
          height: AppSizes.pH60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.labelSmall(
                getTime(dataModel.daily[index].dt),
                context: context,
              ),
              Row(
                children: [
                  CustomText.titleSmall(
                    '${dataModel.daily[index].temp.min.toInt()}°',
                    context: context,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppSizes.pW2),
                    height: AppSizes.pH4,
                    width: AppSizes.pW75,
                    decoration: BoxDecoration(
                        color: ThemeColor.containerColor,
                        borderRadius: BorderRadius.circular(AppSizes.br10)),
                  ),
                  CustomText.titleSmall(
                    '${dataModel.daily[index].temp.max.toInt()}°',
                    context: context,
                  ),
                ],
              ),
              CustomPngImage(
                path: '$pngPath/${dataModel.daily[index].weather[0].icon}.png',
                width: AppSizes.pW22,
                height: AppSizes.pH22,
              ),
            ],
          ),
        );
      },
      itemCount: 7,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: AppSizes.pH6,
        );
      },
    );
  }
}
