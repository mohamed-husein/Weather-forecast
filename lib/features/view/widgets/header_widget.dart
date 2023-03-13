import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/global/theme/theme_color/theme_color_dark.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/custom_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.country});

  final String country;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppSizes.pH22, left: AppSizes.pW16, right: AppSizes.pW16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(country,
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                  context: context),
              SizedBox(
                height: AppSizes.pH8,
              ),
              CustomText.labelSmall(AppConstance.currentData, context: context),
            ],
          ),
          Container(
            height: AppSizes.pH40,
            width: AppSizes.pH40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.br10),
              color: Colors.black26,
            ),
            child: Padding(
              padding: EdgeInsets.all(AppSizes.pH10),
              child: SvgPicture.asset(
                AppAssets.menu,
                // ignore: deprecated_member_use
                color: ThemeColor.titleSmallColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
