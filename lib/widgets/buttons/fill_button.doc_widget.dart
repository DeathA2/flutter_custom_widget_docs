// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class FilledButtonAppDocWidget implements Documentation {
  @override
  String get name => 'FilledButtonApp';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
    PropertyDoc(name: 'label', isRequired: true, isNamed: true, type: 'String'),
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
      name: 'variant',
      isRequired: false,
      isNamed: true,
      type: 'FilledButtonVariant',
      description: 'Which of the two looks to draw. See [FilledButtonVariant].',
      defaultValue: 'FilledButtonVariant.themed',
    ),
    PropertyDoc(
      name: 'fullWidth',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Fill the width the parent offers. [FilledButtonVariant.primaryCta] only.',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'large',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Large size: 56 tall instead of 52, 17pt label instead of 15, radius 18\n instead of 14. [FilledButtonVariant.primaryCta] only.',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'borderRadius',
      isRequired: false,
      isNamed: true,
      type: 'double?',
      description:
          'Overrides the corner radius of [FilledButtonVariant.primaryCta].',
    ),
  ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
    'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
  ];

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// The two ways of drawing a solid button.
enum FilledButtonVariant {
  /// `ElevatedButton` following the app `elevatedButtonTheme`. The default.
  themed,

  /// Primary CTA: rounded colour block, bold white label, scales down on press.
  primaryCta,
}

/// Solid button with built-in loading and disabled states.
@docWidget
class FilledButtonApp extends StatelessWidget {
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

  /// Which of the two looks to draw. See [FilledButtonVariant].
  final FilledButtonVariant variant;

  /// Fill the width the parent offers. [FilledButtonVariant.primaryCta] only.
  final bool fullWidth;

  /// Large size: 56 tall instead of 52, 17pt label instead of 15, radius 18
  /// instead of 14. [FilledButtonVariant.primaryCta] only.
  final bool large;

  /// Overrides the corner radius of [FilledButtonVariant.primaryCta].
  final double? borderRadius;

  const FilledButtonApp({
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
    this.variant = FilledButtonVariant.themed,
    this.fullWidth = true,
    this.large = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      FilledButtonVariant.themed => _buildThemed(),
      FilledButtonVariant.primaryCta => _buildPrimaryCta(),
    };
  }

  Widget _buildThemed() {
    return ElevatedButton(
      onPressed: isEnable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: !isEnable
            ? ColorsApp.greyTertiary
            : textColor != null
            ? textColor!
            : ColorsApp.white,
        disabledBackgroundColor: !isEnable ? ColorsApp.bgDisable : color,
        shadowColor: hasShadow ? ColorsApp.bgInput : Colors.transparent,
        textStyle: labelStyle,
        padding: paddingButton,
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: ColorsApp.white,
              ),
            )
          : Text(
              label,
              style: TextStyle(
                color: isEnable ? null : textColorDiable ?? ColorsApp.tetiary,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
    );
  }

  /// [isLoading] swaps the label for a spinner and blocks taps; [isEnable] fades
  /// to 55% through `AnimatedOpacity` so the change transitions instead of jumping.
  Widget _buildPrimaryCta() {
    final bool active = isEnable && !isLoading && onPressed != null;
    final Color background = color ?? CustomColors.brand;
    final Color foreground = textColor ?? CustomColors.white;
    final double radius = borderRadius ?? (large ? 18 : 14);

    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: label,
      deferTap: true,
      onTap: active ? onPressed : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 160),
        opacity: active ? 1 : 0.55,
        child: Container(
          width: fullWidth ? double.infinity : null,
          height: large ? 56 : 52,
          alignment: Alignment.center,
          padding: paddingButton ?? const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: isLoading
              ? SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    valueColor: AlwaysStoppedAnimation<Color>(foreground),
                  ),
                )
              : Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      labelStyle ??
                      TextStyle(
                        color: foreground,
                        fontWeight: FontWeight.w800,
                        fontSize: large ? 17 : 15,
                        height: 1.15,
                      ),
                ),
        ),
      ),
    );
  }
}
''';
}
