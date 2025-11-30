import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/gen/assets.gen.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/content/blood_pressure_7_factors.dart';

enum ArticleType { bloodPressure7Factors }

String selectImagePath(ArticleType articleType) {
  switch (articleType) {
    case ArticleType.bloodPressure7Factors:
      return Assets.images.bloodPressure7Factors.path;
  }
}

String selectArticleTitle(ArticleType articleType) {
  switch (articleType) {
    case ArticleType.bloodPressure7Factors:
      return 'What are 7 factors that affect blood pressure?';
  }
}

String selectFirstSentence(ArticleType articleType) {
  switch (articleType) {
    case ArticleType.bloodPressure7Factors:
      return 'Blood pressure-related diseases have many potential health risks.';
  }
}

Widget selectArticleContent(ArticleType articleType) {
  switch (articleType) {
    case ArticleType.bloodPressure7Factors:
      return const BloodPressure7Factors();
  }
}

Widget defaultStyleRichText(List<InlineSpan> content) {
  return RichText(
    textAlign: TextAlign.justify,
    text: TextSpan(style: regularArticleStyle(), children: content),
  );
}

TextStyle regularArticleStyle() {
  return TextStylesApp.regular(
    color: ColorsApp.greySecondary,
    fontSize: FontSizeApp.s14,
  ).copyWith(height: 22 / 14);
}

TextStyle mediumArticleStyle() {
  return TextStylesApp.medium(
    color: ColorsApp.greySecondary,
    fontSize: FontSizeApp.s14,
  ).copyWith(height: 22 / 14);
}
