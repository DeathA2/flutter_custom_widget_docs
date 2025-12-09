import 'package:doc_widget/doc_widget.dart';
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
