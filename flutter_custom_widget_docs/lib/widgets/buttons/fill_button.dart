import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            !isEnable
                ? ColorsApp.greyTertiary
                : textColor != null
                ? textColor!
                : ColorsApp.white,
        disabledBackgroundColor: !isEnable ? ColorsApp.bgDisable : color,
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
}
