// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SectionButtonDocWidget implements Documentation {
  @override
  String get name => 'SectionButton';

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
          name: 'bgColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'leftIcon',
          isRequired: false,
          isNamed: true,
          type: 'String?',
        ),
        PropertyDoc(
          name: 'rightIcon',
          isRequired: false,
          isNamed: true,
          type: 'String?',
        ),
        PropertyDoc(
          name: 'colorText',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'icLeftColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'icRightColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'mainAxisAlignment',
          isRequired: false,
          isNamed: true,
          type: 'MainAxisAlignment',
          defaultValue: 'MainAxisAlignment.spaceBetween',
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
import 'package:flutter_custom_widget_docs/utils/strings.dart';
import 'package:flutter_svg/svg.dart';

@docWidget
class SectionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? bgColor;
  final String label;
  final String? leftIcon;
  final String? rightIcon;
  final Color? colorText;
  final Color? icLeftColor;
  final Color? icRightColor;
  final MainAxisAlignment mainAxisAlignment;

  const SectionButton({
    super.key,
    this.onPressed,
    required this.label,
    this.bgColor,
    this.leftIcon,
    this.rightIcon,
    this.colorText,
    this.icLeftColor,
    this.icRightColor,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          backgroundColor: bgColor,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Row(
              children: [
                isNotNullOrEmpty(leftIcon)
                    ? SvgPicture.asset(
                      leftIcon!,
                      colorFilter:
                          icLeftColor != null
                              ? ColorFilter.mode(icLeftColor!, BlendMode.srcIn)
                              : null,
                      height: SizeApp.s16,
                      width: SizeApp.s16,
                    )
                    : const SizedBox.shrink(),
                const SizedBox(width: PaddingApp.p9),
                Text(
                  label,
                  style: TextStylesApp.medium(
                    color:
                        colorText != null ? colorText! : ColorsApp.bluePrimary,
                    fontSize: FontSizeApp.s16,
                  ),
                ),
              ],
            ),
            isNotNullOrEmpty(rightIcon)
                ? SvgPicture.asset(
                  rightIcon!,
                  colorFilter:
                      icRightColor != null
                          ? ColorFilter.mode(icRightColor!, BlendMode.srcIn)
                          : null,
                )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
''';
}
