import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/freshness_pill.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/freshness_pill.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = FreshnessPillDocWidget();

final freshnessPillPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Freshness Pill",
  description:
      "Small chip saying how fresh a reading still is. It appears next to every record on every screen, and the colour thresholds live in `FreshnessPill.colorFor` — one place, so no screen invents its own thresholds and describes the same moment differently.",
  dependencies: _documentation.dependencies,
  code: r'''
FreshnessPill(
  label: 'just now',
  color: FreshnessPill.colorFor(const Duration(minutes: 2)),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          FreshnessPill(
            label: 'just now',
            color: FreshnessPill.colorFor(const Duration(minutes: 2)),
          ),
          FreshnessPill(
            label: '18 minutes ago',
            color: FreshnessPill.colorFor(const Duration(minutes: 18)),
          ),
          FreshnessPill(
            label: '3 hours ago',
            color: FreshnessPill.colorFor(const Duration(hours: 3)),
          ),
        ],
      ),
    ),
  ),
  widgetCode: r'''
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
  ''',
);
