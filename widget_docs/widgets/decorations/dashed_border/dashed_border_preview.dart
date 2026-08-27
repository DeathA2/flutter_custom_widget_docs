import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/decorations/dashed_border.dart';
import 'package:flutter_custom_widget_docs/widgets/decorations/dashed_border.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = DashedBorderDocWidget();

final dashedBorderPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Dashed Border",
  description:
      "`Border.all` cannot draw dashes, so this walks the rounded path with `PathMetric.extractPath` and lays each segment down by hand. Dashes stay evenly spaced through the corners instead of bunching up the way four stitched-together edges do.",
  dependencies: _documentation.dependencies,
  code: r'''
DashedBorder(
  child: SizedBox(height: 120, child: Center(child: Text('Drop a file here'))),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: DashedBorder(
        color: CustomColors.brand,
        radius: 16,
        child: const SizedBox(
          height: 140,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.upload_file_rounded, size: 32),
                SizedBox(height: 8),
                Text('Drop a file here'),
              ],
            ),
          ),
        ),
      ),
    ),
  ),
  widgetCode: r'''
import 'dart:math' as math;
import 'dart:ui' show PathMetric;

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Rounded dashed border — for locked or empty slots.
@docWidget
class DashedBorder extends StatelessWidget {
  const DashedBorder({
    required this.child,
    this.color = CustomColors.neutral400,
    this.radius = 16,
    this.strokeWidth = 1.5,
    this.dash = 5,
    this.gap = 4,
    super.key,
  });

  final Widget child;
  final Color color;
  final double radius;
  final double strokeWidth;
  final double dash;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        color: color,
        radius: radius,
        strokeWidth: strokeWidth,
        dash: dash,
        gap: gap,
      ),
      child: child,
    );
  }
}

/// Painter behind [DashedBorder]. Public so it can be used straight from a
/// `CustomPaint` when the extra widget layer is not needed.
class DashedBorderPainter extends CustomPainter {
  const DashedBorderPainter({
    required this.color,
    required this.radius,
    this.strokeWidth = 1.5,
    this.dash = 5,
    this.gap = 4,
  });

  final Color color;
  final double radius;
  final double strokeWidth;
  final double dash;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rrect = RRect.fromRectAndRadius(
      (Offset.zero & size).deflate(strokeWidth / 2),
      Radius.circular(radius),
    );

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = color;

    final double step = dash + gap;
    if (step <= 0) return;

    for (final PathMetric metric
        in (Path()..addRRect(rrect)).computeMetrics()) {
      for (double start = 0; start < metric.length; start += step) {
        canvas.drawPath(
          metric.extractPath(start, math.min(start + dash, metric.length)),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter old) =>
      old.color != color ||
      old.radius != radius ||
      old.strokeWidth != strokeWidth ||
      old.dash != dash ||
      old.gap != gap;
}
  ''',
);
