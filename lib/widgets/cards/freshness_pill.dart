import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Small chip saying how fresh a piece of information still is.
@docWidget
class FreshnessPill extends StatelessWidget {
  const FreshnessPill({
    required this.label,
    required this.color,
    this.icon = Icons.schedule_rounded,
    super.key,
  });

  final String label;
  final Color color;
  final IconData icon;

  /// Picks the colour from the age of the data. Thresholds live here, in one
  /// place, so no screen invents its own.
  static Color colorFor(Duration age) {
    if (age.inMinutes <= 5) return CustomColors.success;
    if (age.inMinutes <= 30) return CustomColors.warning;
    return CustomColors.neutral500;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 11, color: color),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
