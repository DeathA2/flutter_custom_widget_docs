import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';

class TextStylesApp {
  //Add default color.
  static TextStyle regular({
    double fontSize = 16.0,
    required Color color,
    String fontFamily = FontFamilyApp.fontFamilyCeraPro,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightApp.regular,
      color: color,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  static TextStyle medium({
    double fontSize = 16.0,
    required Color color,
    String fontFamily = FontFamilyApp.fontFamilyCeraPro,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightApp.medium,
      color: color,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  static TextStyle bold({
    double fontSize = 18.0,
    required Color color,
    String fontFamily = FontFamilyApp.fontFamilyCeraPro,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightApp.bold,
      color: color,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }
}
