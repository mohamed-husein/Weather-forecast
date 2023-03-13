import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_fonsts.dart';
import '../../../utils/app_sizes.dart';
import '../theme_color/theme_color_dark.dart';

ThemeData get getThemeData => ThemeData(
      primaryColor: ThemeColor.backgroundColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ThemeColor.backgroundColor,
      fontFamily: AppFonts.fontFamilyPoppins,
      appBarTheme: const AppBarTheme(
          backgroundColor: ThemeColor.backgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: ThemeColor.black),
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: ThemeColor.backgroundColor,
            statusBarColor: ThemeColor.backgroundColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.white,
            //Navigation bar divider color
            systemNavigationBarIconBrightness:
                Brightness.light, //navigation bar icon
          )),

      /// TextFormField
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: ThemeColor.labelColor,
          fontSize: AppSizes.fs13,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColor.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        suffixIconColor: ThemeColor.labelMediumColor,
        fillColor: ThemeColor.fillColorTextFormField,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColor.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColor.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        errorStyle: TextStyle(
          color: ThemeColor.validationTextFieldColor,
          fontSize: AppSizes.fs14,
          fontWeight: AppFonts.regular,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColor.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        labelStyle: TextStyle(
          color: ThemeColor.black,
          fontSize: AppSizes.fs13,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            ThemeColor.primaryClr,
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: AppSizes.pH12,
              horizontal: AppSizes.pW22,
            ),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            ThemeColor.primaryColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.br12),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.br40),
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
        ),
      ),
      textTheme: getTextTheme(),
      tabBarTheme: TabBarTheme(
        // labelPadding: const EdgeInsets.only(left: 0, right: 15),
        labelColor: ThemeColor.white,
        labelStyle: TextStyle(
          color: ThemeColor.white,
          fontSize: AppSizes.fs11,
          fontWeight: AppFonts.semiBlod,
          fontFamily: AppFonts.fontFamilyChakra,
        ),
        unselectedLabelStyle: TextStyle(
          color: ThemeColor.darkGrey,
          fontSize: AppSizes.fs11,
          fontWeight: AppFonts.semiBlod,
          fontFamily: AppFonts.fontFamilyChakra,
        ),
        unselectedLabelColor: ThemeColor.darkGrey,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: CircleTabInicator(
          color: ThemeColor.white,
          radius: AppSizes.br4,
        ),
      ),
    );

getTextTheme() => TextTheme(
      /// Primary Color Light
      displaySmall: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamilyPoppins,
      ),

      /// Primary Color AppBar
      displayMedium: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamilyPoppins,
      ),
      displayLarge: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamilyPoppins,
      ),

      headlineLarge: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs80,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamilyRusso,
      ),
      headlineMedium: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamilyRubik,
      ),
      headlineSmall: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs11,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.fontFamilyRubik,
      ),

      /// Body For Text in Black Color
      bodySmall: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamilyPoppins,
      ),
      bodyMedium: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamilyPoppins,
      ),
      bodyLarge: TextStyle(
        color: ThemeColor.black,
        fontSize: AppSizes.fs32,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamilyPoppins,
      ),

      /// Title
      titleSmall: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs13,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamilyChakra,
      ),

      /// White Text For Button
      titleMedium: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs13,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamilyChakra,
      ),
      titleLarge: TextStyle(
        color: ThemeColor.white,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamilyPoppins,
      ),

      /// Label For Color Grey
      labelSmall: TextStyle(
        color: ThemeColor.labelMediumColor,
        fontSize: AppSizes.fs11,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamilyChakra,
      ),

      labelMedium: TextStyle(
        color: ThemeColor.darkGrey,
        fontSize: AppSizes.fs13,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamilyChakra,
      ),

      labelLarge: TextStyle(
        color: ThemeColor.labelColor,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamilyPoppins,
      ),
    );

class CircleTabInicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabInicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    Offset circleOffset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
