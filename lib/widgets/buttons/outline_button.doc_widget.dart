// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class OutlinedButtonAppDocWidget implements Documentation {
  @override
  String get name => 'OutlinedButtonApp';

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
          name: 'hasBorder',
          isRequired: false,
          isNamed: true,
          type: 'bool',
          defaultValue: 'true',
        ),
        PropertyDoc(
          name: 'colorText',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'borderWidth',
          isRequired: false,
          isNamed: true,
          type: 'double?',
        ),
        PropertyDoc(
          name: 'borderColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'fontSizeText',
          isRequired: false,
          isNamed: true,
          type: 'double?',
        ),
        PropertyDoc(
          name: 'paddingButton',
          isRequired: false,
          isNamed: true,
          type: 'EdgeInsetsGeometry?',
        ),
        PropertyDoc(
          name: 'isLoading',
          isRequired: false,
          isNamed: true,
          type: 'bool',
          defaultValue: 'false',
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
import '../../../rsc/colors/color_manager.dart';
import '../../../rsc/fonts/font_manager.dart';
import '../../../rsc/styles/text_style.dart';

@docWidget
class OutlinedButtonApp extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool hasBorder;
  final double? borderWidth;
  final Color? colorText;
  final Color? borderColor;
  final double? fontSizeText;
  final EdgeInsetsGeometry? paddingButton;
  final bool isLoading;
  const OutlinedButtonApp({
    super.key,
    this.onPressed,
    required this.label,
    this.hasBorder = true,
    this.colorText,
    this.borderWidth,
    this.borderColor,
    this.fontSizeText,
    this.paddingButton,
    this.isLoading = false,
  });
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        side:
            !hasBorder || isLoading
                ? const BorderSide(color: Colors.transparent)
                : borderWidth != null
                ? BorderSide(
                  width: borderWidth!,
                  color: borderColor ?? ColorsApp.bluePrimary,
                )
                : null,
        backgroundColor: isLoading ? ColorsApp.bgDisable : null,
        padding: paddingButton,
      ),
      child:
          isLoading
              ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: ColorsApp.white,
                ),
              )
              : Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStylesApp.bold(
                  color: colorText != null ? colorText! : ColorsApp.bluePrimary,
                  fontSize: fontSizeText ?? FontSizeApp.s16,
                ),
              ),
    );
  }
}
''';
}
