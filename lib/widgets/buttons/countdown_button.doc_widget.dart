// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class CountdownButtonAppDocWidget implements Documentation {
  @override
  String get name => 'CountdownButtonApp';

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
          name: 'label',
          isRequired: true,
          isNamed: true,
          type: 'String',
        ),
        PropertyDoc(
          name: 'isLoading',
          isRequired: false,
          isNamed: true,
          type: 'bool',
          defaultValue: 'false',
        ),
        PropertyDoc(
          name: 'color',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'textColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'textColorDiable',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'onPressed',
          isRequired: false,
          isNamed: true,
          type: 'void Function()?',
        ),
        PropertyDoc(
          name: 'isEnable',
          isRequired: false,
          isNamed: true,
          type: 'bool',
          defaultValue: 'true',
        ),
        PropertyDoc(
          name: 'hasShadow',
          isRequired: false,
          isNamed: true,
          type: 'bool',
          defaultValue: 'true',
        ),
        PropertyDoc(
          name: 'labelStyle',
          isRequired: false,
          isNamed: true,
          type: 'TextStyle?',
        ),
        PropertyDoc(
          name: 'paddingButton',
          isRequired: false,
          isNamed: true,
          type: 'EdgeInsetsGeometry?',
        ),
        PropertyDoc(
          name: 'countdownString',
          isRequired: false,
          isNamed: true,
          type: 'String',
          defaultValue: '',
        ),
      ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
        'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)'
      ];

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';

@docWidget
class CountdownButtonApp extends StatelessWidget {
  final String label;
  final bool isLoading;
  final Color? color;
  final Color? textColor;
  final Color? textColorDiable;
  final VoidCallback? onPressed;
  final bool isEnable;
  final bool hasShadow;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? paddingButton;
  final String countdownString;

  const CountdownButtonApp({
    super.key,
    required this.label,
    this.isLoading = false,
    this.color,
    this.textColor,
    this.textColorDiable,
    this.onPressed,
    this.isEnable = true,
    this.hasShadow = true,
    this.labelStyle,
    this.paddingButton,
    this.countdownString = '',
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isEnable && !isLoading) ? onPressed : null,
      style: ElevatedButton.styleFrom(
        foregroundColor:
            !isEnable
                ? ColorsApp.greyTertiary
                : textColor != null
                ? textColor!
                : ColorsApp.white,
        backgroundColor:
            !isEnable
                ? ColorsApp.bgDisable
                : countdownString.isNotEmpty
                ? ColorsApp.greyDivider
                : color,
        shadowColor: hasShadow ? ColorsApp.bgInput : Colors.transparent,
        textStyle: labelStyle,
        padding: paddingButton,
      ),
      child:
          isLoading
              ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: ColorsApp.white,
                ),
              )
              : countdownString.isNotEmpty
              ? Text(
                countdownString,
                style: TextStylesApp.medium(
                  color: ColorsApp.tetiary,
                  fontSize: FontSizeApp.s16,
                ),
              )
              : Text(
                label,
                style: TextStyle(
                  color: isEnable ? textColorDiable : ColorsApp.tetiary,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
    );
  }
}
''';
}
