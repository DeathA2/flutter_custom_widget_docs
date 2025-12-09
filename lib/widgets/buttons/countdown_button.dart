import 'package:doc_widget/doc_widget.dart';
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
