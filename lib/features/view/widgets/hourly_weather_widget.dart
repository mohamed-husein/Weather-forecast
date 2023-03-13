// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:weather/core/global/theme/theme_color/theme_color_dark.dart';
// import 'package:weather/core/utils/app_fonsts.dart';

// import '../../../core/images/custom_png_image.dart';
// import '../../../core/utils/app_assets.dart';
// import '../../../core/utils/app_sizes.dart';
// import '../../../core/utils/custom_text.dart';
// import '../../model/weather_data_model.dart';

// class HourlyDataWidget extends StatelessWidget {
//   final WeatherDataModel dataModel;
//   const HourlyDataWidget({
//     super.key,
//     required this.dataModel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: AppSizes.pW16),
//       child: Wrap(
//         children: List.generate(
//           dataModel.daily.length,
//           (index) => SizedBox(
//             width: AppSizes.heightFullScreen,
//             child: Column(
//               children: [
//                 Container(
//                   height: 150,
//                   width: AppSizes.widthFullScreen,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(AppSizes.br20),
//                     color: ThemeColor.containerColor,
//                   ),
//                   child: HourlyDetails(
//                     temp: dataModel.hourly[index].temp.toInt(),
//                     timeStamp: dataModel.hourly[index].dt,
//                     weatherIcon: dataModel.hourly[index].weather[0].icon,
//                     index: index,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HourlyDetails extends StatelessWidget {
//   const HourlyDetails({
//     super.key,
//     required this.temp,
//     required this.timeStamp,
//     required this.weatherIcon,
//     required this.index,
//   });
//   final int temp;
//   final int timeStamp;
//   final int index;
//   final String weatherIcon;

//   String getTime(final day) {
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
//     String x = DateFormat('jm').format(date);
//     return x;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: AppSizes.pW18),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           CustomText.labelSmall(
//             getTime(timeStamp),
//             context: context,
//             textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
//                   color: ThemeColor.labelMediumColor,
//                 ),
//           ),
//           CustomPngImage(
//             path: '$pngPath/$weatherIcon.png',
//             width: AppSizes.pW40,
//             height: AppSizes.pH40,
//           ),
//           CustomText.titleSmall(
//             '$temp°',
//             context: context,
//             textStyle: Theme.of(context)
//                 .textTheme
//                 .titleMedium!
//                 .copyWith(fontFamily: AppFonts.fontFamilyChakra),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/global/theme/theme_color/theme_color_dark.dart';
import 'package:weather/core/utils/app_fonsts.dart';

import '../../../core/images/custom_png_image.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/custom_text.dart';
import '../../model/weather_data_model.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataModel dataModel;
  const HourlyDataWidget({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pW16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.br20),
                  color: ThemeColor.containerColor,
                ),
                child: HourlyDetails(
                  temp: dataModel.hourly[index].temp.toInt(),
                  timeStamp: dataModel.hourly[index].dt,
                  weatherIcon: dataModel.hourly[index].weather[0].icon,
                  index: index,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: AppSizes.pW3,
        ),
        itemCount: dataModel.hourly.length > 12 ? 12 : dataModel.hourly.length,
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  const HourlyDetails({
    super.key,
    required this.temp,
    required this.timeStamp,
    required this.weatherIcon,
    required this.index,
  });
  final int temp;
  final int timeStamp;
  final int index;
  final String weatherIcon;

  String getTime(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('jm').format(date);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pW18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText.labelSmall(
            getTime(timeStamp),
            context: context,
            textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: ThemeColor.labelMediumColor,
                ),
          ),
          CustomPngImage(
            path: '$pngPath/$weatherIcon.png',
            width: AppSizes.pW40,
            height: AppSizes.pH40,
          ),
          CustomText.titleSmall(
            '$temp°',
            context: context,
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontFamily: AppFonts.fontFamilyChakra),
          ),
        ],
      ),
    );
  }
}
