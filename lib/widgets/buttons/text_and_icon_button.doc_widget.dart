// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class TextAndIconButtonDocWidget implements Documentation {
  @override
  String get name => 'TextAndIconButton';

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
          name: 'text',
          isRequired: false,
          isNamed: true,
          type: 'String?',
        ),
        PropertyDoc(
          name: 'textColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'bgColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'borderColor',
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
          name: 'leftIconColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'rightIconColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'paddingVertical',
          isRequired: false,
          isNamed: true,
          type: 'double?',
        ),
        PropertyDoc(
          name: 'paddingHorizontal',
          isRequired: false,
          isNamed: true,
          type: 'double?',
        ),
        PropertyDoc(
          name: 'textStyle',
          isRequired: false,
          isNamed: true,
          type: 'TextStyle?',
        ),
        PropertyDoc(
          name: 'isEnable',
          isRequired: false,
          isNamed: true,
          type: 'bool',
          defaultValue: 'true',
        ),
        PropertyDoc(
          name: 'borderRadius',
          isRequired: false,
          isNamed: true,
          type: 'double?',
        ),
        PropertyDoc(
          name: 'isWrapContent',
          isRequired: false,
          isNamed: true,
          type: 'bool',
          defaultValue: 'false',
        ),
        PropertyDoc(
          name: 'leftIconSize',
          isRequired: false,
          isNamed: true,
          type: 'double?',
        ),
        PropertyDoc(
          name: 'rightIconSize',
          isRequired: false,
          isNamed: true,
          type: 'double?',
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
class TextAndIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? leftIcon;
  final String? rightIcon;
  final String? text;
  final Color? textColor;
  final Color? bgColor;
  final Color? borderColor;
  final Color? leftIconColor;
  final Color? rightIconColor;
  final double? borderWidth;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final TextStyle? textStyle;
  final bool isEnable;
  final double? borderRadius;
  final bool isWrapContent;
  final double? leftIconSize;
  final double? rightIconSize;

  const TextAndIconButton({
    super.key,
    this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.text,
    this.textColor,
    this.bgColor,
    this.borderColor,
    this.borderWidth,
    this.leftIconColor,
    this.rightIconColor,
    this.paddingVertical,
    this.paddingHorizontal,
    this.textStyle,
    this.isEnable = true,
    this.borderRadius,
    this.isWrapContent = false,
    this.leftIconSize,
    this.rightIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnable ? 1 : 0.3,
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? RadiusApp.r8),
        ),
        child: InkWell(
          splashColor: ColorsApp.appointmentCardGradient1.withValues(
            alpha: OpacityApp.opa60,
          ),
          onTap: onPressed,
          child: Ink(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal ?? PaddingApp.p8,
              vertical: paddingVertical ?? PaddingApp.p8,
            ),
            decoration: BoxDecoration(
              color: bgColor ?? Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? RadiusApp.r8),
              ),
              border: Border.all(
                color: borderColor ?? ColorsApp.bluePrimary,
                width: borderWidth ?? BorderWidthApp.w1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: isWrapContent ? MainAxisSize.min : MainAxisSize.max,
              children: [
                leftIcon != null
                    ? SvgPicture.asset(
                      leftIcon!,
                      width: leftIconSize,
                      height: leftIconSize,
                      colorFilter: ColorFilter.mode(
                        leftIconColor ?? ColorsApp.bluePrimary,
                        BlendMode.srcIn,
                      ),
                    )
                    : const SizedBox.shrink(),
                leftIcon != null && text != null
                    ? const SizedBox(width: MarginApp.m8)
                    : const SizedBox.shrink(),
                text != null
                    ? Text(
                      text!,
                      style:
                          textStyle ??
                          TextStylesApp.bold(
                            color: textColor ?? ColorsApp.bluePrimary,
                            fontSize: FontSizeApp.s14,
                          ),
                    )
                    : const SizedBox.shrink(),
                rightIcon != null && text != null
                    ? const SizedBox(width: MarginApp.m8)
                    : const SizedBox.shrink(),
                rightIcon != null
                    ? SvgPicture.asset(
                      rightIcon!,
                      width: rightIconSize,
                      height: rightIconSize,
                      colorFilter: ColorFilter.mode(
                        rightIconColor ?? ColorsApp.bluePrimary,
                        BlendMode.srcIn,
                      ),
                    )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
''';
}
