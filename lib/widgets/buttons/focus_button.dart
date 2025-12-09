import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';

@docWidget
class FocusButton extends StatelessWidget {
  final bool isFocus;
  final VoidCallback? onPressed;
  final String label;
  final double? width;

  const FocusButton({
    super.key,
    required this.isFocus,
    this.onPressed,
    required this.label,
    this.width,
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
          isFocus ? ColorsApp.blueTertiary : ColorsApp.bgInput,
        ),
        textStyle: WidgetStateProperty.all(
          TextStylesApp.medium(
            color: ColorsApp.blueClick,
            fontSize: FontSizeApp.s14,
          ),
        ),
        foregroundColor: WidgetStateProperty.all(ColorsApp.blueClick),
      ),
      child: Text(label),
    );
  }
}
