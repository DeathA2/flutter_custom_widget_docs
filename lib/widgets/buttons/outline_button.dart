import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';

/// Outlined button — the secondary action standing next to [FilledButtonApp].
@docWidget
class OutlineButton extends StatelessWidget {
  const OutlineButton({
    required this.label,
    required this.onTap,
    this.busy = false,
    this.color = CustomColors.brand,
    super.key,
  });

  final String label;
  final VoidCallback? onTap;
  final bool busy;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: label,
      onTap: busy ? null : onTap,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color, width: 1.5),
        ),
        child: busy
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              )
            : Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),
      ),
    );
  }
}
