import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = FilledButtonAppDocWidget();

final fillButtonPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Filled Button",
  description:
      "Solid button with two looks. `themed` follows the app elevatedButtonTheme, so restyling the theme restyles every button. `primaryCta` is a rounded colour block with a bold white label that scales down on press; its colour is fixed rather than taken from the theme, because this is the pay button and the save button, and a `primary` dragged around by a per-audience theme reads as decoration instead of the one button worth pressing. `isLoading` swaps the label for a spinner and blocks taps, `isEnable` fades to 55% through AnimatedOpacity so the change transitions instead of jumping.",
  dependencies: _documentation.dependencies,
  code: r'''
FilledButtonApp(
  label: 'Save changes',
  variant: FilledButtonVariant.primaryCta,
  onPressed: () {},
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilledButtonApp(
            label: 'Save changes',
            variant: FilledButtonVariant.primaryCta,
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          FilledButtonApp(
            label: 'Saving',
            variant: FilledButtonVariant.primaryCta,
            isLoading: true,
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          FilledButtonApp(
            label: 'Not ready yet',
            variant: FilledButtonVariant.primaryCta,
            isEnable: false,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          FilledButtonApp(label: 'Themed button', onPressed: () {}),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
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
  ''',
);
