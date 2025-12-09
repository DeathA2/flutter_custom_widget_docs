// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SelectButtonDocWidget implements Documentation {
  @override
  String get name => 'SelectButton';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'key',
          isRequired: false,
          isNamed: true,
          type: 'Key?',
        ),
        PropertyDoc(
          name: 'isFocus',
          isRequired: true,
          isNamed: true,
          type: 'bool',
        ),
        PropertyDoc(
          name: 'onPressed',
          isRequired: false,
          isNamed: true,
          type: 'void Function()?',
        ),
        PropertyDoc(
          name: 'label',
          isRequired: true,
          isNamed: true,
          type: 'String',
        ),
        PropertyDoc(
          name: 'width',
          isRequired: false,
          isNamed: true,
          type: 'double?',
        ),
        PropertyDoc(
          name: 'normalBg',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'focusBg',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'normalTextColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'focusTextColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'icon',
          isRequired: false,
          isNamed: true,
          type: 'String?',
        ),
      ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
        'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
        'dep:flutter_svg: 2.2.1'
      ];

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_svg/svg.dart';

@docWidget
class SelectButton extends StatelessWidget {
  final bool isFocus;
  final Color? normalBg;
  final Color? focusBg;
  final Color? normalTextColor;
  final Color? focusTextColor;
  final String? icon;
  final VoidCallback? onPressed;
  final String label;
  final double? width;

  const SelectButton({
    super.key,
    required this.isFocus,
    this.onPressed,
    required this.label,
    this.width,
    this.normalBg,
    this.focusBg,
    this.normalTextColor,
    this.focusTextColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: PaddingApp.p14),
        ),
        fixedSize: WidgetStateProperty.all(
          width != null ? Size.fromWidth(width!) : null,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BorderRadiusApp.r6),
          ),
        ),
        elevation: WidgetStateProperty.all(ElevationApp.ev0),
        backgroundColor: WidgetStateProperty.all(
          isFocus
              ? (focusBg ?? ColorsApp.blueTertiary)
              : (normalBg ?? ColorsApp.bgInput),
        ),
        textStyle: WidgetStateProperty.all(
          TextStylesApp.bold(
            color:
                isFocus
                    ? (focusTextColor ?? ColorsApp.blueClick)
                    : (normalTextColor ?? ColorsApp.blueClick),
            fontSize: FontSizeApp.s14,
          ),
        ),
        foregroundColor: WidgetStateProperty.all(
          isFocus
              ? (focusTextColor ?? ColorsApp.blueClick)
              : (normalTextColor ?? ColorsApp.blueClick),
        ),
        overlayColor: WidgetStateProperty.all<Color>(
          focusBg ?? ColorsApp.greyDivider,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Container(
                margin: const EdgeInsets.only(right: MarginApp.m8),
                child: SvgPicture.asset(
                  icon!,
                  height: SizeApp.s16,
                  width: SizeApp.s16,
                ),
              )
              : Container(),
          Text(label),
        ],
      ),
    );
  }
}
''';
}
