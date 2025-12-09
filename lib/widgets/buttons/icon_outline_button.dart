import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_svg/svg.dart';

@docWidget
class IconOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  final Color? bgColor;
  final bool isEnable;
  const IconOutlinedButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.bgColor,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnable ? 1 : 0.3,
      child: OutlinedButton(
        onPressed: isEnable ? onPressed : null,
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p10),
        ),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.none,
          colorFilter: ColorFilter.mode(ColorsApp.bluePrimary, BlendMode.srcIn),
        ),
        // label: Text(label),
      ),
    );
  }
}
