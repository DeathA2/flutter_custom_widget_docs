import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';

class ThemeApp {
  static ThemeData getTheme() {
    return ThemeData(
      // main colors
      colorScheme: ColorScheme.fromSwatch(
        errorColor: ColorsApp.errorPrimary,
        accentColor: ColorsApp.bluePrimary,
        backgroundColor: ColorsApp.white,
        cardColor: ColorsApp.white,
      ),
      primaryColorLight: ColorsApp.bluePrimary,
      canvasColor: ColorsApp.white,
      disabledColor: ColorsApp.bgDisable,
      // ripple color
      splashColor: ColorsApp.blueQuaternary,
      //App bar
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorsApp.bluePrimary,
          statusBarBrightness: Brightness.dark, //For iOS
          statusBarIconBrightness: Brightness.light, //For android
        ),
        centerTitle: true,
        backgroundColor: ColorsApp.white,
        elevation: ElevationApp.ev4,
        titleTextStyle: TextStylesApp.bold(
          color: ColorsApp.greyPrimary,
          fontSize: FontSizeApp.s26,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStylesApp.bold(
            color: ColorsApp.bluePrimary,
            fontSize: FontSizeApp.s16,
          ),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: ElevationApp.ev2,
          padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p24),
          fixedSize: const Size(ButtonSizeApp.width, ButtonSizeApp.height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
          ),
          backgroundColor: ColorsApp.bluePrimary,
          surfaceTintColor: ColorsApp.blueSecondary,
          textStyle: TextStylesApp.bold(
            color: ColorsApp.white,
            fontSize: FontSizeApp.s16,
          ),
        ),
      ),
      //Outline Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: ColorsApp.white,
          foregroundColor: ColorsApp.bluePrimary,
          fixedSize: const Size.fromHeight(SizeApp.s44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
            side: BorderSide(
              color: ColorsApp.bluePrimary,
              width: BorderWidthApp.w2,
            ),
          ),
          side: BorderSide(
            color: ColorsApp.bluePrimary,
            width: BorderWidthApp.w2,
          ),
          textStyle: TextStylesApp.bold(color: ColorsApp.bluePrimary),
        ),
      ),
      // Text theme
      textTheme: TextTheme(
        headlineLarge: TextStylesApp.bold(
          color: ColorsApp.greyPrimary,
          fontSize: FontSizeApp.s30,
        ),
        headlineMedium: TextStylesApp.bold(
          color: ColorsApp.greyPrimary,
          fontSize: FontSizeApp.s26,
        ),
        headlineSmall: TextStylesApp.bold(
          color: ColorsApp.greyPrimary,
          fontSize: FontSizeApp.s22,
        ),
        titleMedium: TextStylesApp.regular(
          color: ColorsApp.greyPrimary,
          fontSize: FontSizeApp.s16,
        ),
        labelMedium: TextStylesApp.regular(
          color: ColorsApp.greyPrimary,
          fontSize: FontSizeApp.s14,
        ),
        titleLarge: TextStylesApp.regular(
          color: ColorsApp.greyPrimary,
          fontSize: FontSizeApp.s18,
        ),
        labelLarge: TextStylesApp.regular(
          color: ColorsApp.greyPrimary,
          fontSize: FontSizeApp.s16,
        ),
      ),
      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsApp.bgInput,
        contentPadding: const EdgeInsets.all(PaddingApp.p12),
        hintStyle: TextStylesApp.regular(
          color: ColorsApp.greyTertiary,
          fontSize: FontSizeApp.s16,
        ).copyWith(letterSpacing: 0),
        labelStyle: TextStylesApp.medium(
          color: ColorsApp.greyPrimary,
          fontSize: FontSizeApp.s14,
        ),
        errorStyle: TextStylesApp.regular(
          color: Colors.transparent,
          fontSize: FontSizeApp.s14,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.bgLight,
            width: BorderWidthApp.w1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(BorderRadiusApp.r10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.greyPrimary,
            width: BorderWidthApp.w1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(BorderRadiusApp.r10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.error,
            width: BorderWidthApp.w1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(BorderRadiusApp.r10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.greyPrimary,
            width: BorderWidthApp.w1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(BorderRadiusApp.r10),
          ),
        ),
      ),
    );
  }
}
