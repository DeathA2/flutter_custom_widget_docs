import 'package:doc_widget/doc_widget.dart';
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
