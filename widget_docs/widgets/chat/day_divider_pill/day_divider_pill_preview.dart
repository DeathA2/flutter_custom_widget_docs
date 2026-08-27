import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/day_divider_pill.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/day_divider_pill.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = DayDividerPillDocWidget();

final dayDividerPillPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Day Divider Pill",
  description:
      "Separates conversation days. The label is decided by the list, which holds a single `now` for the whole thread, rather than by each divider reading the clock itself — per-widget clock reads let two dividers in one build disagree across midnight, and make every \"Today\" test depend on when it runs. It is a filled pill, not loose grey text, which on a conversation background would read as a system message.",
  dependencies: _documentation.dependencies,
  code: r'''
DayDividerPill(label: 'Today'),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      background: CustomColors.canvas,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          DayDividerPill(label: 'Today'),
          SizedBox(height: 12),
          DayDividerPill(label: 'Yesterday'),
          SizedBox(height: 12),
          DayDividerPill(label: 'August 12, 2026'),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// "Today" / "Yesterday" / a date, separating conversation days.
@docWidget
class DayDividerPill extends StatelessWidget {
  const DayDividerPill({required this.label, super.key});

  final String label;

  /// Picks the label for [day] relative to [now]. Pure, so the list can call it
  /// once per build and tests can pin the date.
  static String labelFor(
    DateTime day,
    DateTime now, {
    String today = 'Today',
    String yesterday = 'Yesterday',
  }) {
    final DateTime midnight = DateTime(now.year, now.month, now.day);
    final DateTime target = DateTime(day.year, day.month, day.day);
    return switch (midnight.difference(target).inDays) {
      0 => today,
      1 => yesterday,
      _ =>
        '${target.day.toString().padLeft(2, '0')}/'
            '${target.month.toString().padLeft(2, '0')}',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: CustomColors.neutral100.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: CustomColors.neutral500,
            ),
          ),
        ),
      ),
    );
  }
}
  ''',
);
